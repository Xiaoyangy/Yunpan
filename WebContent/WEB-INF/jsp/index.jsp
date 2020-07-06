<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link href="${pageContext.request.contextPath }/css/lightbox.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/layer.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/index.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/js/lightbox.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/js/layer.js"></script>
<script src="${pageContext.request.contextPath }/js/ckplayer/ckplayer.js"></script>
<script src="http://static.bcedocument.com/reader/v2/doc_reader_v2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/index.js"></script>
	<script type="text/javascript">
		function startTime(){
			var today=new Date()
			var week=new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
			var year=today.getYear()
			var month=today.getMonth()+1
			var date=today.getDate()
			var day=today.getDay()
			var h=today.getHours()
			var m=today.getMinutes()
			var s=today.getSeconds()
			// add a zero in front of numbers<10
			h=checkTime(h)
			m=checkTime(m)
			s=checkTime(s)
			document.getElementById('time').innerHTML=" "+month+"月"+date+"日  "+week[day]+"  "+h+":"+m+":"+s+" "
			t=setTimeout('startTime()',500)
		}

		function checkTime(i){
			if (i<10)
			{i="0" + i}
			return i
		}
		function time(){
			today=new Date();
			function initArray(){
				this.length=initArray.arguments.length
				for(var i=0;i<this.length;i++)
					this[i+1]=initArray.arguments[i];
			}
			var d=new initArray(" 星期日"," 星期一"," 星期二"," 星期三"," 星期四"," 星期五"," 星期六");
			var month=today.getMonth()+1;
			var day=today.getDate();
			var str = month+"月"+day+"日"+d[today.getDay()+1];
			return str;
		}
	</script>

</head>
<body onload="startTime()">

	<div class="content">
		<div class="top">
			<%@include file="top.jsp"%>
		</div>
		<div class="bottom" onclick="">
			<div class="left">
				<%@include file="menu.jsp"%>
			</div>
			<div class="right">
				<jsp:include page="main.jsp"></jsp:include>
			</div>
		</div>
	</div>
	<%@include file="tab.jsp" %>
</body>
</html>
