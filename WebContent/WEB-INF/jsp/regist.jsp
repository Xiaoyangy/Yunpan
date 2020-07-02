
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
	${message}
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
					<dt>验证码</dt>
					<p class="yzm"><input type="text" name="code" id="codeInput" class="code" placeholder="验证码">
						<span id="code" class="code_pic" title="看不清，换一张"></span></p>
					<p class="errorTips" id="errorTips"></p>
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
						<button href="javascript:;" type="submmit" name="sbm" class="sbm_btn" onclick="return check()">
							注册</button>
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
