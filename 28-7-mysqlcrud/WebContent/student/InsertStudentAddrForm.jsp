<!-- 2018-07-13 구해성 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>InsertStudentAddrForm</title>
	</head>
	<body>
		<h1>Student Address</h1>
		<br><br><br>
		<form action="./InsertStudentAddrAction.jsp" method="post">
			<table border = "1">
				<tr>
					<td>주소 :</td>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="hidden" name="studentNo" value="<%= request.getParameter("studentNo") %>">
						<input type="submit" value="등록">
			</table>
		</form>
			<br>
			<a href="<%= request.getContextPath() %>../StudentList.jsp">StudentList로 이동</a>
	</body>
</html>