package com.sy.exception;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class GlobalExceptionHandler {

	@ExceptionHandler()
	public ModelAndView handleException(Exception ex) {
		ModelAndView mv = new ModelAndView();
		String msg = "";

		// 根据不同错误转向不同页面
		try {
			 if (ex instanceof NullPointerException) {
				msg = ("NullPointerException异常：" + ex.getMessage());
			} else if (ex instanceof IllegalArgumentException) {
				msg = ("ParameterException exception异常: "+ ex.getMessage());
			} else if (ex instanceof org.springframework.web.multipart.MaxUploadSizeExceededException) {
				msg = ("文件大小超出限制异常:"+ ex.getMessage());
			} else {
				msg = (ex.getMessage());
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(StringUtils.isEmpty(msg)){
			msg = "未知错误";
		}
		mv.addObject("msg", msg);
		mv.setViewName("exception");
		return mv;
	}
}
