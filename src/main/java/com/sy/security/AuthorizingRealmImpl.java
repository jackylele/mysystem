package com.sy.security;

import com.sy.common.Constants;
import com.sy.entity.*;
import com.sy.service.IPermissionService;
import com.sy.service.IRoleService;
import com.sy.service.IUserRoleService;
import com.sy.service.IUserService;
import com.sy.util.MenuUtil;
import com.sy.util.salt.Encodes;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.PostConstruct;
import java.util.*;

/**
 * 2018年3月14日10:11:23
 */
public class AuthorizingRealmImpl extends AuthorizingRealm {

    private static final Logger log = LoggerFactory.getLogger(AuthorizingRealmImpl.class);

    @Autowired
    private IUserService userService;

    @Autowired
    private IRoleService roleService;

    @Autowired
    private IPermissionService permissionService;

    @Autowired
    private IUserRoleService iUserRoleService;

    /**
     * 认证回调函数,登录时调用.
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
        try {
            if (log.isDebugEnabled()) {
                log.debug("## 正在验证用户登录...");
            }
            UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
            String username = token.getUsername();

            if (StringUtils.isBlank(username)) {
                log.error("## 非法登录 .");
                throw new AuthenticationException("非法用户身份");
            }
            //mp
            Map<String , Object> map1 = new HashMap<>();
            map1.put("name",username);
           List<User> list = userService.selectByMap(map1);
            User user = new User();
            if (null == list || list.size()==0) {
                log.error("## 用户不存在={} .", username);
                throw new AuthenticationException("账号或密码错误");
            }else {
                user = list.get(0);
            }

            byte[] salt = Encodes.decodeHex(user.getSalt());

             Principal principal = new Principal();
            principal.setUser(user);

            principal.setRoles(roleService.findRoleByUserId(user.getId()));

            List<Permission> li = permissionService.getPermissions(user.getId());
            List<PermissionVo> livo =  MenuUtil.getMenus(li);
            SecurityUtils.getSubject().getSession().setAttribute(Constants.PERMISSION_SESSION,livo);
            SecurityUtils.getSubject().getSession().setAttribute("user",user);

            SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(principal, user.getPassword(),ByteSource.Util.bytes(salt), getName());//ByteSource.Util.bytes(salt),
            return info;
        } catch (AuthenticationException e) {
            log.error("# doGetAuthenticationInfo error , message={}", e.getMessage());
            e.printStackTrace();
            throw e;
        }

    }

    /**
     * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用.
     */
    @SuppressWarnings("unchecked")
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        Principal principal = (Principal) principals.fromRealm(getName()).iterator().next();
        Session session = SecurityUtils.getSubject().getSession();

        // ---
        Set<String> permissions = new HashSet<String>();
        Object permisObj = session.getAttribute(Constants.PERMISSION_URL);
        if (null == permisObj) {
            Collection<Permission> pers = permissionService.getPermissions(principal.getUser().getId());
            for (Permission permission : pers) {
                permissions.add(permission.getName());
            }
            session.setAttribute(Constants.PERMISSION_URL, permissions);
        } else {
            permissions = (Set<String>) permisObj;
        }

        Set<String> roleCodes = new HashSet<String>();
        Object roleNameObj = session.getAttribute(Constants.ROLE_CODE);
        if (null == roleNameObj) {
            //mp
            Map<String , Object> map = new HashMap<>();
            map.put("user_id",principal.getUser().getId());
            for (UserRole role : iUserRoleService.selectByMap(map)) {
                roleCodes.add(role.getRoleId());
            }
            session.setAttribute(Constants.ROLE_CODE, roleCodes);
        } else {
            roleCodes = (Set<String>) roleNameObj;
        }

        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.setRoles(roleCodes);
        info.setStringPermissions(permissions);
        return info;
    }

    /**
     * 设定Password校验的Hash算法与迭代次数.
     */
    @PostConstruct
    public void initCredentialsMatcher() {
        HashedCredentialsMatcher matcher = new HashedCredentialsMatcher("SHA-1");
        matcher.setHashIterations(1024);
        setCredentialsMatcher(matcher);
    }

}
