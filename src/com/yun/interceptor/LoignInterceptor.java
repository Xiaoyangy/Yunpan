package com.yun.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yun.utils.UserUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoignInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception
	{
		String url = request.getRequestURI();
		if (url.contains("login.action") || url.contains("regist.action") || url.contains("share.action")
				|| url.contains("getShareFiles.action") || url.contains("download.action")
				|| url.indexOf("loginForApp.action") >= 0 || url.indexOf("getAppFiles.action") >= 0
				|| url.indexOf("uploadForApp.action") >= 0) {
			return true;
		}
		String username = UserUtils.getUsername(request);

		if (username != null) {
			return true;
		}
		response.sendRedirect("/user/login.action");
		return false;
	}

}
