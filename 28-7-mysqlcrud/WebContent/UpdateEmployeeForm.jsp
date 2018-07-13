<!-- 2018-07-03 이광재 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.EmployeeDao"%>
<%@ page import = "service.Employee" %>
<%@ page import = "java.util.ArrayList"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>UpdateEmployeeForm</title>
	</head>
	<body>
		<h1>Update Employee</h1>
		<br><br><br>
		<form action="./UpdateEmployeeAction.jsp" method="post">
			<table border="1">
			<%
		        request.setCharacterEncoding("euc-kr");
				
				int EmployeeNo = Integer.parseInt(request.getParameter("no"));
				
				
				EmployeeDao employeeDao = new EmployeeDao();
				Employee employee = employeeDao.updateEmployeeList(EmployeeNo);
				System.out.println(employee + " : 01 employee check");
				
				
			%>
				<tr>
					<td>직원 번호 : </td>
					<td><input type="text" name="no" size="17" value="<%=employee.getEmployeeNo()%>"></td>
				</tr>
				<tr>
					<td>직원 이름 : </td>
					<td><input type="text" name="name" size="17" value="<%=employee.getEmployeeName()%>"></td>
				</tr>
				<tr>
					<td>직원 나이 : </td>
					<td><input type="text" name="age"  value="<%=employee.getEmployeeAge()%>"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="수정">
						<input type="hidden" name="no" value="<%=EmployeeNo %>">
					</td>
				</tr>
				
			</table>
		</form>
		<br>
		<a href="./EmployeeList.jsp">EmployeeList로 이동</a>
	</body>
</html>