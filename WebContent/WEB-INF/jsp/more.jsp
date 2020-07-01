<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'more.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<style type="text/css">
			.table td{
				padding: 45px;
			}
			.table img{
				width: 100px;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<table border="0" class="table" align="center">
				<tr>
					<td><a href="#" title="分享动态"><img src="${pageContext.request.contextPath }/img/discovery_share11.png"/></a></td>
					<td><a href="#" title="垃圾文件清理"><img src="${pageContext.request.contextPath }/img/discovery_clear12.png"/></a></td>
					<td><a href="#" title="通话记录"><img src="${pageContext.request.contextPath }/img/discovery_record13.png"/></a></td>
					<td><a href="#" title="通讯录"><img src="${pageContext.request.contextPath }/img/discovery_contact14.png"/></a></td>
				</tr>
				<tr>
					<td><a href="#" title="短信"><img src="${pageContext.request.contextPath }/img/discovery_sms21.png"/></a></td>
					<td><a href="#" title="云冲洗"><img src="${pageContext.request.contextPath }/img/discovery_print22.png"/></a></td>
					<td><a href="#" title="手机找回"><img src="${pageContext.request.contextPath }/img/discovery_zhaohui23.png"/></a></td>
					<td><a href="#" title="文章"><img src="${pageContext.request.contextPath }/img/discovery_article24.png"/></a></td>
				</tr>
				<tr>
					<td><a href="#" title="记事本"><img src="${pageContext.request.contextPath }/img/discovery_note31.png"/></a></td>
					<td><a href="#" title="照片电影"><img src="${pageContext.request.contextPath }/img/discovery_director32.png"/></a></td>
					<td><a href="#" title="企业网盘"><img src="${pageContext.request.contextPath }/img/discovery_eyun33.png"/></a></td>
				</tr>
			</table>
		</div>
	</body>
</html>
