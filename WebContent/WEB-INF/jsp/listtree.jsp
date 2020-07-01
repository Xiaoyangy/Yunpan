<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<li>  
			<div class="fla">
				<c:choose>
				<c:when test="${list.listdiretory>0}"><span class="open btn"></span></c:when>
				<c:otherwise><span class="close btn"></span></c:otherwise>
				</c:choose>
				<span class="pack btn"></span>
				<span class="ftext">${list.fileName}</span>
				<span class="path" style="display: none;" >${list.path }</span>
            </div> 
            <c:if test="${list.listdiretory>0}">  
            <ul class="ful none" id="id3">
               <c:forEach var="list" items="${list.listFile}">
                   <c:set var="list" value="${list}" scope="request"/>  
               	<jsp:include page="listtree.jsp"/>
               </c:forEach>              
            </ul>  
            </c:if>  
              
       	</li>
</body>
</html>