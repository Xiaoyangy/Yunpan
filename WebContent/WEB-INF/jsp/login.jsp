<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">

	<title>登陆</title>
	<!--用百度的静态资源库的cdn安装bootstrap环境-->
	<!-- Bootstrap 核心 CSS 文件 -->
	<link
			href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css"
			rel="stylesheet">
	<!--font-awesome 核心我CSS 文件-->
	<link
			href="//cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css"
			rel="stylesheet">
	<!-- 在bootstrap.min.js 之前引入 -->
	<script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
	<!-- Bootstrap 核心 JavaScript 文件 -->
	<script
			src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<!--jquery.validate-->
	<script type="text/javascript" src="js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="js/message.js"></script>

	<style type="text/css">
		body {
			background-color: white;
			background-size: cover;
			font-size: 16px;
		}
		.c1 {
			width: 600px;
			position: absolute;
			margin: 2rem auto;
			top: 34%;
			left: 34%;
			padding: 1em;
			background: hsla(0, 0%, 100%, .25) border-box;
			overflow: hidden;
			border-radius: 8px;
			box-shadow: 0 0 0 1px hsla(0, 0%, 100%, .3) inset, 0 .5em 1em
			rgba(0, 0, 0, 0.6);
			text-shadow: 0 1px 1px hsla(0, 0%, 100%, .3);
		}

		.c1:before {
			content: "";
			width: 700px;
			height: 300px;
			position: absolute;
			background: rgba(255, 255, 255, 0);
			top: 0;
			right: 0;
			bottom: 0;
			left: 0;
			margin: -30px;
			z-index: -1;
			-webkit-filter: blur(20px);
			filter: blur(30px);
		}

		.form-group {
			display: block;
			text-align: center;
		}

		.col-sm-10 {
			display: block;
			text-align: center;
			z-index: 10;
		}

		li {
			list-style: none;
		}

		.code_pic {
			display: block;
		}

		.yzm {
			height: 30px;
			margin: 0 auto;
			width: 40%;
			line-height: 35px;
			position: relative;
			margin-bottom: 10px;
		}

		.code {
			width: 40%;
			height: 30px;
			border: 0;
			border-color: transparent;
			font-size: 16px;
			border-radius: 5px;
			padding-left: 8px;
			float: left;
			text-align: center;
			vertical-align: top;
		}

		.code_pic {
			margin-left: 30px;
			vertical-align: top;
			display: block;
			width: 40%;
			height: 35px;
			background-color: #34495e;
			color: #FFF;
			float: left;
			top: 0px;
			left: 60%;
			border-radius: 5px;
			text-align: center;
			vertical-align: top;
		}

		.col-sm-offset-2.col-sm-10 {
			width: 150px;
			margin-top: 2px;
			margin-left: -15px;
			float: left;
		}

		.zhuc {
			float: left;
			margin-top: 2px;
		}

		.errorTips {
			width: 70%;
			color: red;
			font-size: 10px;
			margin: 0 auto;
			height: 30px;
			line-height: 12px;
			positon: absolute;
		}

		input {
			border-color: white;
			border-radius: 5px;
		}

		.modal-content {
			width:60%;
			z-index: 0; /* 为不影响内容显示必须为最高层 */
			position: relative;
			overflow: hidden;
			margin-left: 60px;
			color:white;
			background-color: rgba(0, 0, 0, 0.1)
		}

		.modal-content:before {
			content: ""; /* 必须包括 */
			position: absolute; /* 固定模糊层位置 */
			width: 300%;
			height: 300%;
			left: -100%; /* 回调模糊层位置 */
			top: -100%; /* 回调模糊层位置 */
			filter: blur(20px); /* 值越大越模糊 */
			z-index: -2; /* 模糊层在最下面 */
			background-color: rgba(0, 0, 0, 0.5); /* 为文字更好显示，将背景颜色加深 */

		}
	</style>

	<style type="text/css">
		* {
			margin: 0;
			padding: 0;
		}
		a {
			text-decoration: none;
		}

		.main_bar {
			width: 100%;
			height: 350px;
			margin-top: 200px;
		}

		.login_form {
			width: 30%;
			height: 80%;
			margin: 0 auto;
			/*border:2px solid #16A085;*/
			border-radius: 15px;
			padding: 10px;
			background: #ECF0F1;
		}

		.name, .pwd, .sbm_btn {
			display: block;
			width: 70%;
			margin: 0 auto;
			height: 35px;
			font-size: 16px;
			border-color: transparent;
			border-radius: 5px;
			border: 0;
			padding-left: 8px;
		}

		.name {
			margin-top: 20px;
		}

		.sbm_btn {
			text-align: center;
			background-color: #1abc9c;
			color: #fff;
			line-height: 35px;
		}

		.re_pwd {
			width: 25%;
			margin: 10px auto 10px;
		}

		.re_pwd a {
			text-decoration: none;
			font-size: 14px;
			color: #ccc;
		}

		.re_pwd a:hover {
			cursor: pointer;
			color: #16A085;
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
		function changeImg() {
			// 验证码组成库
			var arrays = new Array('1', '2', '3', '4', '5', '6', '7', '8', '9',
					'0', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k',
					'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w',
					'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I',
					'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U',
					'V', 'W', 'X', 'Y', 'Z');
			// 重新初始化验证码
			code = '';
			// 随机从数组中获取四个元素组成验证码
			for (var i = 0; i < 4; i++) {
				// 随机获取一个数组的下标
				var r = parseInt(Math.random() * arrays.length);
				code += arrays[r];
			}
			// 验证码写入span区域
			document.getElementById('code').innerHTML = code;

		}
	</script>

	<script>
		var login = function() {
			var flag = true;
			var error;
			// 获取用户输入的验证码
			var codeInput = document.getElementById('codeInput').value;
			if (codeInput.toLowerCase() == code.toLowerCase()) {
				flag = true;
			} else {
				error = '验证码错误，重新输入';
				flag = false;
				alert("验证码错误");
				changeImg();
				document.getElementById('errorTips').innerHTML = error;
				return false;
			}
			var uname = document.getElementById("uname").value;
			var pwd = document.getElementById("pwd").value;
			if (uname.length < 1 || pwd.length < 1) {
				flag = false;
			}
			if (flag) {
				$.ajax({
					type : 'POST',
					url : '/user/login.action',
					data : {
						username : uname,
						password : pwd
					},
					success : function(result) {
						if (result.code === 111) {
							alert("登录成功");
							window.location.href = 'index.action';
						} else {
							alert("账户或密码错误");
						}
					}
				});
			} else {
				alert("用户名或密码为空");
			}
		}
	</script>

</head>
<body onload="changeImg()" background="/img/backgro.png">

<!--  <div  class="slider-panel" style="position:fixed;margin-top:0px;"><a href="#" >
 <img alt="网盘" title="yun网盘" src="https://uploadbeta.com/api/pictures/random/?key=BingEveryday ">
 </div> -->

<div class="c1">
	<img src="${pageContext.request.contextPath }/img/logo.png"
		 height="45" width="45" z-index:50
		 style="filter: drop-shadow(2px 4px 6px black); float: left; position: absolute; margin-left: 20px;" ;/>
	<div class="col-sm-10">
		<ul>
			<li>用户名：<input type="text" name="uname" id="uname"
						   placeholder="请输入用户名" required></li>
			<br />
			<!-- </div>
        <div class="form-group"> -->
			<li>密&nbsp&nbsp&nbsp码：<input type="password" name="upwd"
										 id="pwd" placeholder="请输入密码" required></li>
		</ul>
	</div>
	<div class="c2">
		<p class="yzm">
			<input type="text" name="code" id="codeInput" class="code"
				   placeholder="验证码"> <span id="code" class="code_pic"
											title="看不清，换一张" onclick="changeImg()"></span>

		</p>
		<p class="errorTips" id="errorTips"></p>
	</div>
	<br />
	<br />

	<div class="col-sm-offset-2 col-sm-10">
		<span id="span1"></span>
	</div>
		<div class="col-sm-offset-2 col-sm-10">
			<button type="button" class="btn btn-primary" onclick="login()">登录</button>
		</div>
		<div class="zhuc">
			<button onclick="singIn()" class="btn btn-warning btn-flat"
					style="float: left">注册用户</button>
		</div>
	<div class="modal fade" id="updatePassword" tabindex="-1">
		<div class="modal-dialog" role="document">

			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">用户注册</h4>
				</div>
				<div class="modal-body">
					<form name="editForm">
						<div class="form-group">
							<%--@declare id="recipient-name"--%>
							<label for="recipient-name">用户名:</label> <input type='text'
																			id="username" class="form-control" name="username" required
																			placeholder="用户名">
							<div style="display: inline" id="tip1"></div>
						</div>
						<div class="form-group">
							<%--@declare id="message-text"--%>
							<label for="message-text">新密码:</label> <input type='password'
																		  id="password1" name="password1" class="form-control" required
																		  placeholder="长度为: 6-18">
							<div style="display: inline" id="tip2"></div>
						</div>
						<div class="form-group">
							<label for="message-text">再次输入:</label> <label for="password2"></label><input
								type='password' id="password2" name="password2"
								class="form-control" required placeholder="必须和第一次一样">
							<div style="display: inline" id="tip3"></div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button onclick="submitSing()" class="btn btn-primary"
							ng-disabled="editForm.$invalid">确定</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	</div>
</body>
</html>
