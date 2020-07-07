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
    <title>个人中心</title>

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
                <th>countSize</th>
                <th>totalSize</th>
                <th>vip</th>
              </tr>
        </thead>
        <tbody>
            <tr>
                <td>${id}</td>
                <td>${username}</td>
                <td>${countsize}</td>
                <td>${totalsize}</td>
                <td>${vip}</td>
            </tr>
        </tbody>
    </table>
    <br/>
    <a href="/user/password.action" style="float:right" role="button" class="btn btn-danger">修改密码</a>
    <br />
    <a href="/user/vip.action" style="float:right" type="button" class="btn btn-primary">升级vip</a>
</from>
</body>
</html>
