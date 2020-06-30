<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

	<nav class="navbar navbar-default navbar-fixed-top"
		style="background-color: #EFF4F8; margin-bottom: 0px; height: 10%; z-index: 50">
	<div class="container">
		<div class="navbar-header" style="float:left;">
			<span style="float: left;">
<%-- 			<img src="${pageContext.request.contextPath }/img/logo@2x.png"height="50px" /> --%>
			</span> <a class="navbar-brand" href="index.action"
				style="margin-left: 100px;">网盘</a> <a
				class="navbar-brand" href="#">分享</a> <a
				class="navbar-brand" href="#" target="main">更多</a>
		</div>
		<div id="navbar" style="float: right;">
			<ul class="nav navbar-nav">
				<li class="dropdown" style="width:100px">
					<a href="#" class="dropdown-toggle" id="user" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
					<img src="${pageContext.request.contextPath }/img/titalpicture.jpg" height="20px" class="img-circle"/>
					${username	 } <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">个人中心</a></li>
						<li><a href="user/logout.action">退出登录</a></li>
					</ul></li>
				<li><a>|</a></li>
				<li><a href="#" class="glyphicon glyphicon-bell" title="系统通知"></a></li>
				<li><a href="#" class="glyphicon glyphicon-list-alt"
					title="意见反馈"></a></li>
			</ul>
		</div>
	</div>
	</nav>
