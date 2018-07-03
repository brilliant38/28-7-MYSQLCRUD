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
		<style>
			table {
				width: 300px;
				border: 1px solid #444444;
				border-collapse: collapse;
				text-align:center;
			}
			th, td {
				border: 1px solid #444444;
			}
		</style>
	</head>
	<body>
		<h3>회원정보수정</h3>
		<form action="./UpdateMemberAction.jsp" method="post">
			<table>
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
					<th>이름</th>
					<td><input type="text" name="name" size="17" value="<%=member.getMemberName()%>"></td>
				</tr>
				<tr>
					<th>나이</th>
					<td><input type="text" name="age" size="17" value="<%=member.getMemberAge()%>"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="회원정보수정">
						<span>
							<input type="hidden" name="no" value="<%=memberNo %>">
						</span>
					</td>
				</tr>
				
			</table>
		</form>
		<!-- <form>
			<div>
				이름 :
				<input type="text" name="searchWord">
			</div>
		</form> -->
	</body>
</html>