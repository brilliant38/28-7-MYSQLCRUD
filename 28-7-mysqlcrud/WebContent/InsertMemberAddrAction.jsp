<!-- 2018-06-26 이광재 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.Member" %>
<%@ page import = "service.MemberAddr" %>
<%@ page import = "service.MemberAddrDao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>memberInsertAction</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euc-kr"); //받는 값의 형식을 euc-kr로 인코딩
			
			String memberAddrContent = request.getParameter("memberAddrContent");
			System.out.println(memberAddrContent + " : name check");
			//전송되는 값 체크
			
			Member member = new Member(); // Member 객체 생성
			MemberAddr memberAddr = new MemberAddr();	//MemberAddr 객체 생성
			
			
			MemberAddrDao memberAddrDao = new MemberAddrDao(); //Memberdao 객체 생성
			
			int result = memberAddrDao.insertMemberAddr(member, memberAddrDao);
			System.out.println("DB에 회원 한명이 추가되었습니다.");
			
			response.sendRedirect("./memberInsert.jsp"); //memberInsert.jsp 페이지로 리다이렉트
		%>
	</body>
</html>