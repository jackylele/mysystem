package com.sy.service;

import com.sy.entity.Basedata;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 */
public interface IBasedataService extends IService<Basedata> {
    /**
     * 条件获取查询内容
     * @param basedata
     * @return
     */
    List<Basedata> getBasedata(Basedata basedata);

}
