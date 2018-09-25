package com.sy.controller;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.toolkit.IdWorker;
import com.sy.entity.Basedata;
import com.sy.service.IBasedataService;
import com.sy.util.CalUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author
 * @since 2018-03-06
 */
@Controller
@RequestMapping("/basedata")
public class BasedataController {
    private static final Logger log = LoggerFactory.getLogger(BasedataController.class);

    @Autowired
    private IBasedataService iBasedataService;

    /**
     * 基础数据页面访问
     *
     * @return
     */
    @RequestMapping("/basedata")
    public String basedata() {
//        Basedata basedata = new Basedata();
//        ModelAndView mav = new ModelAndView();
//        mav.addObject("basedata", basedata);
//        mav.setViewName("basedata");
//        return mav;
        return "basedata";
    }

    /**
     * 添加基础数据接口
     *
     * @param
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/inserBasedata")
    public boolean inserBasedata(String elevation, String distiance, String sampletime, String marks) throws Exception {
        boolean flag = false;
        try {
            Basedata basedata = new Basedata();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            basedata.setDistance(Float.parseFloat(distiance));
            basedata.setElevation(Float.parseFloat(elevation));
            basedata.setSampletime(sdf.parse(sampletime));
            basedata.setMarks(marks);
            basedata.setId(IdWorker.get32UUID());
            basedata.setRealdistace(CalUtil.CalRealDistance(basedata.getElevation(), basedata.getDistance()));
            basedata.setHigh(CalUtil.CalHigh(basedata.getElevation(), basedata.getDistance()));
            flag = iBasedataService.insert(basedata);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }

        return flag;
    }

    /**
     * 删除基础数据接口
     *
     * @param
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping("/delBasedata")
    public boolean delBasedata(String id) throws Exception{
        boolean del = iBasedataService.deleteById(id);
        return del;
    }

    /**
     * 查询基础数据接口
     *
     * @param
     * @param
     * @returnb
     */
    @ResponseBody
    @RequestMapping("/selectBasedata")
    public Map<String, Object> selectBasedata(@RequestParam(value = "sEcho", required = false) Integer sEcho) {

        // Map<String,Object> map = new HashMap<String, Object>();
        JSONArray json = null;
        List<Basedata> list = iBasedataService.selectList(new Wrapper<Basedata>() {
            @Override
            public String getSqlSegment() {
                return null;
            }
        });
        Page<Basedata> li = iBasedataService.selectPage(new Page<>());
        System.out.println(li.toString());
        json = JSONArray.fromObject(list);
        Map<String, Object> map = new HashMap<>();
        //map.put("aaData",li.getRecords());
        map.put("aaData", list);
        //页数信息配置
        map.put("sEcho", sEcho);
        map.put("iTotalRecords", li.getSize());
        map.put("iTotalDisplayRecords", li.getSize());
        //json = JSONObject.fromObject(map);
        return map;
    }

    /**
     * 条件查询获取数据
     */
    @ResponseBody
    @RequestMapping("/getBasedata")
    public Map<String, Object> getBasedata(@RequestBody Basedata basedata) {
        Map<String, Object> map = new HashMap<>();
        try {
            List<Basedata> list = iBasedataService.getBasedata(basedata);
            map.put("aaData", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    /**
     * 批量删除
     */
    @ResponseBody
    @RequestMapping("/batchDelBasedata")
    public boolean batchDelBasedata(HttpServletRequest request) {
        boolean flag = false;
        try {
            //接受的是一个被选择的productCheckBox
            String checkbox = request.getParameter("productCheckBox");
            //checkboxes 数组
            String[] checkboxes = checkbox.split("&");
            List<String> ids = new ArrayList<>();
            //把checkbox数组的所有id存到id的list集合中`
            for (int i = 0; i < checkboxes.length; i++) {
                String[] tmp = checkboxes[i].split("=");
                ids.add(tmp[1]);
            }
            flag = iBasedataService.deleteBatchIds(ids);
        }catch (Exception e){
            e.printStackTrace();
        }

        return flag;
    }

}
