<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<a href="../test/download.do">下载</a>
<br>
<br>
<form action="http://localhost:8080/yun/file/uploadForApp.action" method="post" enctype="multipart/form-data">
	 <input type="file" name="file" value="F:\迅雷下载\DBO.java">
	 <br>
	 <input type="text" name="currentPath" value="image">
	 <br>
	 <input type="text" name="username" value="1234">
	 <br>
	 <input type="submit" value="提交">
</form>

</body>
</html>