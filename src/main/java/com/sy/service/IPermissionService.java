package com.sy.service;

import com.sy.entity.Permission;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author SPF
 * @since 2018-03-11
 */
public interface IPermissionService extends IService<Permission> {
    /**
     * 查询用户所能访问的所有菜单
     *
     * @param userId
     *            用户ID
     * @return permissions 菜单
     */
    public List<Permission> getPermissions(String userId);

	
}
