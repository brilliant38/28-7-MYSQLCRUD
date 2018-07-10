<!-- 2018-07-03 이광재 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.EmployeeDao" %>
<%@ page import = "service.Employee" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>UpdateMemberAction</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
			
			Employee employee = new Employee();
			
			employee.setEmployeeNo(Integer.parseInt(request.getParameter("no")));
			employee.setEmployeeName(request.getParameter("name"));
			employee.setEmployeeAge(Integer.parseInt(request.getParameter("age")));
			
			EmployeeDao employeeDao = new EmployeeDao();
			employeeDao.updateEmployee(employee);
			
			response.sendRedirect("./EmployeeList.jsp");
		%>
	</body>
</html>