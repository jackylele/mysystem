package com.sy.controller;

import javax.servlet.http.HttpSession;

import com.baomidou.mybatisplus.toolkit.IdWorker;
import com.sy.entity.UserRole;
import com.sy.service.IUserRoleService;
import com.sy.service.IUserService;
import com.sy.util.UtilHelper;
import com.sy.util.WebUtil;
import com.sy.util.salt.Digests;
import com.sy.util.salt.Encodes;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.sy.entity.User;

import java.util.*;


@Controller
@RequestMapping("/user")

//这里用了@SessionAttributes，可以直接把model中的user(也就key)放入其中
//这样保证了session中存在user这个对象
@SessionAttributes("user")
public class UserController {

	private static final Logger log = LoggerFactory.getLogger(UserController.class);


	@Autowired
	private IUserService userServivce;

	@Autowired
	private IUserRoleService iUserRoleService;
	
	//正常访问login页面
	@RequestMapping("/login")
	public String login(){
		return "login";
	}

	@RequestMapping("/register")
	public String register() {
		return "register";
	}

	@ResponseBody
	@RequestMapping(value = "/registeruser")
	public Map register(User user,  Model model)  throws Exception{
		if (log.isDebugEnabled()) {
			log.debug("## 用户注册 , 用户 名：{}");
		}
		Map map = new HashMap();
		String msg = "";
		try {

			map.put("name",user.getName());
			List list = userServivce.selectByMap(map);
			if(!UtilHelper.isEmpty(list)){
				msg= "注册失败，用户名已存在!";
			}else{
				String id =IdWorker.get32UUID();
				user.setId(id);
				user.setSalt("15424568");
				user.setStatus(1);
				entryptPassword(user);
				//插入用户表
				userServivce.insert(user);
				UserRole t  =new UserRole();
				t.setId(IdWorker.get32UUID());
				t.setUserId(id);
				t.setRoleId("2");
				//角色授权
				iUserRoleService.insert(t);
				msg="注册成功！";
			}

			map.put("msg",msg);

		}catch (Exception e){
			e.printStackTrace();
			throw  e;
		}

		return map;
	}
	
	//表单提交过来的路径
//	@RequestMapping("/checkLogin")
//	public String checkLogin(User user,Model model){
//
//		Map<String,Object> map = new HashMap<>();
//		map.put("name",user.getName());
//		map.put("password",user.getPassword());
//		//调用service方法
//		List<User> list = userServivce.selectByMap(map);
////		user = userServivce.checkLogin(user.getUsername(), user.getPassword());
//		//若有user则添加到model里并且跳转到成功页面
//		if(list != null && list.size()>0){
//			model.addAttribute("user",list.get(0));
//			return "success";
//		}
//		return "fail";
//	}

	/**
	 * 用户登录
	 */
	//表单提交过来的路径
	@RequestMapping("/checkLogin")
	public String checkLogin(User user,Model model) throws Exception{
		log.info("# 进入登录页面...");
		UsernamePasswordToken token = new UsernamePasswordToken(user.getName(),user.getPassword());
		Subject subject = SecurityUtils.getSubject();
		subject.login(token);
		if (!subject.isAuthenticated()) {
			log.error("# 非法登录系统，请先登录。");
			return "login";
		}

//		new UserValidator(UserValidator.LOGIN).validate(userCommand, result);
		User use = WebUtil.getUser();
		if (use.getStatus() != 1) {
			//result.reject("user.lock.error");
			subject.logout();
			return "login";
		}
		use.setLastLoginTime(new Date());
		userServivce.updateById(use);
		//userServivce.updateUserLastLoginTime(WebUtil.getUser());
		//return "redirect:/success";
		return "success";
	}
	
	//测试超链接跳转到另一个页面是否可以取到session值
	@RequestMapping("/anotherpage")
	public String hrefpage(){
		
		return "anotherpage";
	}
	
	//注销方法
	@RequestMapping("/outLogin")
	public String outLogin(HttpSession session){
		//通过session.invalidata()方法来注销当前的session
		session.invalidate();
		return "login";
	}

	/**
	 * 用户密码加密
	 *
	 * @param user
	 */

	private void entryptPassword(User user) {
		byte[] salt = Encodes.decodeHex(user.getSalt());
		byte[] hashPassword = Digests.sha1(user.getPassword().getBytes(), salt, 1024);
		user.setPassword(Encodes.encodeHex(hashPassword));
	}

	/**
	 * 用户管理
	 */
	@RequestMapping("/user")
	public String user(){
		return "userlist";
	}

	/**
	 * 条件查询获取数据
	 */
	@ResponseBody
	@RequestMapping("/getUser")
	public Map<String, Object> getConfig(String id) {

		Map<String, Object> map = new HashMap<>();
		try {
			Map<String,Object> req = new HashMap<>();
			if(StringUtils.isNotEmpty(id)){
				req.put("id",id);
			}
			List<User> list = userServivce.selectByMap(req);
			map.put("aaData", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 删除数据接口
	 *
	 * @param
	 * @param
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/delUser")
	public boolean delUser(String id) {
		boolean del = userServivce.deleteById(id);
		return del;
	}

	/**
	 * 禁用用户接口
	 *
	 * @param
	 * @param
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/disableUser")
	public boolean disableUser(String id,String flag) {
		User user = new User();
		user.setId(id);
		if("1".equals(flag)) {
			user.setStatus(0);
		}else{
			user.setStatus(1);
		}
		boolean disableUser = userServivce.updateById(user);
		return disableUser;
	}

	/**
	 * 编辑用户接口
	 *
	 * @param
	 * @param
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/editUser")
	public boolean editUser(String roleid,String id,String name,String realname,String password) {
		User user = new User();
		user.setId(id);
		user.setName(name);
		user.setPassword(password);
		user.setTrueName(realname);
		user.setSalt("15424568");
		user.setModifyTime(new Date());
		entryptPassword(user);
		boolean disableUser = userServivce.updateById(user);
		String[] rolelist = roleid.split(",");
		List<UserRole> list = new ArrayList<>();
		for(String str:rolelist){
			UserRole u = new UserRole();
			u.setId(IdWorker.get32UUID());
			u.setUserId(id);
			u.setRoleId(str);
			list.add(u);
		}
		Map map = new HashMap();
		map.put("user_id",id);
		iUserRoleService.deleteByMap(map);
		iUserRoleService.insertBatch(list);
		return disableUser;
	}
}
