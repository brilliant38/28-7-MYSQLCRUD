<!-- 2018-07-03 이광재 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.MemberDao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>DeleteMemberAction</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
			
			int memberNo = Integer.parseInt(request.getParameter("no")); //List 페이지에서 넘어온 회원 번호 저장
			
			MemberDao memberdao = new MemberDao();
			memberdao.deleteMember(memberNo); // 회원번호 입력하여 회원 정보 행 1줄 삭제 메소드 호출
			
			response.sendRedirect("./MemberList.jsp"); // List 페이지로 복귀
		%>
	</body>
</html>