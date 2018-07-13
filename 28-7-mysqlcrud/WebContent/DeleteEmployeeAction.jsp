<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.EmployeeDao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>DeleteEmployeeAction</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
			
			int employeeNo = Integer.parseInt(request.getParameter("no")); //List 페이지에서 넘어온 회원 번호 저장
			
			EmployeeDao employeeDao = new EmployeeDao();
			employeeDao.deleteEmployee(employeeNo); // 회원번호 입력하여 회원 정보 행 1줄 삭제 메소드 호출
			
			response.sendRedirect("./member/EmployeeList.jsp"); // List 페이지로 복귀
		%>
	</body>
</html>