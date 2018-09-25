package com.sy.controller;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.toolkit.IdWorker;
import com.sy.entity.Role;
import com.sy.entity.RolePermission;
import com.sy.entity.User;
import com.sy.entity.UserRole;
import com.sy.service.IRolePermissionService;
import com.sy.service.IRoleService;
import com.sy.service.IUserRoleService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 */
@Controller
@RequestMapping("/role")
public class RoleController {


    @Autowired
    private IRoleService iRoleService;

    @Autowired
    private IUserRoleService iUserRoleService;

    @Autowired
    private IRolePermissionService iRolePermissionService;

    /**
     * 页面跳转
     * @return
     */
    @RequestMapping("/role")
    public String role(){
        return "rolelist";
    }

    /**
     * 条件查询获取数据
     */
    @ResponseBody
    @RequestMapping("/getRole")
    public Map<String, Object> getRole(String id) {

        Map<String, Object> map = new HashMap<>();
        try {
            Map<String,Object> req = new HashMap<>();
            if(StringUtils.isNotEmpty(id)){
                req.put("id",id);
            }
            List<Role> list = iRoleService.getRoleAndUsers(req);
            iRoleService.delete(new Wrapper<Role>() {
                @Override
                public String getSqlSegment() {
                    return null;
                }
            })
            map.put("aaData", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    /**
     * 删除数据接口
     *
     * @param
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping("/delRole")
    public boolean delRole(String id) {
        boolean del = iRoleService.deleteById(id);
        return del;
    }

    /**
     * 获取用户角色
     */
    /**
     * 条件查询获取数据
     */
    @ResponseBody
    @RequestMapping("/getUserRole")
    public Map<String, Object> getUserRole(String id) {

        Map<String, Object> map = new HashMap<>();
        try {
            Map<String,Object> req = new HashMap<>();
            if(StringUtils.isNotEmpty(id)){
                req.put("user_id",id);
            }
            List<UserRole> list = iUserRoleService.selectByMap(req);
            map.put("aaData", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    /**
     * 编辑角色接口
     *
     * @param
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping("/editRole")
    public boolean editRole(String code,String id,String name,String remark,String perid) {
        Role role = new Role();
        if(StringUtils.isEmpty(id)){
            id=IdWorker.get32UUID();
        }
        role.setId(id);
        role.setRemark(remark);
        role.setName(name);
        role.setCode(code);
        boolean disableUser = iRoleService.insertOrUpdate(role);
        String[] perlist = perid.split(",");
        List<RolePermission> list = new ArrayList<>();
        for(String str:perlist){
            RolePermission u = new RolePermission();
            u.setId(IdWorker.get32UUID());
            u.setRoleId(id);
            u.setPermissionId(str);
            list.add(u);
        }
        Map map = new HashMap();
        map.put("role_id",id);
        iRolePermissionService.deleteByMap(map);
        iRolePermissionService.insertBatch(list);
        return disableUser;
    }



}
