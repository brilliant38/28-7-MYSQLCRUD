<!--2018-07-12 이광재 -->
<!--MemberList.jsp페이지에서 점수입력 링크를 클릭하면, 접수임력 양식이 출력되면서 값을 Action페이지로 넘기는 폼 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert Member Score</title>
	</head>
	<body>
		<h1>Member Score</h1>
		<br><br><br>
		<%
			Member member = new Member();
			member.setMemberNo(Integer.parseInt(request.getParameter("no")));
			
		%>
		<form action="./InsertMemberScoreAction.jsp" method="post">
			<table border="1">
				<tr>
					<td>점수 : </td>
					<td><input type="text" name="score"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="hidden" name="no" value="<%= member.getMemberNo() %>">
						<input type="submit" value="등록">
					</td>
				</tr>
			</table>
		</form>
		<br>
		<a href="./MemberList.jsp">MemberList로 이동</a>
	</body>
</html>