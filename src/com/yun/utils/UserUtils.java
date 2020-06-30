package com.yun.utils;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.DigestUtils;

import com.yun.pojo.User;

public class UserUtils {
	public static String getUsername(HttpServletRequest request) {
		return (String) request.getSession().getAttribute(User.NAMESPACE);
	}

	public static String MD5(String password) {
		if (password != null) {
			return DigestUtils.md5DigestAsHex(password.getBytes()).toUpperCase();
		} else {
			return null;
		}
	}
}
