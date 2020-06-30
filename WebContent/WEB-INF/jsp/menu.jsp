<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

	<div
		style="width: 100%;height: 100%;background-color:#EFF4F8">
		<div style="padding: 10px 0px 0px 0px;margin: 0px;">
			<ul class="ul"
				style="list-style-type: none;font-size: 14px;list-style-position: outside;font-family: 'Microsoft YaHei',arial,SimSun,'宋体';padding-left: 0px">

				<li style="width: 100%; height: 38px;padding: 0px;margin: 0px;">
					<a href="index.action"
					style="display: inline-block;width: 179px;height: 38px;padding: 0px 0px 0px 15px;position: relative; vertical-align:middle; line-height: 38px;text-decoration: none;">
						<span
						style="width: 38px;height: 38px;display: inline-block;text-align: center;">
							<span class="glyphicon glyphicon-file"></span>
					</span> <span
						style="width:auto ;height: 38px;display: inline-block;text-align: left;vertical-align: middle;">全部文件</span>
				</a>
				</li>

				<li style="width: 100%; height: 38px;padding: 0px;margin: 0px;">
					<a onclick="return searchFileType('image')"
					style="display: inline-block;width: 179px;height: 38px;padding: 0px 0px 0px 15px;position: relative;vertical-align:middle;line-height:38px;text-decoration: none;">
						<span
						style="width: 38px;height: 38px;display: inline-block;text-align: center;">
							<span class="glyphicon glyphicon-file"
							style="visibility: hidden;"></span>
					</span> <span
						style="width:auto ;height: 38px;display: inline-block;text-align: left;vertical-align: middle;">图片</span>
				</a>
				</li>

				<li style="width: 100%; height: 38px;padding: 0px;margin: 0px;">
					<a onclick="return searchFileType('office')"
					style="display: inline-block;width: 179px;height: 38px;padding: 0px 0px 0px 15px;position: relative;vertical-align:middle; line-height: 38px;text-decoration: none;">
						<span
						style="width: 38px;height: 38px;display: inline-block;text-align: center;">
							<span class="glyphicon glyphicon-file"
							style="visibility: hidden;"></span>
					</span> <span style="display: inline-block;text-align: left;">文档</span>
				</a>
				</li>

				<li style="width: 100%; height: 38px;padding: 0px;margin: 0px;">
					<a  onclick="return searchFileType('vido')"
					style="display: inline-block;width: 179px;height: 38px;padding: 0px 0px 0px 15px;position: relative;vertical-align:middle; line-height: 38px;text-decoration: none;">
						<span
						style="width: 38px;height: 38px;display: inline-block;text-align: center;">
							<span class="glyphicon glyphicon-file"
							style="visibility: hidden;"></span>
					</span> <span style="display: inline-block;text-align: left;">视频</span>
				</a>
				</li>

				<li style="width: 100%; height: 38px;padding: 0px;margin: 0px;">
					<a onclick="return searchFileType('audio')"
					style="display: inline-block;width: 179px;height: 38px;padding: 0px 0px 0px 15px;position: relative;vertical-align:middle; line-height: 38px;text-decoration: none;">
						<span
						style="width: 38px;height: 38px;display: inline-block;text-align: center;">
							<span class="glyphicon glyphicon-file"
							style="visibility: hidden;"></span>
					</span> <span style="display: inline-block;text-align: left;">音乐</span>
				</a>
				</li>

				<li style="width: 100%; height: 38px;padding: 0px;margin: 0px;">
					<a onclick="return searchFileType('docum')"
					style="display: inline-block;width: 179px;height: 38px;padding: 0px 0px 0px 15px;position: relative;vertical-align:middle; line-height: 38px;text-decoration: none;">
						<span
						style="width: 38px;height: 38px;display: inline-block;text-align: center;">
							<span class="glyphicon glyphicon-file"
							style="visibility: hidden;"></span>
					</span> <span style="display: inline-block;text-align: left;">文本</span>
				</a>
				</li>

				<li style="width: 100%; height: 38px;padding: 0px;margin: 0px;">
					<a onclick="return searchFileType('file')"
					style="display: inline-block;width: 179px;height: 38px;padding: 0px 0px 0px 15px;position: relative;vertical-align:middle; line-height: 38px;text-decoration: none;">
						<span
						style="width: 38px;height: 38px;display: inline-block;text-align: center;">
							<span class="glyphicon glyphicon-file"
							style="visibility: hidden;"></span>
					</span> <span style="display: inline-block;text-align: left;">其它</span>
				</a>
				</li>

				<li style="width: 100%; height: 38px;padding: 0px;margin: 0px;">
					<a  onclick="return openMyShare()"
					style="display: inline-block;width: 179px;height: 38px;padding: 0px 0px 0px 15px; position: relative;vertical-align:middle; line-height: 38px;text-decoration: none;">
						<span
						style="width: 38px;height: 38px;display: inline-block;text-align: center;">
							<span class="glyphicon glyphicon-file"
							style="visibility: hidden;"></span>
					</span> <span style="display: inline-block;text-align: left;">我的分享</span>
				</a>
				</li>

				<li style="width: 100%; height: 38px;padding: 0px;margin: 0px;">
					<a style="display: inline-block;width: 179px;height: 38px;padding: 0px 0px 0px 15px;position: relative;vertical-align:middle; line-height: 38px;text-decoration: none;"
					href="file/recycleFile.action">
						<span
						style="width: 38px;height: 38px;display: inline-block;text-align: center;">
							<span class="glyphicon glyphicon-trash"></span>
					</span> <span style="display: inline-block;text-align: left;">回收站</span>
				</a>
				</li>

			</ul>
		</div>
		<div style="padding: 0px 0px 0px 15px;margin: 100px 0px 0px 0px;">
			<div class="progress" style="margin-bottom: 5px; margin-right: 15px">
			  <div id="sizeprogress" class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="min-width: 2em;">
			    60%
			  </div>
			</div>
			<span id="countSize">${countSize }</span>/<span id="totalSize">${totalSize }</span>
			<div
				style="margin-top: 10px;word-break:keep-all;white-space:nowrap;overflow:hidden;">
				<span style="display: inline-block;width: 24%;"><a
					style=";text-decoration: none;"><span
						class="glyphicon glyphicon-asterisk"></span></a></span> <span
					style="display: inline-block;width: 24%;"><a
					style=";text-decoration: none;"><span
						class="glyphicon glyphicon-plus"></span></a></span> <span
					style="display: inline-block;width: 24%;"><a
					style=";text-decoration: none;"><span
						class="glyphicon glyphicon-minus"></span></a></span> <span
					style="display: inline-block;width: 24%;"><a
					style=";text-decoration: none;"><span
						class="glyphicon glyphicon-euro"></span></a></span>
			</div>
		</div>
	</div>
