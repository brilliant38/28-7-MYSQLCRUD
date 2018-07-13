<!-- 2018-07-03 이광재 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>InsertMemberForm</title>
	</head>
	<body>
		<h1>Member Address</h1>
		<br><br><br>
		<form action="./member/InsertMemberAddrAction.jsp" method="post">
			<table border="1">
				<tr>
					<td>주소 : </td>
					<td><input type="text" name="address" size="17"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="hidden" name="no" value="<%=request.getParameter("no")%>">
						<input type="submit" value="등록">
					</td>
				</tr>
			</table>
		</form>
		<br>
		<a href="./member/MemberList.jsp">MemberList로 이동
		</a>
	</body>
</html>