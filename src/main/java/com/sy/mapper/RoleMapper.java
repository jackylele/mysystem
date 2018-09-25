package com.sy.mapper;

import com.sy.entity.Role;
import com.baomidou.mybatisplus.mapper.BaseMapper;

import java.util.List;
import java.util.Map;

/**
 * <p>
  *  Mapper 接口
 * </p>
 *
 */
public interface RoleMapper extends BaseMapper<Role> {
    /**
     * 根据用户查询对应所有角色
     *
     * @param userId
     *            用户
     * @return roles 所有角色
     */
    public List<Role> findRoleByUserId(String userId);

    /**
     * 查询角色与用户
     */
    public List<Role> getRoleAndUsers(Map<String,Object> map);
}