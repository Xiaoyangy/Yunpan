<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/7/6
  Time: 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<html>
<head>
    <title>个人中心</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link href="${pageContext.request.contextPath }/css/lightbox.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/layer.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/index.css"
          rel="stylesheet">
    <script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/lightbox.js"></script>
    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/layer.js"></script>
    <script
            src="${pageContext.request.contextPath }/js/ckplayer/ckplayer.js"></script>
    <script src="http://static.bcedocument.com/reader/v2/doc_reader_v2.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/js/index.js"></script>
    <style type="text/css">
        body{
            background-repeat:round;
            background-size:cover;
            background-color:rgba(245,245,245,.8);
        }
        .table {
            width: 50%;
            margin:auto;
            /* position: absolute; */
            margin-top:80px;
        }

        th, td {
            text-align: center;
        }
    </style>
    <script>
        var editPassword = function() {
            $("#password1").blur(function() {
                var num = $("#password1").val().length;
                if (num < 6) {
                    $("#tip2").html("<font color=\"red\" size=\"2\">  太短了</font>");
                } else if (num > 18) {
                    $("#tip2").html("<font color=\"red\" size=\"2\">  太长了</font>");
                } else {
                    $("#tip2").html("<font color=\"green\" size=\"2\"> OK</font>");
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
        var submitPassword = function() {
            var flag = true;
            var old = $("#oldpassword").val();
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
                    url : '/user/password.action',
                    data : {
                        old : old,
                        newpass : pass
                    },
                    success : function(result) {
                        if (result.code === 101) {
                            alert("修改成功");
                            $("#updatePassword").modal('hide');
                            $("#oldpassword").val("");
                            $("#password1").val("");
                            $("#password2").val("");
                            $("#tip1").empty();
                            $("#tip2").empty();
                            $("#tip3").empty();
                        } else {
                            alert("修改失败");
                        }
                    }
                });
            } else {
                alert("请输入正确数据");
            }
        }
    </script>
    <script>
        var updateVip = function() {
            $("#updateVip").modal();
        }
    </script>
    <script>
        var payVip = function() {
            var vipUpdata = $("#redemptionCode").val();
            $.ajax({
                type : 'POST',
                url : '/user/vip.action',
                data : {
                    vipUpdata : vipUpdata
                },
                success : function(result) {
                    if (result.code === 201) {
                        alert("兑换成功");
                    } else {
                        alert("兑换失败");
                    }
                }
            });
        }
    </script>
</head>
<body background="${pageContext.request.contextPath }/img/logo.png">
<from>
    <div class="top">
        <%@include file="top.jsp"%>
    </div>
    <table class="table table-hover" >
         
        <tr>
                
            <th>用户ID</th>    
            <td>${id}</td>
        </tr>
        <tr>
            <th>用户名</th>
            <td>${username}</td>
        </tr>
        <tr>
            <th>已用容量</th>
            <td>${countsize}</td>
        </tr>
        <tr>
            <th>总容量</th>
            <td>${totalsize}</td>
        </tr>
        <tr>
            <th>Vip</th>
            <td>${vip}</td>
        </tr>
        <tr>
            <td><button onclick="updateVip()"
                        class="btn btn-primary btn-flat" style="float: right">升级vip</button></td>
            <td>
                <button onclick="editPassword()" class="btn btn-warning btn-flat"
                        style="float: left">修改密码</button>
            </td>
        </tr>
    </table>
    <div class="modal fade" id="updatePassword" tabindex="-1">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="exampleModalLabel">密码修改</h4>
                </div>
                <div class="modal-body">
                    <form name="editForm">
                        <div class="form-group">
                            <%--@declare id="recipient-name"--%>
                            <label for="recipient-name">原密码：</label> <input type='password'
                                                                            id="oldpassword" class="form-control" name="oldpassword"
                                                                            required placeholder="原密码">
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
                    <button onclick="submitPassword()" class="btn btn-primary"
                            ng-disabled="editForm.$invalid">确定</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
                </form>
            </div>
        </div>
    </div>
    <br />

    <div class="modal fade" id="updateVip" tabindex="-1">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="vipModel">Vip兑换</h4>
                </div>
                <div class="modal-body">
                    <form name="editForm">
                        <div class="form-group">
                            <input type='text' id="redemptionCode" class="form-control"
                                   name="redemptionCode" required placeholder="兑换码">
                            <div style="display: inline" id="tip5"></div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button onclick="payVip()" class="btn btn-primary"
                            ng-disabled="editForm.$invalid">确定</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
                </form>
            </div>
        </div>
    </div>
</from>
</body>
</html>
