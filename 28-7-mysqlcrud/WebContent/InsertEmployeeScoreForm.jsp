<!--2018-07-13 �̱��� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert Employee Score</title>
	</head>
	<body>
		<%
			Employee employee = new Employee();
			employee.setEmployeeNo(Integer.parseInt(request.getParameter("no")));
			
		%>
		<form action="./employee/InsertEmployeeScoreAction.jsp" method="post">
			<table border="1">
				<tr>
					<td>���� : </td>
					<td><input type="text" name="score"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="hidden" name="no" value="<%= employee.getEmployeeNo() %>">
						<input type="submit" value="���">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>