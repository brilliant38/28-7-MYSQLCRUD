<!-- 2018-07-02 이광재 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.Member" %>
<%@ page import = "service.MemberDao" %>
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
			
			Member member = new Member(); // Member 객체 생성
			member.setMemberName(name);
			member.setMemberAge(age);
			
			MemberDao memberdao = new MemberDao(); //Memberdao 객체 생성
			int result = memberdao.insertMember(member);
			System.out.println("DB에 회원 한명이 추가되었습니다.");
			
			response.sendRedirect("./member/InsertMemberForm.jsp"); //memberInsert.jsp 페이지로 리다이렉트
		%>
	</body>
</html>