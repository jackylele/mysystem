package com.sy.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.toolkit.IdWorker;
import com.sy.entity.Config;
import com.sy.service.IConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author
 * @since 2018-03-10
 */
@Controller
@RequestMapping("/config")
public class ConfigController {

    @Autowired
    private IConfigService iConfigService;


    @RequestMapping("/config")
    public String basedata() {
        return "config";
    }

    /**
     * 条件查询获取数据
     */
    @ResponseBody
    @RequestMapping("/getConfig")
    public Map<String, Object> getConfig(String id) {

        Map<String, Object> map = new HashMap<>();
        try {
            List<Config> list = iConfigService.getConfig(id);
            map.put("aaData", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    /**
     * 修改或者添加
     */
    @ResponseBody
    @RequestMapping("updataConfig")
    public boolean updateConfig(@RequestBody Config config){
        boolean flag =false;
        try {
            if(config.getId() == null || "".equals(config.getId())){
                config.setId(IdWorker.get32UUID());
            }
            flag = iConfigService.insertOrUpdate(config);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

}
