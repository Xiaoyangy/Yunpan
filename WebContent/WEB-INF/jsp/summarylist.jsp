<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">


<title>summarylist</title>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<link href="${pageContext.request.contextPath }/css/foder.css" rel="stylesheet" >
<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>

<script type="text/javascript">
$(function() {  
	$(".btn").click(function() {  
		/* 判断子菜单是否是隐藏的 */  
		if ($(this).parent(".fla").next().css("display") == "none") {  
			/*如果是隐藏 更换背景图片，由可打开图片变成可关闭图片 */  
			$(this).parent(".fla").children(".open").removeClass("open").addClass("close");  
			$(this).parent(".fla").children(".pack").removeClass("pack").addClass("packC");  
			/* 显示隐藏子树 */  
			$(this).parent(".fla").next().removeClass("none");  
		} else {  
			/* 否则更换背景图片，由可关闭图片变成可打开图片 */  
			$(this).parent(".fla").children(".close").removeClass("close").addClass("open");  
			$(this).parent(".fla").children(".packC").removeClass("packC").addClass("pack");  
			/* 隐藏正在显示子树 */  
			$(this).parent(".fla").next().addClass("none");  
		}  
	});  
	$("#base div").click(function(){
		$("#base div").removeClass("chooseup");
		var a = $("#base div").index($(this));
		$("#base div").eq(a).addClass("chooseup");
	});
}); 

</script>

</head>
<body>
<div>
	<ul class="ful">
		<li id="base">
			<div class="fla">
				<c:choose>
				<c:when test="${rootlist.listdiretory>0}"><span class="open btn"></span></c:when>
				<c:otherwise><span class="close btn"></span> </c:otherwise>
				</c:choose>
				<span class="pack btn"></span>
				<span class="ftext">${rootlist.fileName}</span>
				<span class="path" style="display: none;">${rootlist.path}</span>
			</div>
			<c:if test="${rootlist.listdiretory>0}">  
	            <ul class="ful none" id="id3">  
	               <c:forEach var="list" items="${rootlist.listFile}">  
	               		<c:set var="list" value="${list}" scope="request"/>  
	               		<jsp:include page="listtree.jsp"/>  
	               </c:forEach>
	            </ul>  
            </c:if>
		</li>
	</ul>
</div>

</body>
</html>