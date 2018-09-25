package com.sy.mapper;

import com.sy.entity.Basedata;
import com.baomidou.mybatisplus.mapper.BaseMapper;

import java.util.List;
import java.util.Map;

/**
 * <p>
  *  Mapper 接口
 * </p>
 *
 * @author SPF
 * @since 2018-03-06
 */
public interface BasedataMapper extends BaseMapper<Basedata> {
    /**
     * 条件查询获取数据
     */
    List<Basedata> getBasedata(Basedata basedata);



}