/**当前文件路径指针*/
var currentPath;
	$(document).ready(function() {
		getFiles("\\");
		countPercent();
		//全选
		$("#checkAll").click(function () {
				$("input[name='check_name']").prop("checked", $(this).prop("checked"));
				if($(this).prop("checked")){
					$("#operation").show();
				}else{
					$("#operation").hide()
				}
		});
		//显示隐藏操作栏
		$("#operation").hide()
	});
	function selectCheckbox(){
		$inputs = $("input[name='check_name']");
		var len = $inputs.filter(":checked").length;
		$("#checkAll").prop("checked", len == $inputs.length);
		$("#operation").show();
		if(len == 0){
			$("#operation").hide();
		}
	}
	/**计算容量百分比*/
	function countPercent(){
		var countSize = $("#countSize").text();
		var totalSize = $("#totalSize").text();
		var countSizeNum = parseFloat(countSize.substr(0, countSize.length - 2));
		var totalSizeNum = parseFloat(totalSize.substr(0, totalSize.length - 2));
		totalSizeNum *= (1024 * 1024 * 1024);
		if(!isNaN(countSizeNum)){
			var unit = countSize.substr(countSize.length - 2);
			if(unit == "KB"){
				countSizeNum *= 1024;
			}else if(unit == "MB"){
				countSizeNum *= (1024 * 1024);
			}else if(unit == "GB"){
				countSizeNum *= (1024 * 1024 * 1024);
			}
		}else{
			countSizeNum = 0;
		}
		var percent = Math.round(countSizeNum * 100 / totalSizeNum) + "%";
		$("#sizeprogress").css("width", percent).attr("aria-valuemax", totalSizeNum).text(percent);
	}
	/**获取文件列表*/
	function getFiles(path) {
		$.post("file/getFiles.action", {
			"path" : path
		}, function(data) {
			if (data.success) {
				currentPath = path;
				$("#list").empty();
				$("#checkAll").prop("checked",false);
				$.each(data.data, function() {
					$("#list").append('<tr><td><input onclick="selectCheckbox()" name="check_name" type="checkbox" aria-label="..."></td>' +
						'<td width="60%"><a href="#" prePath="' + path +'" fileType="' + this.fileType +'" onclick="return openFile(this)"><span class="glyphicon glyphicon-'+this.fileType+'" style="margin-right: 10px"></span>' + this.fileName + '</a></td>' +
						'<td width="32px">' +
						'</td>' +
						'<td width="32px"><a href="#"' +
						'class="glyphicon glyphicon-download-alt" title="下载" onclick="return downloadFile(this)"></a></td>' +
						'<td width="32px"><a href="#"' +
						'class="glyphicon glyphicon-option-horizontal" title="更多"></a></td>' +
						'<td>' + this.fileSize + '</td>' +
						'<td>' + this.lastTime + '</td></tr>');
				});
			}
		});
	}
	/**文件路径导航点击事件*/
	function theClick(obj) {
		getFiles($(obj).attr("path"));
		$(obj).nextAll().remove();
		return false;
	}
	/**导航栏添加导航项*/
	function navPath(path, currentPath) {
		$("#navPath").append(
				'<a href="#" path="' + path
						+ '" onclick="return theClick(this)">&nbsp;'
						+ currentPath + '&nbsp;&#62;</a>');
	}
	/**上传文件点击事件*/
	function upload(obj) {
		$("#input_file").click();
		return false;
	}

	/**上传文件*upload()*/
	function upload(){
		var files = document.getElementById("input").files;
		       
		if(files.length==0) {  
		    alert("请选择文件");  
		    return;  
		}
	    var index = layer.load(1, {
		  shade: [0.75,'#fff'] //0.1透明度的白色背景
		});
	    //我们可以预先定义一个FormData对象  
	    var formData=new FormData();  
	    for(var i=0;i<files.length;i++) {  
	        //将每个文件设置一个string类型的名字，放入到formData中，这里类似于setAttribute("",Object)  
	        formData.append("files",files[i]);  
	    }
	    formData.append("currentPath", currentPath);
	    $.ajax({     
			url: 'file/upload.action',  
			type: 'POST',  
			cache: false,
			//这个参数是jquery特有的，不进行序列化，因为我们不是json格式的字符串，而是要传文件  
			processData: false,  
			//注意这里一定要设置contentType:false，不然会默认为传的是字符串，这样文件就传不过去了  
			contentType: false,  
			data : formData,
			success : function(data) {
				if (data.success == true) {
					getFiles(currentPath);
					layer.closeAll('loading');
				}
			},
	    });  
	}
	/**
	多文件下载选择下载
	*/
	function downloadFileSelect(obj){
		var $download = $("input:checked");
		var downPath = "";
		$.each($download.parent().next().children(),function(i,n){
			downPath += "&downPath=" + $(this).text();
		});
		if($download.length <= 0){
			alert("必须选择一个");
			$download.removeAttr("checked");
		}else{
			return download(obj, downPath);
		}
	}
	/**
	 * 单文件下载按钮下载
	 */
	function downloadFile(obj){
		$file = $(obj).parent().prev().prev().children();
		var path = $file.attr("path");
		if(path==null){
			path = $file.text();
		}
		return download(obj, "&downPath="+ encodeURI(path));
	}
	/**
	 * 下载
	 */
	function download(obj, path){
		var url = "file/download.action?";
		url += ("currentPath=" + encodeURI(currentPath));
		url += path;
		$(obj).attr("href", url);
		return true;
	}
	/**
	重命名文件名 
	 */
	function rename() {
		var $check = $("input[name='check_name']:checked");
		if ($check.length > 1 || $check.length <= 0) {
			alert("必须选择一个");
			$check.removeAttr("checked");
		}else{
			var srcName = $check.parent().next().children().text();
			layer.prompt({title: '重命名', value : srcName}, function(destName, index){
				  if(destName.trim() == ""){
					  layer.close(index);
					  layer.msg('名字不合法，修改失败！');
				  }else{
					  $.post("file/renameDirectory.action",{
						  "currentPath":currentPath,
						  "srcName": srcName,
						  "destName":destName
					  },function(data){
						  if(data.success == true){
							  layer.msg('重命名成功');
							  layer.close(index);
							  getFiles(currentPath);
						  }
					  });
				  }
			});
		}
		return false;
	}

	/**
	 删除文件 */
	function deleteall() {
		var $id = $("input[name='check_name']:checked");
		var check = new Array();
		if($id.length < 1){
			alert("请选择至少一个");
		}else{
			$.each($id.parent().next().children(),function(i,n){
				check[i] = $(this).text();
			});
			//alert($id.parent().next().children().text());
			layer.confirm('确认删除？', {
				  btn: ['确认','返回'] //按钮
				}, function(){
					$.ajax({
						type:"POST",
						url:"file/delDirectory.action",
						data:{
							//难点1.数据封装时为currentPath,若加上
							//traditional:true可阻止深度序列化
							//深度序列化，
							//即能将数组过去，例子:
							//var arr = {score:{id:90,name:""},sunNum:{id:80,num:3}}
							//那么深度序列化则会将对象key值转换为name值   ->score[id]=90
							"currentPath":currentPath,
							"directoryName":check
						},
						success:function(data){
							layer.msg(data.msg);
							getFiles(currentPath);
						},
						traditional:true
					});
				}, function(){
				  
				});
		}
		return false;
	}

	/**新建文件夹 */
 	function buildfile(){
		layer.prompt({title: '新建文件夹'}, function(filename, index){
			  $.post("file/addDirectory.action",{
				  "currentPath":currentPath,
				  "directoryName":filename
			  },function(data){
				  layer.msg('新建文件夹'+filename+'成功');
				  layer.close(index);
				  getFiles(currentPath);
			  });
		});
		return false;
	}
	/** 复制文件及文件夹 */
	function copyto(){
		var $id = $("input:checked");
		var cancopy = "yes";
		var check = new Array();
		var targetdirectorypath = "";
		if($id.length<1){
			alert("请选择需要移动的文件");
		}else{
			layer.open({
				type: 2,			//0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
				tilte: '移动到',
				area: ['500px', '300px'],
				shade: 0.6,			//遮罩透明度，默认：0.3
				shadeclose: false,	//控制点击弹层外区域关闭，默认：false
				fixed: false, 		//鼠标滚动时，层是否固定在可视区域，默认：true
				maxmin: false,		//是否允许全屏最小化，默认：false
				resize: false,		//是否允许拉伸，默认：true
				anim: 0,				//0-6的动画形式，-1不开启，默认0
				scrollbar: true,		//是否允许浏览器出现滚动条，默认：true
				move: false,			//触发拖动的元素，默认是触发标题区域拖拽
				closeBtn: 0,			//提供了两种风格的关闭按钮，可通过配置1和2来展示,如果不显示，则closeBtn: 0，默认：1
				content: 'file/summarylist.action',
				btn: ['确定', '取消'],
				yes: function(index,layero){
					var tree = layer.getChildFrame('.chooseup > .path',index);
					targetdirectorypath = tree.html();
					$.each($id.parent().next().children(), function(i, n) {
						check[i] = $(this).text();
					});
					if(cancopy == "yes"){
						$.ajax({
							type : "POST",
							url : "file/copyDirectory.action",
							data : {
								"currentPath" : currentPath,
								"directoryName" : check,
								"targetdirectorypath" : targetdirectorypath
							},
							success : function(data) {
								layer.msg(data.msg);
								getFiles(currentPath);
							},
							traditional : true
						});
						layer.close(index);
					}
				},
				btn2: function(index,layero){
					layer.close(index);}
			});
		}
		return false;
	}
	/** 移动文件及文件夹 */
	function moveto(){
		var $id = $("input:checked");
		var canmove = "yes";
		var check = new Array();
		var targetdirectorypath = "";
		if($id.length<1){
			alert("请选择需要移动的文件");
		}else{
			layer.open({
				  type: 2,			//0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
				  tilte: '移动到',
				  area: ['500px', '300px'],
				  shade: 0.6,			//遮罩透明度，默认：0.3
				  shadeclose: false,	//控制点击弹层外区域关闭，默认：false
				  fixed: false, 		//鼠标滚动时，层是否固定在可视区域，默认：true
				  maxmin: false,		//是否允许全屏最小化，默认：false
				  resize: false,		//是否允许拉伸，默认：true
				  anim: 0,				//0-6的动画形式，-1不开启，默认0
				  scrollbar: true,		//是否允许浏览器出现滚动条，默认：true
				  move: false,			//触发拖动的元素，默认是触发标题区域拖拽
				  closeBtn: 0,			//提供了两种风格的关闭按钮，可通过配置1和2来展示,如果不显示，则closeBtn: 0，默认：1
				  content: 'file/summarylist.action',
				  btn: ['确定', '取消'],
				  yes: function(index,layero){
							var tree = layer.getChildFrame('.chooseup > .path',index);
							targetdirectorypath = tree.html();
// 							alert(targetdirectorypath + "---" + currentPath);
// 								\\music  music
// 								\music\aaa  music\aaa
							if(currentPath == ("\\\\" + targetdirectorypath)){
								layer.msg("不能移动到当前目录");
								layer.close(index);
								canmove = "no";
								return false;
							}
							$.each($id.parent().next().children(), function(i, n) {
								check[i] = $(this).text();
								var start = currentPath+"\\"+check[i];
								var end = "\\\\"+targetdirectorypath;
								if(end.length>=start.length && end.startsWith(start)){
									layer.msg("文件夹不能放在自身及其子文件夹内！");
									layer.close(index);
									canmove = "no";
									return false;
								}
							});
							if(canmove == "yes"){
								$.ajax({
									type : "POST",
									url : "file/moveDirectory.action",
									data : {
										"currentPath" : currentPath,
										"directoryName" : check,
										"targetdirectorypath" : targetdirectorypath
									},
									success : function(data) {
										layer.msg(data.msg);
										getFiles(currentPath);
									},
									traditional : true
								});
								layer.close(index);
							}
					  },
				  btn2: function(index,layero){
					  		layer.close(index);}
				});
		}
		return false;
	}
	/**查找文件*/
	function searchFile(obj){
		var reg = $(obj).prev().val();
		if(reg.trim() == "" || reg.trim() == null){
// 			if(currentPath != "\\"){
// 				window.location.reload();
				getFiles(currentPath); 
// 			}
		}else{
			$("#list").empty();
			$.post("file/searchFile.action", {
				"reg" : reg,
				"currentPath" : currentPath
			}, function(data) {
				if (data.success) {
// 					currentPath = path;
					$("#checkAll").prop("checked",false);
					$.each(data.data, function() {
						$("#list").append('<tr><td><input onclick="selectCheckbox()" name="check_name" type="checkbox" aria-label="..."></td>' +
							'<td width="60%"><a href="#" prePath="' + this.currentPath +'" fileType="' + this.fileType +'" onclick="return openFile(this)">' + this.fileName + '</a></td>' +
							'<td width="32px">' +
							'</td>' +
							'<td width="32px"><a href="#"' +
							'class="glyphicon glyphicon-download-alt" title="下载" onclick="return downloadFile(this)"></a></td>' +
							'<td width="32px"><a href="#"' +
							'class="glyphicon glyphicon-option-horizontal" title="更多"></a></td>' +
							'<td>' + this.fileSize + '</td>' +
							'<td>' + this.lastTime + '</td></tr>');
					});
				}
			});
		}
	}
	/**分享文件*/
	function share(obj){
		var $check = $("input:checked").not($("#checkAll"));
		if($check.length < 1){
			alert("请选择至少一个");
		}else{
			var shareFiles = $check.parent().next().children();
			var shareFile = new Array();
			for(var i = 0; i < shareFiles.length; i++){
				shareFile[i] = $(shareFiles[i]).text();
			}
			$.ajax({
				type:"POST",
				url:"shareFile.action",
				data:{
					"currentPath":currentPath,
					"shareFile":shareFile
				},
				traditional:true
				,success:function(data){
					layer.open({
						  title: '分享',
						  content: '<input id="url" value="' + joinUrl(data.data) + '" class="form-control" readonly="readonly"/>'
						  ,btn: ['复制到粘贴板', '返回'],
						  area: ['500px', '200px']
						  ,yes: function(index, layero){ 
						    //按钮【按钮一】的回调
							  copyUrl($("#url"));
						  },end: function(index, layero){ 
							$("input:checkbox").prop("checked", false);  
						  } 
					});
				}
			});
		}
		return false;
	} 
	/**copy Url到粘贴板*/
	function copyUrl(obj){
		  obj.select();
		  var successful = document.execCommand('copy');
		  if(successful){
			  layer.tips('复制成功', obj, {tips: 3});
		  }
	}
	/**拼接url*/
	function joinUrl(url){
		var host = window.location.href;
		host = host.substring(0, host.indexOf("/yun") + 5);
		return host + "share.action?shareUrl=" + url;
	}
	/**打开我的分享*/
	function openMyShare(){
		changeShareTab(1);
		layer.open({ 
			  type: 1, 
			  area: ['850px', '450px'],
			  title:false,
			  content: $("#shareTab")
			});
	}
	/**分享面板切换*/
	function changeShareTab(order){
		$.post("searchShare.action",{
			  "status":order
		  },function(data){
			  if(data.success){
				  $("#shareTable tbody").empty();
				  $.each(data.data, function(){
					  var opreate = '<button type="button" url="'+this.url+'" filePath="'+this.filePath+'" order="'+order+'" onclick="cancelShare(this)" ';
					  if(order == "0"){
						  opreate += 'class="btn btn-danger">删除</button>';
					  }else{
						  opreate += 'class="btn btn-warning">取消</button>';
					  }
					  $("#shareTable tbody").append('<tr><td><span class="glyphicon glyphicon-'+this.fileType+'" style="margin-right: 10px"></span>'+this.fileName+'</td><td>'+this.lastTime+'</td><td><input id="url" onFocus="copyUrl(this)" title="' + joinUrl(this.url) + '" value="' + joinUrl(this.url) + '" class="form-control" readonly="readonly"/></td><td>'+opreate+'</td></tr>');
				  });
				   
			  }
		  }
					
		);
		return false;
	}
	/**取消分享/删除分享*/
	function cancelShare(obj){
		var url = $(obj).attr("url");
		var filePath = $(obj).attr("filePath");
		var status = $(obj).attr("order");
		$.post("cancelShare.action",{
			"url":url,
			"filePath":filePath,
			"status":status
		},function(data){
			layer.msg(data.msg);
			if(data.success){
				changeShareTab(status);
			}
		});
	}
	/**查找文件*/
	function searchFileType(type){
		var tabName = type + "Tab";
		$("#fileTypeList li").has("a[aria-controls='"+tabName+"']").addClass("active").siblings().removeClass("active");
		$("#"+tabName).addClass("active").siblings().removeClass("active");
		changeTypeTab(type);
		layer.open({ 
			  type: 1, 
			  zIndex : 80,
			  area: ['890px', '450px'],
			  title:false,
			  content: $("#fileTypeList")
			});
		return false;
	}
	/**切换文件类型*/
	function changeTypeTab(type){
		$.post("file/searchFile.action", {
			"regType" : type
		}, function(data) {
			if (data.success) {
				var typeName = type+"Tab";
				if(type == "image"){
					$("#"+ typeName).empty();
					$.each(data.data, function() {
						var url = encodeURI('currentPath='+this.currentPath+'&fileType='+this.fileType+'&fileName='+this.fileName);
						$("#"+ typeName).append('<a href="file/openFile.action?'+url+'" data-lightbox="roadtrip" title="'+this.fileName+'"><img alt="'+this.fileName+'" style="margin: 10px" src="file/openFile.action?'+url+'" width="150" height="150"></a>')
					});
				}else{
					$("#"+ typeName + " tbody").empty();
					$.each(data.data, function() {
						$("#"+ typeName + " tbody").append('<tr><td><a href="#" onclick="return openFile(this)" filetype="'+this.fileType+'" currentPath="'+this.currentPath+'"><span class="glyphicon glyphicon-'+this.fileType+'" style="margin-right: 10px"></span>'+this.fileName+'</a></td><td>'+this.fileSize+'</td><td>'+this.lastTime+'</td></tr>');
					});
				}
			}
		});
		return false;
	}
	/**分类型打开文件*/
	function openFile(obj) {
		var fileType = $(obj).attr("filetype")
		var fileName = $(obj).text();
		var parentPath = $(obj).attr("currentPath") == null ? currentPath : $(obj).attr("currentPath");
		var url = encodeURI('currentPath='+parentPath+'&fileType='+fileType+'&fileName='+fileName);
		alert(url);
		if (fileType == "folder-open") {
			var prePath = $(obj).attr("prePath");
			var path = prePath + "\\" + fileName;
			getFiles(path);
			navPath(path, fileName); 
		} else if(fileType.indexOf("image") >= 0){
			$(obj).attr({"href":"file/openFile.action?"+url,"data-lightbox":"test","data-title":fileName});
			return true;
		} else if(fileType.indexOf("office") >= 0){
			$.post("file/openOffice.action", {
				"currentPath" : parentPath,
				"fileType" : fileType,
				"fileName" : fileName,
			}, function(data){
				if(data.success){
					openOffice(data.data);
				}else{
					layer.msg(data.msg);
				}
			});
		} else if(fileType.indexOf("audio") >= 0){
			layer.open({
				type:2,
				title:'播放',
				content:'file/openAudioPage.action?' + url,
				shade: [0],
				area: ['440px', '120px'],
				offset: 'rb', //右下角弹出
			});
		} else if(fileType.indexOf("docum") >= 0){
			$.post("file/openFile.action", {
				"currentPath" : parentPath,
				"fileType" : fileType,
				"fileName" : fileName,
			}, function(data){
				layer.open({ 
					  type: 1, 
					  area: ['720px', '570px'],
					  title:false,
					  scrollbar: false,
					  content: '<textarea rows="50" cols="150">'+data+'</textarea>'
					});
			});
		} else if(fileType.indexOf("vido") >= 0){
			layer.open({ 
				  type: 1, 
				  area: ['480px', '400px'],
				  title:false,
				  content: '<div id="a1"></div>'
				});
			var flashvars={
			        f:'file/openFile.action?' + url,
//					f:'http://movie.ks.js.cn/flv/other/1_0.flv',
			        c:0,
			        p:1,
			        b:1
		    };
		    var params={bgcolor:'#FFF',allowFullScreen:true,allowScriptAccess:'always',wmode:'transparent'};
		    CKobject.embedSWF('js/ckplayer/ckplayer.swf','a1','ckplayer_a1','480','400',flashvars,params);
		    return false;
		}
		return false;
	}
	
	function openOffice(id){
		layer.open({ 
			  type: 1, 
			  zIndex : 80,
			  area: ['auto','600px'],
			  offset: '10px',
			  title:false,
			  content: '<div id="officeContent"></div>'
			});
		    var option = {
		        docId: id,
		        token: 'TOKEN',
		        host: 'BCEDOC',
		        serverHost: 'http://doc.bj.baidubce.com',
		        width: 600, //文档容器宽度
//		        zoom: false,              //是否显示放大缩小按钮
		        ready: function (handler) {  // 设置字体大小和颜色, 背景颜色（可设置白天黑夜模式）
		            handler.setFontSize(1);
		            handler.setBackgroundColor('#000');
		            handler.setFontColor('#fff');
		        },
		        flip: function (data) {    // 翻页时回调函数, 可供客户进行统计等
		            console.log(data.pn);
		        },
		        fontSize:'big',
		        toolbarConf: {
		                zoom: false,
		        		page: false, //上下翻页箭头图标
		                pagenum: false, //几分之几页
		                full: false, //是否显示全屏图标,点击后全屏
		                copy: true, //是否可以复制文档内容
		                position: 'center',// 设置 toolbar中翻页和放大图标的位置(值有left/center)
		        } //文档顶部工具条配置对象,必选
		    };
		    new Document('officeContent', option);
	}
