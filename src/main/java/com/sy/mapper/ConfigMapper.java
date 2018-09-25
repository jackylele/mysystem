package com.sy.mapper;

import com.sy.entity.Config;
import com.baomidou.mybatisplus.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
  *  Mapper 接口
 * </p>
 *
 * @author SPF
 * @since 2018-03-10
 */
public interface ConfigMapper extends BaseMapper<Config> {
    /**
     * 条件查询获取数据
     */
    public List<Config> getConfig(String id);
}