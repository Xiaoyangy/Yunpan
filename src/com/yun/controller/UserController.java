package com.yun.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yun.pojo.User;
import com.yun.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	/**
	 * 登录
	 * 
	 * @param request
	 * @param user
	 * @return
	 */
	@RequestMapping("/login")
	public String login(HttpServletRequest request, User user) {
		User exsitUser = userService.findUser(user);
		if(exsitUser != null){
			HttpSession session = request.getSession();
			session.setAttribute(User.NAMESPACE, exsitUser.getUsername());
			session.setAttribute("totalSize", exsitUser.getTotalSize());
			return "redirect:/index.action";
		}else{
			request.setAttribute("msg", "用户名或密码错误");
			return "login";
		}
	}

	/**
	 * 注册
	 * @param request
	 * @param user
	 * @return
	 */
	@RequestMapping("/regist")
	public String regist(HttpServletRequest request, User user) {
		if (user.getUsername() == null || user.getPassword() == null) {
			return "regist";
		} else {
			if (userService.addUser(user)) {
				return "login";
			} else {
				request.setAttribute("msg", "注册失败");
				return "regist";
			}
		}

	}

	/**
	 * 登出
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/user/login.action";
	}

}
