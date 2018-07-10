<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.Employee" %>
<%@ page import = "service.EmployeeAddr" %>
<%@ page import = "service.EmployeeAddrDao" %>
<!DOCTYPE html>
	<html>
		<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>InsertEmployeeAddrAction</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euc-kr"); //받는 값의 형식을 euc-kr로 인코딩
			
			int no = Integer.parseInt(request.getParameter("no"));
			String address = request.getParameter("address");
			System.out.println(no + " : name check");
			System.out.println(address + " : address check");
			
			//전송되는 값 체크
			EmployeeAddr employeeAddr = new EmployeeAddr(); // Member 객체 생성
			employeeAddr.setEmployeeNo(no);
			employeeAddr.setEmployeeAddrContent(address);
			
			EmployeeAddrDao employeeAddrDao = new EmployeeAddrDao(); //Memberdao 객체 생성
			employeeAddrDao.insertEmployeeAddr(employeeAddr);
			System.out.println("DB에 직원 주소 1줄이 추가되었습니다.");
			
			response.sendRedirect("./EmployeeList.jsp"); //InsertMemberAddrForm.jsp 페이지로 리다이렉트
		%>
	</body>
</html>