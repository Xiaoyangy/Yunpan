<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>青软云盘</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/regist.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/js/regist.js"></script> --%>
<title></title>
</head>

<body>
	<!--header开始-->
	<div class="header">
		<div class="logo">
			<a href="user/regist.action" class="logo">注册账号</a>
		</div>
		<div class="login">
			<span>我已注册，现在就</span> <a href="user/login.action" class="login_icon">登录</a>
		</div>
		<div class="hr"></div>
	</div>
	<!--header结束-->

	<!--content开始-->
	<div class="content">
		<div class="reg">
			<form action="user/regist.action" method="post">
				<dl>
					<dt>用户名</dt> 
					<dd class="ipt_box">
						<input id="usr" name="username" type="text" placeholder="请设置用户名" /> <span
							class="clear"></span>
					</dd>
					<dd class="mes">
						<div class="tip">
							设置后不可更改<br>中英文均可，最长14个英文或7个汉字
						</div>
						<div class="error">
							<span class="error_icon"></span> <span></span>
						</div>
					</dd>
				</dl>

				<dl>
					<dt>密码</dt>
					<dd class="ipt_box">
						<input id="pwd" name="password" type="password" placeholder="请设置登录密码" />
						<span class="clear"></span>
					</dd>
					<dd class="mes">
						<div class="error">
							<span class="error_icon"></span> <span></span>
						</div>
						<ul>
							<li><span class="pwd_icon">○</span><span class="pwd_tip">长度为6~14个字符</span>
							</li>
							<li><span class="pwd_icon">○</span><span class="pwd_tip">支持数字、大小写字母和标点符号</span>
							</li>
							<li><span class="pwd_icon">○</span><span class="pwd_tip">不允许有空格</span>
							</li>
						</ul>
					</dd>
				</dl>

				<dl>
					<dt></dt>
					<dd class="ipt_box pro">
						<input id="agree" type="checkbox" checked /> <span>阅读并接受<a
							href="#">《XX用户协议》</a></span>
					</dd>
				</dl>
				<dl>
					<dt></dt>
					<dd>
						<input class="regBtn" type="submit" value="注册" />
					</dd>
					<dd class="mes">
						<div class="error agreeErr">
							<span class="error_icon"></span> <span>您还未接受百度用户协议</span>
						</div>
					</dd>
				</dl>
			</form>
		</div>

<!-- 		<div class="right"> -->
<!-- 			<h3 class="phoneReg">手机快速注册</h3> -->
<!-- 			<div> -->
<!-- 				<p class="p1">请使用中国大陆手机号，编辑短信：</p> -->
<!-- 				<p class="p2">6-14位字符（支持数字/字母/符号）</p> -->
<!-- 				<p class="p1">作为登录密码，发送至：</p> -->
<!-- 				<p class="p2">0000 00000 00000</p> -->
<!-- 				<p class="p3">即可注册成功，手机号即为登录帐号。</p> -->
<!-- 			</div> -->
<!-- 		</div> -->
	</div>
	<!--content结束-->

	<!--footer开始-->
	<div class="footer">
		<p>2017 ©XXXXXX</p>
	</div>
</body>
</html>
