<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	</head>
	<style>
			#collection{
				display: block;
				width: 100%;
				height: 300px;
			}
			#collection a{
				text-decoration: none;
				font-family: "微软雅黑";
				font-size: 12px;
			}
			#collection ul{
				list-style: none;
			}
			#collection ul li{
				display: block;
				width: 100%;
			}
			#list-info{
				height: 40px;
				width: 100%;
				line-height: 220%;
			}
			.list-border{
				border-bottom:solid 1px #F2F6FD;
			}
			#collection li .para{
				font-family: "微软雅黑";
				font-size: 12px;
				color: #666;
			}
			#collection li #warn{
				float:left;
			}
			#collection li #clean{
				text-align: center;
				line-height: 30px;
				height: 30px;
				float:right;
				border:solid 1px #C0D9FE;
				margin: 4px 2px 0 0;
				border-radius: 5%;
				margin-right: 8px;
				padding-right: 5px;
			}
			#clean img{
				float: left;
				margin-top: 6px;
			}
			#clean span{
				float:left;
				color: #3B8CFF;
			}
			#clean:hover{
				opacity: 0.8;
				color: #91AFFF;
			}
			/*-----------list-show------------*/
			.list-collection{
				height: 25px;
				line-height: 25px;
			}
			/*-----------list-table-----------*/
			.list-table{
				height: 30px;
				width: 100%;
				line-height: 220%;
				font-size: 12px;
			}
			.list-table input{
				float:left;margin:7px 0 0 2px;
			}
			.list-table span{
				float: left;
			}
			.list-table span:hover,input:hover{
				background-color: #F6FAFF;
				cursor: pointer;
			}
			/*------list-show-----------*/
			.list-tr{
				height: 30px;
				width: 100%;
				line-height: 220%;
				font-size: 12px;
				margin-top:5px;
			}
			.list-tr input{
				float:left;margin:7px 0 0 2px;
			}
			.list-tr span{
				float: left;
			}
			.para1{
				font-family: "微软雅黑";
				font-size: 12px;
			}
			#revert{
				text-align: center;
				line-height: 19px;
				height: 20px;
				float:right;
				border:solid 1px #C0D9FE;
				border-radius: 5%;
				margin-right: 8px;
				padding-right: 5px;
			}
			#revert img{
				float:left;
			}
			#revert span{
				font-size: 12px;
				font-family: '微软雅黑';
				color: #3B8CFF;
			}
			#revert:hover{
				opacity: 0.8;
				color: #91AFFF;
			}
			.addSrc:hover{
				opacity: 0.8;
				color: #91AFFF;
				cursor: pointer;
			}
			#div1,#div2{
				border: 0;
			}
			/*----------------------*/
			#empty{
				width: 400px;
				text-align: center;
				vertical-align: middle;
				font-size: 12px;
				font-family: "微软雅黑";
				margin: 0 auto;
				margin-top: 5%;
			}
			#empty span{
				color: #666;
			}
			#empty a{
				text-decoration: none;
			}
	</style>
	<script type="text/javascript">
	function mouseOver(i){
		$(".list-tr").eq(i).css("background-color","#F6FAFF");
		$(".addSrc").eq(2*i).attr('src',"img/refresh1.png");
		$(".addSrc").eq(2*i+1).attr('src',"img/delete.png");
	}
	function mouseOut(){
		$(".list-tr").css("background-color","#FFFFFF");
		$(".addSrc").attr('src',"");
		$(".addSrc").attr('src',"");
	}
	
	function revertFile(obj){
		var id = $(obj).parent().parent().children(".oneCheck").attr("id");
		$.post("file/revertDirectory.action", {"fileId":id}, function(data){
			layer.msg(data.msg);
			window.location.reload();
		});
	}
	
	function revertAllFiles(){
		var $allFiles = $("input[name='check_name']:checked");
		var fileId = new Array();
		$.each($allFiles,function(i,n){
			fileId[i] = $(this).attr("id");
		});
		$.ajax({
			type:"POST",
			url:"file/revertDirectory.action",
			data:{
				"fileId":fileId,
			},
			success:function(data){
				layer.msg(data.msg);
				setTimeout('window.location.reload()',2500);
			},
			traditional:true
		});
	}
	
	function delAllFiles(){
		layer.confirm('确认清空回收站？', {
			  btn: ['确认','返回'] //按钮
			}, function(){
				$.ajax({
					type:"POST",
					url:"file/delAllRecycle.action",
					data:{
					},
					success:function(data){
						layer.msg(data.msg);
						window.location.reload()
					},
					traditional:true
				});
			}, function(){
		});
	}
	
	function delFile(obj){
		layer.confirm('确认删除？', {
			  btn: ['确认','返回'] //按钮
			}, function(){
				var id = $(obj).parent().parent().children(".oneCheck").attr("id");
				$.post("file/delRecycle.action", {"fileId":id}, function(data){
					layer.msg(data.msg);
					window.location.reload();
				});
			}, function(){
		});
	}
	
