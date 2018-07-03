<!-- 2018-07-03 이광재 -->
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
			
			String name = request.getParameter("name");
			String address = request.getParameter("address");
			System.out.println(name + " : name check");
			System.out.println(address + " : address check");
			//전송되는 값 체크
			Member member = new Member();
			member.setMemberName(name);
			
			MemberAddr memberaddr = new MemberAddr(); // Member 객체 생성
			memberaddr.setMemberAddrContent(address);
			
			MemberAddrDao memberaddrdao = new MemberAddrDao(); //Memberdao 객체 생성
			int result = memberaddrdao.insertMemberAddr(member,memberaddr);
			System.out.println("DB에 회원 주소 1줄이 추가되었습니다.");
			
			response.sendRedirect("./InsertMemberAddrForm.jsp"); //InsertMemberAddrForm.jsp 페이지로 리다이렉트
		%>
	</body>
</html>