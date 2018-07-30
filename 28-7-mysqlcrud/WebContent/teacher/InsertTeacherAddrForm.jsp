<!-- 2018-07-01 김준영 -->


<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Form To Insert Teacher Address</title>
		
	</head>
	<body>
	
				<h1>Teacher Address</h1>
				<br><br><br>
				<form action="<%= request.getContextPath() %>/teacher/InsertTeacherAddrAction.jsp" method="post">
					<table border="1">
						<tr>
							<td>주소 : </td>
							<td><input type="text" name="teacherAddressContent"></td>
						</tr>
						<tr>
							<td colspan="2">
									<%
									// teacherList.jsp로 부터 받아온 teacherNo 파라미터 안의 값 테스트
									System.out.println("teacherNo, teacherList.jsp => InsertTeacherAddrForm.jsp : " + request.getParameter("teacherNo"));
								%>
								<!-- teacherNo 변수 안의 값을 hidden type으로 전송 -->
								<input type="hidden" name="teacherNo" value="<%= request.getParameter("teacherNo") %>">
								<input type="submit" value="등록">
							</td>
						</tr>
					</table>
				</form>
				<br>
				<a href="<%= request.getContextPath() %>/teacher/TeacherList.jsp">teacherList로 이동</a>
	
	</body>
</html>