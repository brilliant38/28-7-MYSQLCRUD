<!-- 2018-07-03 이광재 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.MemberDao" %>
<%@ page import = "service.Member" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>UpdateMemberAction</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
			
			Member member = new Member();
			
			member.setMemberNo(Integer.parseInt(request.getParameter("no")));
			member.setMemberName(request.getParameter("name"));
			member.setMemberAge(Integer.parseInt(request.getParameter("age")));
			
			MemberDao memberdao = new MemberDao();
			memberdao.updateMember(member);
			
			response.sendRedirect("./MemberList.jsp");
		%>
	</body>
</html>