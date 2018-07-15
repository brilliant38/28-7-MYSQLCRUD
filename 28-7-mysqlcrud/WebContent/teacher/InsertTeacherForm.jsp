<!-- 2018-07-01 김준영 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>insert Teacher Form</title>
</head>
<body>
	<form action="./InsertTeacherAction.jsp" method="post" name="f">
		<h2>Teacher 정보 입력</h2>
		<div>
			이름 : <input type="text" id="teacherName" name="teacherName" size="10px"> 
			<span id="teacherNameHelper"></span><br>
			나이 : <input type="text" id="teacherAge" name="teacherAge" size="10px">
			<span id="teacherAgeHelper"></span><br>
		</div>
		<div>
			<input type="submit" value="입력" id="btn">
		</div>
	</form>
	<script type="text/javascript" src="script./teacher/InserteacherOrAddr.js" charset="utf-8"></script>
</body>
</html>