package com.sy.service.Impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.sy.entity.Config;
import com.sy.mapper.ConfigMapper;
import com.sy.service.IConfigService;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author SPF
 * @since 2018-03-10
 */
@Service
public class IConfigServiceImpl extends ServiceImpl<ConfigMapper, Config> implements IConfigService {
    /**
     * 条件查询获取数据
     */
    public List<Config> getConfig(String id) {
        return baseMapper.getConfig(id);
    }


}
