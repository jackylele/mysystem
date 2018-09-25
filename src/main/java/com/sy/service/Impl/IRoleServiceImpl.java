package com.sy.service.Impl;

import com.sy.entity.Role;
import com.sy.mapper.RoleMapper;
import com.sy.service.IRoleService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author SPF
 * @since 2018-03-11
 */
@Service
public class IRoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements IRoleService {
    @Override
    public List<Role> findRoleByUserId(String userId) {
        return this.baseMapper.findRoleByUserId(userId);
    }

    /**
     * 查询角色与用户
     */
    public List<Role> getRoleAndUsers(Map<String,Object> map){
        return this.baseMapper.getRoleAndUsers(map);
    }
}
