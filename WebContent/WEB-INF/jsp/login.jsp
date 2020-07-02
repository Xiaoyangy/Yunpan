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
	<style type="text/css">
		*{
			margin:0;
			padding:0;
		}
		a{
			text-decoration: none;
		}
		.main_bar{
			width:100%;
			height: 350px;
			margin-top:200px;
		}
		.login_form{
			width:30%;
			height:80%;
			margin:0 auto;
			/*border:2px solid #16A085;*/
			border-radius: 15px;
			padding:10px;
			background: #ECF0F1;
		}
		.name,.pwd,.sbm_btn{
			display:block;
			width:70%;
			margin:0 auto;
			height:35px;
			font-size:16px;
			border-color:transparent;
			border-radius: 5px;
			border:0;
			padding-left:8px;

		}
		.yzm{
			height: 35px;
			margin:0 auto;
			width: 72%;
			line-height: 35px;
			position: relative;
			margin-bottom: 10px;
		}
		.code{
			width:50%;
			height: 35px;
			border:0;
			border-color: transparent;
			font-size:16px;
			border-radius: 5px;
			padding-left: 8px;
		}
		.code_pic{
			display: block;
			width:40%;
			height:35px;
			background-color: #34495e;
			color:#FFF;
			position: absolute;
			top: 0px;
			left:60%;
			border-radius: 5px;
			text-align: center;
		}
		.name{
			margin-top:20px;
		}
		.sbm_btn{
			text-align: center;
			background-color: #1abc9c;
			color:#fff;
			line-height: 35px;
		}
		.re_pwd {
			width: 25%;
			margin: 10px auto 10px;
		}
		.re_pwd a{
			text-decoration: none;
			font-size:14px;
			color: #ccc;
		}
		.re_pwd a:hover{
			cursor: pointer;
			color:#16A085;
		}
		.errorTips{
			width:70%;
			color:red;
			font-size: 14px;
			margin:0 auto;
			height: 20px;
			line-height:20px;
		}
	</style>

	<script src="js/gVerify.js"></script>
</head>

<body onload="changeImg()">
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
			<input type="password" placeholder="密码" name="password" class="login-input" id="password"/><br/>
<!-- 			<input type="checkbox" class="input" /><span class="ck_text">下次自动登录</span> -->
			<p class="yzm"><input type="text" name="code" id="codeInput" class="code" placeholder="验证码">
				<span id="code" class="code_pic" title="看不清，换一张"></span></p>
			<p class="errorTips" id="errorTips"></p>
				<button href="javascript:;" type="submmit" name="sbm" class="sbm_btn" onclick="return check()">
			登录</button>
			<script type="text/javascript">
				// 声明一个变量用于存储生成的验证码
				document.getElementById('code').onclick = changeImg;
				function changeImg(){
					// 验证码组成库
					var arrays=new Array(
							'1','2','3','4','5','6','7','8','9','0',
							'a','b','c','d','e','f','g','h','i','j',
							'k','l','m','n','o','p','q','r','s','t',
							'u','v','w','x','y','z',
							'A','B','C','D','E','F','G','H','I','J',
							'K','L','M','N','O','P','Q','R','S','T',
							'U','V','W','X','Y','Z'
					);
					// 重新初始化验证码
					code ='';
					// 随机从数组中获取四个元素组成验证码
					for(var i = 0; i<4; i++){
						// 随机获取一个数组的下标
						var r = parseInt(Math.random()*arrays.length);
						code += arrays[r];
					}
					// 验证码写入span区域
					document.getElementById('code').innerHTML = code;

				}

				// 验证验证码
				function check(){
					var error;
					// 获取用户输入的验证码
					var codeInput = document.getElementById('codeInput').value;
					if(codeInput.toLowerCase() == code.toLowerCase()){
						console.log('123');
						return true;
					}else{
						error = '验证码错误，重新输入';
						alert("验证码错误");
						document.getElementById('errorTips').innerHTML = error;
						return false;
					}
				}
			</script>
	<%--		<input type="submit" value="登录" class="login-btn"/><br/>--%>
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
