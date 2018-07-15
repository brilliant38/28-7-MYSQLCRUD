<!-- 2018-07-03 이광재 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>InsertMemberForm</title>
	</head>
	<body>
		<form action="./InsertMemberAction.jsp" method="post">
			<h2>Member 정보 입력</h2>
			<div>
				이름 : <input type="text" name="name" size="10px"> 
				<br>
				나이 : <input type="text" name="age" size="10px">
				<br>
			</div>
			<div>
				<input type="submit" value="입력" id="btn">
			</div>
		</form>
		<br>
		<a href = "./MemberList.jsp">목록으로</a>
	</body>
</html>