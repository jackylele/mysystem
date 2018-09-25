package com.sy.controller;

import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

@Controller
@RequestMapping("/api")
@Scope("prototype")
public class TestServlet {
    private static final Logger log= LoggerFactory.getLogger(TestServlet.class);


    @RequestMapping(value = "" , method = {RequestMethod.POST,RequestMethod.GET })
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        try{
            response.setCharacterEncoding("utf-8");
//            response.setContentType("text/json;charset=utf-8");
            request.setCharacterEncoding("utf-8");
            System.out.println(request.getParameter("marks"));
            //返回对象
            PrintWriter pw = response.getWriter();//获取输出流
            System.out.println("11");

            pw.write("11");

        }catch(Exception e){
            log.info("接口异常:"+e);
            e.printStackTrace();
        }
    }

}
