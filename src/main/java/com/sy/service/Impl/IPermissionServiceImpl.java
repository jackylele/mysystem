package com.sy.service.Impl;

import com.sy.entity.Permission;
import com.sy.exception.SysException;
import com.sy.mapper.PermissionMapper;
import com.sy.service.IPermissionService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author SPF
 * @since 2018-03-11
 */
@Service
public class IPermissionServiceImpl extends ServiceImpl<PermissionMapper, Permission> implements IPermissionService {
    @Autowired
    private PermissionMapper permissionMapper;

    @Override
    public List<Permission> getPermissions(String userId) {
        return permissionMapper.findPermissionByUserId(userId);
    }

}
