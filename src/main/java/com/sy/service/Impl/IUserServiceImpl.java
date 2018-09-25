package com.sy.service.Impl;

import com.sy.entity.User;
import com.sy.mapper.UserMapper;
import com.sy.service.IUserService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author SPF
 * @since 2018-03-11
 */
@Service
public class IUserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {
	
}
