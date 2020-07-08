<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/7/6
  Time: 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<html>
<head>
    <title>查询系统日志</title>

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

</head>
<body>
<from>
        <div class="top">
            <%@include file="top.jsp"%>
        </div>
        <table class="table table-hover">
            <thead>
             <tr>
                    <th>id</th>
                    <th>username</th>
                    <th>time</th>
                    <th>opention</th>
                  </tr>
            </thead>
            <tbody>
            <c:forEach items="${sensor}" var="keyword">
                <tr>
                    <td>${keyword.id}</td>
                    <td>${keyword.loginname}</td>
                    <td>${keyword.logintime}</td>
                    <td>${keyword.des}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
</from>
</body>
</html>
