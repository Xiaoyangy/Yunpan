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

<title>登陆</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/login.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/login.js"></script>
<title></title>
	<script src="js/gVerify.js"></script>
	<script>
		$(function(){
			var verifyCode = new GVerify("v_container");
			document.getElementById("code_input").onblur = function(){
				var res = verifyCode.validate(document.getElementById("code_input").value);
				if(res){
					alert("验证正确");
				}else{
					alert("验证码错误");
				}
			}
		})
	</script>
</head>

<body>
	<div id="slider-title">
		<img src="${pageContext.request.contextPath }/img/logo.png" height="45" width="45" />
		<div id="title-logo">yun网盘</div>
	</div>
	<div class="slider">
		<ul class="slider-main">
			<li class="slider-panel"><a href="#" ><img
					alt="yun网盘" title="yun网盘" src="${pageContext.request.contextPath }/img/a.jpg"></a></li>
			<li class="slider-panel"><a href="#" ><img
					alt="yun网盘"   src="${pageContext.request.contextPath }/img/d.jpg"></a></li>
			<li class="slider-panel"><a href="#" ><img
					alt="yun网盘" title="yun网盘" src="${pageContext.request.contextPath }/img/g.jpg"></a></li>
			<li class="slider-panel"><a href="#" ><img
					alt="yun网盘" title="yun网盘" src="${pageContext.request.contextPath }/img/f.jpg"></a></li>
		</ul>
		<div class="slider-extra">
			<ul class="slider-nav">
				<li class="slider-item"></li>
				<li class="slider-item"></li>
				<li class="slider-item"></li>
				<li class="slider-item"></li>
			</ul>
		</div>
	</div>

	<div id="login">
		<form action="user/login.action" method="post">
			<div id="form-title">账号密码登录</div>
			<input type="text" placeholder="用户名" name="username" class="login-input" id="name" />
			<input type="password" placeholder="密码" name="password" class="login-input" /><br/>
<!-- 			<input type="checkbox" class="input" /><span class="ck_text">下次自动登录</span> -->
			<dd class="ipt_box">
				<input type="text" class="form-control" id="code_input" placeholder="请输入验证码" >
				<span id="v_container"></span>
			</dd>
			<input type="submit" value="登录" class="login-btn" /><br/>
<!-- 			<div id="a_div"> -->
<!-- 				<a href="#" class="a_login">登录遇到问题</a> <a class="a_login" href="#" -->
<!-- 					id="phone">海外手机号</a> -->
<!-- 			</div> -->
			<div id="bottom">
				<div id="inner">
					<div class="inner">
						<a href="#" class="a_inner">扫一扫登录</a>
					</div>
					<div class="img-login">
						<img src="${pageContext.request.contextPath }/img/weibo.png" width="25" height="25">
					</div>
					<div class="img-login">
						<img src="${pageContext.request.contextPath }/img/qq.png" width="25" height="25">
					</div>
					<div>
						<input type="submit" onclick="return regist()" value="立即注册" class="submit">
					</div>
					<div class="clearFloat"></div>
				</div>
			</div>
		</form>
	</div>
</body>
<script type="text/javascript">
	function regist(){
		window.location.href = "user/regist.action";
		return false;
	}
</script>
</html>
