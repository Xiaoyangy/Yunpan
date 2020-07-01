<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/audio.css">
<title>Insert title here</title>
</head>
<body>
<div class="audio-box">
		<div class="audio-container">
			<div class="audio-cover"></div>
			<div class="audio-view">
				<h3 class="audio-title">${fileName }</h3>
				<input type="hidden" id="currentPath" value="${currentPath }"/>
				<div class="audio-body">
					<div class="audio-backs">
						<div class="audio-this-time">00:00</div>
						<div class="audio-count-time">00:00</div>
						<div class="audio-setbacks">
							<i class="audio-this-setbacks">
								<span class="audio-backs-btn"></span>
							</i>
							<span class="audio-cache-setbacks">
							</span>
						</div>
					</div>
				</div>
				<div class="audio-btn">
					<div class="audio-select">
						<div class="audio-prev"></div>
						<div class="audio-play"></div>
						<div class="audio-next"></div>
						<div class="audio-menu"></div>
						<div class="audio-volume"></div>
					</div>
					<div class="audio-set-volume">
						<div class="volume-box">
							<i><span></span></i>
						</div>
					</div>
					<div class="audio-list">
						<div class="audio-list-head">
							<p>☺随心听</p>
							<span class="menu-close">关闭</span>
						</div>
						<ul class="audio-inline">
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/audio.js"></script>
<script type="text/javascript">
$(function(){
	var currentPath = $("#currentPath").val();
	var fileName = $("h3").text();
// 	alert(currentPath + fileName);
	var url = encodeURI('currentPath='+currentPath+'&fileType=audio&fileName='+fileName);
	var song = [
		{
			'cover' : '../img/cover.jpg',
			'src' : 'openFile.action?' + url,
			'title' : fileName
		}
// 		,
// 		{
// 			'cover' : 'images/cover2.jpg',
// 			'src' : 'http://so1.111ttt.com:8282/2016/1/06m/24/199240145502.m4a?tflag=1494769732&pin=84bac9745fcebbd3ed5c598b97e15c39&ip=114.233.172.33#.mp3',
// 			'title' : '不该 - 周杰伦、张惠妹'
// 		},
// 		{
// 			'cover' : 'images/cover5.jpg',
// 			'src' : 'http://so1.111ttt.com:8282/2015/1/10m/31/103311642007.m4a?tflag=1494769515&pin=26fa27d88422f6adb1fbca3f0f17333e&ip=114.233.172.33#.mp3',
// 			'title' : '再见 - 邓紫棋'
// 		},
// 		{
// 			'cover' : 'images/cover3.jpg',
// 			'src' : 'http://so1.111ttt.com:8282/2017/1/05m/09/298092042172.m4a?tflag=1494768586&pin=f8d0e2e08864846460002b12768a9267&ip=114.233.172.33#.mp3',
// 			'title' : '最后一次 - 庄心妍'
// 		},
// 		{
// 			'cover' : 'images/cover1.jpg',
// 			'src' : 'http://so1.111ttt.com:8282/2017/1/05m/09/298092036393.m4a?tflag=1494768868&pin=9a24cbf7571cb3524af1d6c883916169&ip=114.233.172.33#.mp3',
// 			'title' : '远走高飞 - 金志文、徐佳莹'
// 		}
	];

	var audioFn = audioPlay({
		song : song,
		autoPlay : true  //是否立即播放第一首，autoPlay为true且song为空，会alert文本提示并退出
	});

	/* 向歌单中添加新曲目，第二个参数true为新增后立即播放该曲目，false则不播放 */
// 	audioFn.newSong({
// 		'cover' : 'images/cover4.jpg',
// 		'src' : 'http://so1.111ttt.com:8282/2016/5/06m/06/199061931237.m4a?tflag=1494769315&pin=a0b26b2dddd976d74724841f6d2641d6&ip=114.233.172.33#.mp3',
// 		'title' : '极乐净土 - GARNiDELiA'
// 	},false);

	/* 暂停播放 */
	//audioFn.stopAudio();

	/* 开启播放 */
	//audioFn.playAudio();

	/* 选择歌单中索引为3的曲目(索引是从0开始的)，第二个参数true立即播放该曲目，false则不播放 */
	//audioFn.selectMenu(3,true);

	/* 查看歌单中的曲目 */
	//console.log(audioFn.song);

	/* 当前播放曲目的对象 */
	//console.log(audioFn.audio);
});
</script>
</html>