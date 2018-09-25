package com.sy.service.Impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.sy.entity.Basedata;
import com.sy.mapper.BasedataMapper;
import com.sy.service.IBasedataService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author
 * @since 2018-03-06
 */
@Service
public class IBasedataServiceImpl extends ServiceImpl<BasedataMapper, Basedata> implements IBasedataService {
    /**
     * 条件查询获取数据
     */
    public List<Basedata> getBasedata(Basedata basedata){
        return this.baseMapper.getBasedata(basedata);
    }
}
