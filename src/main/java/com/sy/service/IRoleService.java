package com.sy.service;

import com.sy.entity.Role;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author SPF
 * @since 2018-03-11
 */
public interface IRoleService extends IService<Role> {
    /**
     * 根据用户查询对应所有角色
     *
     * @param userId
     *            用户Id
     * @return roles 所有角色
     */
    public List<Role> findRoleByUserId(String userId);

    /**
     * 查询角色与用户
     */
    public List<Role> getRoleAndUsers(Map<String,Object> map);
}
