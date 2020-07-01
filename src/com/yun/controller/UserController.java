package com.yun.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.yun.service.FileService;
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
	@Autowired
	private FileService fileService;
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
     		 System.out.println("登陆失败");
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
	public String regist(HttpServletRequest request, User user) throws Exception {
		if (!checkUser(user)) {
			System.out.println("注册失败");
			request.setAttribute("注册失败1", "注册失败1");
			return "regist";
		} else {
				boolean isSuccess = userService.addUser(user);
				if(isSuccess){
					System.out.println("注册成功");
					fileService.addNewNameSpace(request, user.getUsername());
					return "login";
				}else{
				request.setAttribute("注册失败2", "注册失败2");
				return "regist";
				}
		}

	}
	private boolean checkUser(User user) throws Exception {
		if(user.getUsername()==null||user.getPassword()==null) {
			System.out.println("账户或密码为空");
			return false;
		}
		if(user.getUsername().length()<3||user.getPassword().length()<3){
			System.out.println("账户或密码长度太短");
			return false;
		}
		if(!checkUsername(user.getUsername())){
     		 System.out.println("账户已经存在");
     		 return false;
		}
		if(!checkPasswordNum(user.getPassword())){
     		 System.out.println("密码不符合要求");
			return false;
		}
			return true;
	}
	private boolean checkUsername(String username) throws Exception {
		if(userService.findRepeatUsername(username))
		{
     		 System.out.println("用户名已经存在");
     		 return true;
		}
		return false;
	}
	private boolean checkPasswordNum(String passwd){
		if(passwd.length()<1) {
			return false;
		}else{
			Integer xiao=0; //小写字母
			Integer daxie=0; //大写字母
			Integer shuzi=0; //数字
			Integer teshu=0; //特殊字符
		for(Integer i=0;i<passwd.length();i++){
			if(passwd.charAt(i)>='a'&&passwd.charAt(i)<='z'){
				xiao=1;
			}else if(passwd.charAt(i)>='A'&&passwd.charAt(i)<='Z'){
				daxie=1;
			}else if(passwd.charAt(i)>='0'&&passwd.charAt(i)<='9'){
				shuzi=1;
			}else{
				teshu=1;
			}
		}
		if(xiao+daxie+shuzi+teshu>=2){
			return true;
		}
		return false;}
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
