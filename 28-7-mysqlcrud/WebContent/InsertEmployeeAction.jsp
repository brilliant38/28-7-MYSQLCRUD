<!-- 2018-07-02 이광재 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.Employee" %>
<%@ page import = "service.EmployeeDao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>memberInsertAction</title>
	</head>
	<body>
		<% 
			request.setCharacterEncoding("euc-kr"); //받는 값의 형식을 euc-kr로 인코딩
			
			String name = request.getParameter("name");
			int age = Integer.parseInt(request.getParameter("age"));
			System.out.println(name + " : name check");
			System.out.println(age + " : age check");
			//전송되는 값 체크
			
			Employee employee = new Employee(); // Member 객체 생성
			employee.setEmployeeName(name);
			employee.setEmployeeAge(age);
			
			EmployeeDao employeedao = new EmployeeDao(); //Memberdao 객체 생성
			int result = employeedao.insertEmployee(employee);
			System.out.println("DB에 고용인 한명이 추가되었습니다.");
			
			response.sendRedirect("./employee/InsertEmployeeForm.jsp"); //memberInsert.jsp 페이지로 리다이렉트
		%>
	</body>
</html>