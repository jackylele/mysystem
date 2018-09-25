package com.sy.controller;

import com.sy.entity.Permission;
import com.sy.entity.RolePermission;
import com.sy.entity.Tree;
import com.sy.entity.UserRole;
import com.sy.service.IPermissionService;
import com.sy.service.IRolePermissionService;
import net.sf.json.JSONArray;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 */
@Controller
@RequestMapping("/permission")
public class PermissionController {


    @Autowired
    private IPermissionService iPermissionService;

    @Autowired
    private IRolePermissionService iRolePermissionService;

    /**
     * 页面跳转
     * @return
     */
    @RequestMapping("/permission")
    public String role(){
        return "permissionlist";
    }

    /**
     * 条件查询获取数据
     */
    @ResponseBody
    @RequestMapping("/getPermission")
    public Map<String, Object> getRole(String id) {

        Map<String, Object> map = new HashMap<>();
        try {
            Map<String,Object> req = new HashMap<>();
            if(StringUtils.isNotEmpty(id)){
                req.put("id",id);
            }
            List<Permission> list = iPermissionService.selectByMap(req);
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
        boolean del = iPermissionService.deleteById(id);
        return del;
    }

    /**
     * 条件查询获取数据
     */
    @ResponseBody
    @RequestMapping("/getPermissionTree")
    public List getPermissionTree(String id) {
        JSONArray json = new JSONArray();
        Map<String, Object> map = new HashMap<>();
        List<Tree> list = new ArrayList<>();
        List<Permission> li = new ArrayList<>();
        try {
            Map<String,Object> req = new HashMap<>();
            if(StringUtils.isNotEmpty(id)){
                req.put("id",id);
            }
            li = iPermissionService.selectByMap(req);

            for(Permission p : li){
                Tree t = new Tree();
                t.setId(p.getId());
                t.setPid(p.getParentKey());
//                if(p.getParentKey() =)
//                t.setOpen(true);
                t.setName(p.getName());
                list.add(t);
            }
            //json= JSONArray.fromObject(list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    /**
     * 获取角色菜单
     */
    /**
     * 条件查询获取数据
     */
    @ResponseBody
    @RequestMapping("/getRolePer")
    public Map<String, Object> getRolePer(String id) {

        Map<String, Object> map = new HashMap<>();
        try {
            Map<String,Object> req = new HashMap<>();
            if(StringUtils.isNotEmpty(id)){
                req.put("role_id",id);
            }
            List<RolePermission> list = iRolePermissionService.selectByMap(req);
            map.put("aaData", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }
	
}
