package com.sy.service;

import com.baomidou.mybatisplus.service.IService;
import com.sy.entity.Config;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author SPF
 * @since 2018-03-10
 */
public interface IConfigService extends IService<Config> {

    /**
     * 条件查询获取数据
     */
    List<Config> getConfig(String id);

}
