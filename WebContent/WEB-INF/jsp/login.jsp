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
	<!--用百度的静态资源库的cdn安装bootstrap环境-->
	<!-- Bootstrap 核心 CSS 文件 -->
	<link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
	<!--font-awesome 核心我CSS 文件-->
	<link href="//cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
	<!-- 在bootstrap.min.js 之前引入 -->
	<script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
	<!-- Bootstrap 核心 JavaScript 文件 -->
	<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<!--jquery.validate-->
	<script type="text/javascript" src="js/jquery.validate.min.js" ></script>
	<script type="text/javascript" src="js/message.js" ></script>

	<style type="text/css">
		body{background-color: white;background-size:cover;font-size: 16px;}
	</style>
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

	<script>
		var singIn = function() {
			$("#password1").blur(function() {
				var num = $("#password1").val().length;
				if (num < 6) {
					$("#tip2").html("<font color=\"red\" size=\"2\"> 太短了</font>");
				} else if (num > 18) {
					$("#tip2").html("<font color=\"red\" size=\"2\"> 太长了</font>");
				} else {
					$("#tip2").html("<font color=\"green\" size=\"2\">OK</font>");
				}
			});
			$("#password2")
					.blur(
							function() {
								var tmp = $("#password1").val();
								var num = $("#password2").val().length;
								if ($("#password2").val() != tmp) {
									$("#tip3")
											.html(
													"<font color=\"red\" size=\"2\">  和第一次输入不同</font>");
								} else {
									if (num >= 6 && num <= 18) {
										$("#tip3")
												.html(
														"<font color=\"green\" size=\"2\">  OK</font>");
									} else {
										$("#tip3")
												.html(
														"<font color=\"red\" size=\"2\">  太短或太长</font>");
									}
								}
							});

			$("#updatePassword").modal();
		}
	</script>
	<script>
		var submitSing = function() {
			var flag = true;
			var username = $("#username").val();
			var pass = $("#password1").val();
			var pass2 = $("#password2").val();
			var num1 = $("#password1").val().length;
			var num2 = $("#password2").val().length;
			if (num1 != num2 || num1 < 2 || num2<2||num1>18 || num2 > 18
					|| pass != pass2) {
				flag = false;
			} else {
				flag = true;
			}
			if (flag) {
				$.ajax({
					type : 'POST',
					url : '/user/regist.action',
					data : {
						username : username,
						password : pass
					},
					success : function(result) {
						if (result.code === 901) {
							alert("注册成功");
							$("#updatePassword").modal('hide');
							$("#oldpassword").val("");
							$("#password1").val("");
							$("#password2").val("");
							$("#tip1").empty();
							$("#tip2").empty();
							$("#tip3").empty();
						} else {
							alert("注册失败");
						}
					}
				});
			} else {
				alert("请输入正确数据");
			}
		}
	</script>
<script>
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
</script>

	<script>
		var login=function ()
		{
			var flag=true;
			var error;
			// 获取用户输入的验证码
			var codeInput = document.getElementById('codeInput').value;
			if(codeInput.toLowerCase() == code.toLowerCase()){
					flag=true;
			}else{
				error = '验证码错误，重新输入';
				flag=false;
				alert("验证码错误");
				changeImg();
				document.getElementById('errorTips').innerHTML = error;
				return false;
			}
			var uname=document.getElementById("uname").value;
			var pwd=document.getElementById("pwd").value;
			if(uname.length<1||pwd.length<1){
				flag=false;
			}
			if(flag){$.ajax({
				type : 'POST',
				url : '/user/login.action',
				data : {
					username : uname,
					password : pwd
				},
				success : function(result) {
					if (result.code === 111) {
						alert("登录成功");
						window.location.href='index.action';
					} else {
						alert("账户或密码错误");
					}
				}
			});
			}else{
				alert("用户名或密码为空");
			}
		}

	</script>

</head>

<body onload="changeImg()">
	<div id="slider-title">
		<img src="${pageContext.request.contextPath }/img/logo.png" height="45" width="45" />
		<div id="title-logo">网盘</div>
	</div>
	<div class="slider">
		<ul class="slider-main">
			<li class="slider-panel"><a href="#" ><img
					alt="网盘" title="yun网盘" src="/img/a.jpg"></a></li>
		</ul>
		<div class="slider-extra">
			<ul class="slider-nav">
				<%--<li class="slider-item"></li>--%>
			</ul>
		</div>
	</div>


	<div class="col-sm-10">
		用户名：<input type="text" name="uname" id="uname" placeholder="请输入用户名" required>
	</div>
	<div class="form-group">
		密码：<input type="password" name="upwd" id="pwd" placeholder="请输入密码" required>
	</div>
	<div>
	<p class="yzm"><input type="text" name="code" id="codeInput" class="code" placeholder="验证码">
		<span id="code" class="code_pic" title="看不清，换一张" onclick="changeImg()"></span>
	<p class="errorTips" id="errorTips"></p>
	</div>
	<div class="col-sm-offset-2 col-sm-10">
		<button type="button" class="btn btn-primary" onclick="login()">登录</button>
	</div>

	<div class="col-sm-offset-2 col-sm-10">
		<span id="span1"></span>
	</div>


	<button onclick="singIn()" class="btn btn-warning btn-flat" style="float:left">注册用户</button>
	<div class="modal fade" id="updatePassword" tabindex="-1">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="exampleModalLabel">用户注册</h4>
				</div>
				<div class="modal-body">
					<form name = "editForm">
						<div class="form-group">
							<%--@declare id="recipient-name"--%><label for="recipient-name">用户名:</label>
							<input  type='text' id="username"  class="form-control" name="username" required placeholder="用户名">
							<div style="display: inline" id="tip1"></div>
						</div>
						<div class="form-group">
							<%--@declare id="message-text"--%><label for="message-text">新密码:</label>
							<input  type='password' id="password1" name="password1"  class="form-control" required placeholder="长度为: 6-18">
							<div style="display: inline" id="tip2"></div>
						</div>
						<div class="form-group">
							<label for="message-text">再次输入:</label>
							<label for="password2"></label><input type='password' id="password2" name="password2" class="form-control" required placeholder="必须和第一次一样">
							<div style="display: inline" id="tip3"></div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button onclick="submitSing()" class="btn btn-primary" ng-disabled="editForm.$invalid">确定</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function regist(){
		window.location.href = "user/regist.action";
		return false;
	}
</script>
</html>
