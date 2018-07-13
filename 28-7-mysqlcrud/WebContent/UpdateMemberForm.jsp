<!-- 2018-07-03 이광재 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.MemberDao"%>
<%@ page import = "service.Member" %>
<%@ page import = "java.util.ArrayList"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>UpdateMemberForm</title>
	</head>
	<body>
		<h1>Update Member</h1>
		<br><br><br>
		<form action="./UpdateMemberAction.jsp" method="post">
			<table border="1">
			<%
		        request.setCharacterEncoding("euc-kr");
				
				int memberNo = Integer.parseInt(request.getParameter("no"));
				
				Member member = new Member();
				
				MemberDao memberDao = new MemberDao();
				ArrayList<Member> list = memberDao.updateForSelectMember(memberNo);
				System.out.println(list + " : 01 list check");
				
				member = list.get(0);
				
			%>
				<tr>
					<td>회원 번호 : </td>
					<td><input type="text" name="name" value="<%=member.getMemberName()%>"></td>
				</tr>
				<tr>
					<td>회원 이름 : </td>
					<td><input type="text" name="age"  value="<%=member.getMemberAge()%>"></td>
				</tr>
				<tr>
					<td>회원 나이 : </td>
					<td><input type="text" name="age"  value="<%=member.getMemberAge()%>"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="수정">
						<input type="hidden" name="no" value="<%=memberNo %>">
					</td>
				</tr>
				
			</table>
			<br>
				<a href="./MemberList.jsp">MemberList로 이동</a>
		</form>
	</body>
</html>