// 	function 
	
	$(document).ready(function(){
		/* 点击事件 */
		$("#fileCheck").click(function(){
			if($("#fileCheck").is(":checked")){
				$("#div2").attr('style',"display:block");
				$("#div1").attr('style',"display:none;");
				$(".oneCheck").prop('checked',true);
				$num = $("input:checked");
				$("#num").html($num.length-1);
			}
		})
		/* 移开事件 */
		$("#fileCheck").mouseup(function(){
			if($("#fileCheck").is(":checked")){
				$("#div1").attr('style',"display:block");
				$("#div2").attr('style',"display:none;");
				$(".oneCheck").prop('checked',false);
			}
		})
		
		
		$(".oneCheck").click(function(){
			if($(".oneCheck").is(":checked")){
				$("#div2").attr('style',"display:block");
				$("#div1").attr('style',"display:none;");
				$("#fileCheck").prop('checked',true);
				
				$num = $("input:checked");
				$("#num").html($num.length-1);
			}
		})
		$(".oneCheck").mouseup(function(){
			if($(".oneCheck").is(":checked")){
				$("#div1").attr('style',"display:block");
				$("#div2").attr('style',"display:none;");
				$("#fileCheck").prop('checked',false);
			}
		})
		
	})
	</script>
	<body>
		<c:choose>
			<c:when test="${findDelFile == null}">
				<div id="empty" style="display:block;">
					<img src="img/empty.png" />
					<p style="margin-bottom:20px;color: #878C8D;">您的回收站为空噢~</p>
					<span>
						回收站为你保存10天内删除的
						文件，想要延长保存时间？
						<p>
							开通会员
							<a href="#">延长至15天</a>开通超级会员
							<a href="#">延长至35天</a>
						</p>
					</span>
				</div>
			</c:when>
			<c:when test="${findDelFile != null}">
				<div style="display:block" id="collection">
					<ul>
						<li id="list-info" class="list-border"><span class="para" id="warn">提示:回收站不占用网盘空间，文件保存10天后
						将自动被清除。<a href="#" style="color: #3B8CFF;">开通会员</a>延长至15天,
						<a href="#" style="color: #3B8CFF;">开通超级会员</a>延长至30天</span>
						<span class="para" id="clean">
							<img src="img/delete.png"/>
							<span style="cursor: pointer;" onclick="delAllFiles()">清空回收站</span>
						</span>
						</li>
						<li class="list-collection" style="display: none">
							<span style="font-size: 12px;float:left;">回收站</span>
							<span style="font-size: 12px;float:right">已加载<span>1</span>个</span>
						</li>
						
						<li class="list-border">
							<input type="checkbox" id="fileCheck" style="float: left;margin-top: 0.6%;margin-left: 0.2%;"/>
							<div style="display: block;border: 0;" class="list-table" id="div1">
								<span style="width: 54%;height:100%;">文件名</span>
								<span style="width: 15%;height:100%;">大小</span>
								<span style="width: 16%;height:100%;">删除时间</span>
								<span style="width: 12%;height:100%;">有效时间</span>
							</div>
							<div style="display: none;border: 0;" class="list-table" id="div2">
								<span style="font-size: 12px;float:left;">
									<span style="float: left;">已选中</span>
									<span style="float: left;" id="num">1</span>个文件/文件夹
								</span>
								<span  onclick="revertAllFiles()" class="para1" id="revert" style="margin-top:4px;float: left;margin-left: 1.5%;">
									<img src="img/refresh1.png"/>
									<span style="cursor: pointer;">还原</span>
								</span>
							</div>
						</li>
						<c:forEach items="${findDelFile}" var="delFile" varStatus="index">
							<li class="list-tr" class="list-border" style="cursor:pointer;" onmouseover="mouseOver(${index.index})" onmouseout="mouseOut()">
								<input type="checkbox" class="oneCheck" name="check_name" id="${delFile.fileId }"/>
								<span style="width: 49%;height:100%;float:left;">
									<img style="float: left;margin: 3px 4px 0 5px;" src="img/picture.png" />
									<span style="float:left;">${delFile.fileName }</span>
								</span>
								<span style="float:left;margin-top: 0.5%;width:5%;">
										<img style="float:left" class="addSrc" src="" onclick="revertFile(this)"/>
										<img style="float: left;margin-left: 10px;" onclick="delFile(this)" class="addSrc" src="" />
								</span>
								<span style="width: 15%;height:100%;float:left;">${delFile.fileSize }</span>
								<span style="width: 16%;height:100%;float:left">${delFile.lastTime }</span>
								<span style="width: 12%;height:100%;float:left">10天</span>
							</li>
						</c:forEach>
					</ul>
				</div>
			</c:when>
		</c:choose>
	</body>
</html>