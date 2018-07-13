<!-- 2018-07-13 구해성 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>학생 insert 화면</title>
	</head>
	<body>
		<form action="./InsertStudentAction.jsp" method="post">
			<h2>Student 정보 입력</h2>
			<div>
				이름 : <input type="text" id="studentName" name="studentName" size="10px"> 
				<span id="teacherNameHelper"></span><br>
				나이 : <input type="text" id="studentAge" name="studentAge" size="10px">
				<span id="teacherAgeHelper"></span><br>
			</div>
			<div>
			<input type="submit" value="입력" id="btn">
			</div>
		</form>
		<script type="text/javascript" src="script/InserteacherOrAddr.js" charset="utf-8"></script>
	</body>
</html>