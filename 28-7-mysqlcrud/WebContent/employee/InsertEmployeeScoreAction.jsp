<!-- 폼에서 넘겨받은 값(점수,회원코드)을 받아서 MemberScore내에 InsertMemberScore메소드를 호출하여 개인 점수를 입력하도록 만드는 페이지 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert Employee Score Action</title>
	</head>
	<body>
		<%
			EmployeeScore employeeScore = new EmployeeScore();
			employeeScore.setEmployeeNo(Integer.parseInt(request.getParameter("no")));
			employeeScore.setScore(Integer.parseInt(request.getParameter("score")));
			
			EmployeeScoreDao employeeScoreDao = new EmployeeScoreDao();
			employeeScoreDao.insertEmployeeScore(employeeScore);
			
			response.sendRedirect("./EmployeeList.jsp");
		%>
	</body>
</html>