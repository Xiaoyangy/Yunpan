package com.yun.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yun.service.FileService;
import com.yun.service.SysService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yun.pojo.User;
import com.yun.service.UserService;

import java.io.PrintWriter;
import java.text.ParseException;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private FileService fileService;
	@Autowired
	private SysService sysService;
	/**
	 * 登录
	 * 
	 * @param request
	 * @param user
	 * @return
	 */
	@RequestMapping("/login")
	public String login(HttpServletRequest request, User user) throws ParseException {
		User exsitUser = userService.findUser(user);
		if(exsitUser != null){
			HttpSession session = request.getSession();
			session.setAttribute(User.NAMESPACE, exsitUser.getUsername());
			session.setAttribute("totalSize", exsitUser.getTotalSize());
			System.out.println("登陆成功");
			sysService.loginTime(exsitUser.getUsername());
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
					sysService.registTime(user.getUsername());
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
	/**
	 * 登录-移动端
	 * @param req
	 * @param rep
	 * @throws Exception
	 */
	@RequestMapping("/loginForApp")
	public void getjson(HttpServletRequest req, HttpServletResponse rep)
			throws Exception {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		System.out.println("安卓端访问中..............");

		PrintWriter writer = rep.getWriter();
		JSONObject object = new JSONObject();
		User exsitUser = userService.findUser(user);
		if(exsitUser != null){
			HttpSession session = req.getSession();
			session.setAttribute(User.NAMESPACE, exsitUser.getUsername());
			session.setAttribute("totalSize", exsitUser.getTotalSize());
			//object.put("result", exsitUser);
			object.put("ret", "1000");
			object.put("msg", "登录成功");
			object.put("data", exsitUser);
		} else {
			//object.put("result", "fail");
			object.put("ret", "1001");
			object.put("msg", "登录失败");
		}
		writer.println(object.toString());
		writer.flush();
		writer.close();
	}

	/**
	 * 注册-移动端
	 * @param req
	 * @param rep
	 * @throws Exception
	 */
	@RequestMapping("/registForApp")
	public void registForApp(HttpServletRequest req, HttpServletResponse rep)
			throws Exception {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		System.out.println("安卓端注册中..............");
		PrintWriter writer = rep.getWriter();
		JSONObject object = new JSONObject();

		if(username == null || password == null){
			//object.put("result", "error");//填写有误
			object.put("ret", "1003");
			object.put("msg", "填写有误");
		}else{
			User user = new User();
			user.setUsername(username);
			user.setPassword(password);
			User isRegUser = userService.findUser(username);
			if(isRegUser == null){
				boolean isSuccess = userService.addUser(user);
				if(isSuccess){
					//根据名字创建文件目录
					fileService.addNewNameSpace(req, user.getUsername());
					user.setPassword(password);
					User exsitUser = userService.findUser(user);
					HttpSession session = req.getSession();
					session.setAttribute(User.NAMESPACE, exsitUser.getUsername());//
					session.setAttribute("totalSize", exsitUser.getTotalSize());
					//object.put("result", exsitUser);
					object.put("ret", "1000");
					object.put("msg", "注册成功");
					object.put("data", exsitUser);
				}else{
					//object.put("result", "fail");//注册失败
					object.put("ret", "1001");
					object.put("msg", "注册失败");
				}
			}else{
				//object.put("result", "isExist");//已存在该用户
				object.put("ret", "1002");
				object.put("msg", "用户已存在");
			}
		}
		writer.println(object.toString());
		writer.flush();
		writer.close();
	}
}
