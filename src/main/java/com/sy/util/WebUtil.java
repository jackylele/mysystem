package com.sy.util;

import com.sy.common.Constants;
import com.sy.entity.Role;
import com.sy.entity.User;
import com.sy.exception.SysException;
import com.sy.security.Principal;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;


/**
 * @author
 *
 */
public class WebUtil {

    private static final Logger log = LoggerFactory.getLogger(WebUtil.class);

    /**
     * 获取当前用户
     *
     * @return 用户
     * @throws
     */
    public static User getUser() throws Exception {
        Principal principal = (Principal) SecurityUtils.getSubject().getPrincipal();
        if (principal == null) {
            log.error("## user don't login . user is null.");
            throw new SysException("user.illegal.login.error", "用户非法身份登录。");
        }

        User user = principal.getUser();
        if (user == null) {
            log.error("## user don't login . user is null.");
            throw new SysException("user.illegal.login.error", "用户非法身份登录。");
        }

        return user;
    }

    /**
     * 获取当前用户所在
     *
     * @return
     * @throws
     */
    public static List<Role> getRoles() throws SysException {
        Principal principal = (Principal) SecurityUtils.getSubject().getPrincipal();
        if (principal == null) {
            log.error("## user don't login . user is null.");
            throw new SysException("user.illegal.login.error", "用户非法身份登录。");
        }
        return principal.getRoles();
    }

}
