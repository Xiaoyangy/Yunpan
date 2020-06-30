<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div id="shareTab" style="visibility:visible; display: none;"> 
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#shareTable" onclick="return changeShareTab(1)" aria-controls="home" role="tab" data-toggle="tab">公共链接</a></li>
    <li role="presentation"><a href="#shareTable" onclick="return changeShareTab(2)" aria-controls="home" role="tab" data-toggle="tab">私密链接</a></li>
    <li role="presentation"><a href="#officeTable" onclick="return changeShareTab(0)" aria-controls="home" role="tab" data-toggle="tab">失效链接</a></li>
  </ul>
 
  <!-- Tab panes -->
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="shareTable">
	    <div class="panel panel-default">
		  <table class="table table-hover">
    		<thead>
    			<tr>
    				<th width="37%">分享文件</th>
    				<th width="20%">分享时间</th>
    				<th width="35%">分享链接</th>
    				<th width="8%">操作</th>
    			</tr>
    		</thead>
    		<tbody>
    			
    		</tbody>
    		</table>
		</div>
    </div>
  </div>
</div>
<div id="fileTypeList" style="visibility:visible; display: none;"> 
  <!-- Nav tabs --> 
 <ul class="nav navbar-fixed-top nav-tabs"  role="tablist" style="background: white; margin-bottom: 40px; z-index: 0">
   <li role="presentation" class="active"><a href="#imageTab" onclick="return changeTypeTab('image')" aria-controls="imageTab" role="tab" data-toggle="tab">图片</a></li>
   <li role="presentation"><a href="#officeTab" onclick="return changeTypeTab('office')" aria-controls="officeTab" role="tab" data-toggle="tab">文档</a></li>
   <li role="presentation"><a href="#vidoTab" onclick="return changeTypeTab('vido')" aria-controls="vidoTab" role="tab" data-toggle="tab">视频</a></li>
   <li role="presentation"><a href="#audioTab" onclick="return changeTypeTab('audio')" aria-controls="audioTab" role="tab" data-toggle="tab">音乐</a></li>
   <li role="presentation"><a href="#documTab" onclick="return changeTypeTab('docum')" aria-controls="documTab" role="tab" data-toggle="tab">文本</a></li>
   <li role="presentation"><a href="#fileTab" onclick="return changeTypeTab('file')" aria-controls="fileTab" role="tab" data-toggle="tab">其他</a></li>
 </ul>
  
 
  <!-- Tab panes -->
  <div class="tab-content" style="margin-top: 42px;">
    <div role="tabpanel" class="tab-pane active" id="imageTab">
	</div>
    <div role="tabpanel" class="tab-pane" id="officeTab">
	  <div class="panel panel-default">
	  	<table class="table table-hover">
   		<thead>
   			<tr>
   				<th width="60%">文件名</th>
   				<th width="15%">文件大小</th>
   				<th width="35%">时间</th>
   			</tr>
   		</thead>
   		<tbody>
   			
   		</tbody>
   		</table>
		</div>
    </div>
    <div role="tabpanel" class="tab-pane" id="vidoTab">
    	<div class="panel panel-default">
	  	<table class="table table-hover">
   		<thead>
   			<tr>
   				<th width="60%">文件名</th>
   				<th width="15%">文件大小</th>
   				<th width="35%">时间</th>
   			</tr>
   		</thead>
   		<tbody>
   			
   		</tbody>
   		</table>
		</div>
    </div>
    <div role="tabpanel" class="tab-pane" id="audioTab">
    	<div class="panel panel-default">
	  	<table class="table table-hover">
   		<thead>
   			<tr>
   				<th width="60%">文件名</th>
   				<th width="15%">文件大小</th>
   				<th width="35%">时间</th>
   			</tr>
   		</thead>
   		<tbody>
   			
   		</tbody>
   		</table>
		</div>
    </div>
    <div role="tabpanel" class="tab-pane" id="documTab">
    	<div class="panel panel-default">
	  	<table class="table table-hover">
   		<thead>
   			<tr>
   				<th width="60%">文件名</th>
   				<th width="15%">文件大小</th>
   				<th width="35%">时间</th>
   			</tr>
   		</thead>
   		<tbody>
   			
   		</tbody>
   		</table>
		</div>
    </div>
    <div role="tabpanel" class="tab-pane" id="fileTab">
    	<div class="panel panel-default">
	  	<table class="table table-hover">
   		<thead>
   			<tr>
   				<th width="60%">文件名</th>
   				<th width="15%">文件大小</th>
   				<th width="35%">时间</th>
   			</tr>
   		</thead>
   		<tbody>
   			
   		</tbody>
   		</table>
		</div>
    </div>
  </div>
</div>