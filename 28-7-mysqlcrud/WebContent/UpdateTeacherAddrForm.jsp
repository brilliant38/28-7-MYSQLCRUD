<!-- *2018-07-03 김준영* -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Update Teacher Address Form</title>
	
	</head>
	<body>
		
				<%
					// teacherAddrList.jsp로 부터 넘겨받은 teacherNo 값을 변수에 대입 후 테스트
					int teacherAddressNo = Integer.parseInt(request.getParameter("teacherAddressNo"));
					System.out.println("teacherAddressNo from teacherAddrList.jsp : " + teacherAddressNo);
					
					TeacherDao teacherDao = new TeacherDao();
					TeacherAddrDao teacherAddrDao = new TeacherAddrDao();
					
					// selectForUpdateTeacher 메서드를 호출하고 teacher 객체의 참조값을 리턴 받아 변수에 대입.
					TeacherAddr teacherAddr = teacherAddrDao.selectForUpdateTeacherAddress(teacherAddressNo);
				%>
				<h1>Update Teacher</h1>
				<form action="<%= request.getContextPath() %>/UpdateTeacherAddrAction.jsp" method="post"> 
					<table border="1">
						<tr>
							<td>주소 번호 : </td>
							<td><input type="text" name="teacherAddressNo" value="<%= teacherAddr.getTeacherAddrNo() %>" readonly>
						</tr>
						<tr>
							<td>교사 번호 : </td>
							<td><input type="text" name="teacherNo" value="<%= teacherAddr.getTeacherNo() %>" readonly>
						</tr>
						<tr>
							<td>주소 : </td>
							<td><input type="text" name="teacherAddressContent" value="<%= teacherAddr.getTeacherAddrContent() %>">
						</tr>
						<tr>
							<td colspan="2"><button>수정</button></td>
						</tr>
					</table>
				</form>
	
	</body>
</html>
