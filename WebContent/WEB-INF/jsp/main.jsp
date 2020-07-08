<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
	<div>
		<div class="navbar-header"
			style="margin-left: 10px; margin-top: 10px;">
<!-- 			<img id="ImgSrc" src="" height="10" width="10">
	 			<a class="btn btn-default glyphicon glyphicon-cloud-upload" href="#"
				style="font-size: 15px; height:40px; width: 100px;" onclick="return upload(this)">上传</a>
			 -->
			 <a href="javascript:;" class="file glyphicon glyphicon-cloud-upload">上传文件
			    <input type="file" id="input" name="input" onchange="upload()" multiple="multiple" />
			 </a>
		</div>
		<div id="menubutton">
			<a class="btn btn-default glyphicon glyphicon-folder-open"
				role="button"
				style="margin-left: 10px; margin-top: 10px; width: 100px;" onclick="newDire()">&nbsp;新建文件夹</a>
			<div class="btn-group" role="group" id="operation"
				style="margin-left: 10px; margin-top: 10px;">
				<a class="btn btn-default glyphicon glyphicon-share" href="#" onclick="return share(this)">分享</a>
				<a class="btn btn-default glyphicon glyphicon-download-alt" href="#" id="download" onclick="return downloadFileSelect(this)">下载</a>
				<a class="btn btn-default glyphicon glyphicon-trash" href="#" id="delete" onclick="return deleteall()">删除</a>
				<a class="btn btn-default" href="#" id="main-rename" onclick="return rename()">重命名</a> 
				<a class="btn btn-default" href="#" onclick="return copyto()">复制到</a>
				<a class="btn btn-default" href="#" id="main-moveto" onclick="return moveto()">移动到</a> 
				<a class="btn btn-default" href="#" style="width: 100px;">推送到云设备</a>
			</div>
			<div class="input-group"
				style="width: 200px; float: right; margin-top: 10px; margin-right: 50px;">
				<input type="text" class="form-control"
					aria-label="Amount (to the nearest dollar)"> <span
					class="input-group-addon glyphicon glyphicon-search" onclick="searchFile(this)"></span>
			</div>
		</div>
	</div>
	<div class="panel panel-default" style="margin-left: 10px; margin-top: 10px">
		<!-- Default panel contents -->
		<div class="panel-heading" id="pathnav">
			<a href="index.action" path="">yun盘 ></a>
			<span id="navPath">
			</span>
		</div>

		<div class="modal fade" id="addNewFileDire" tabindex="-1">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="newDire">新建文件夹</h4>
					</div>
					<div class="modal-body">
						<form name="editForm">
							<div class="form-group">
								<input type='text' id="addDireFactor" class="form-control"
									   name="addDireFactor" required placeholder="文件夹名称">
								<div style="display: inline" id="tip5"></div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button onclick="addDireFactory()" class="btn btn-primary"
								ng-disabled="editForm.$invalid">确定</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>
					</form>
				</div>
			</div>
		</div>


		<table class="table table-hover" id="mytable">
			<thead>
				<tr>
					<th><input id="checkAll" type="checkbox" aria-label="..."></th>
					<th colspan="4" width="60%">文件名</th>
					<th>大小</th>
					<th>修改时间</th>
				</tr> 
			</thead>
			<tbody id="list" currentPath="">
				
			</tbody>
  
		</table>
	</div>
