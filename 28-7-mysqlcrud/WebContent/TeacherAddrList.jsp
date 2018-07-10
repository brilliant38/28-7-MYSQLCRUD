<!-- 2018.07.09 김준영-->
<!-- Teacher AddrList Action -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Teacher Address List</title>
	</head>
	<body>
		<%
			// TeacherAddrDao 객체 생성
			TeacherAddrDao teacherAddrDao = new TeacherAddrDao();
		
			// teacherList.jsp로 부터 전달 받은 teacherNo 값을 변수에 대입
			int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
			
			// teacherNo 변수 안의 값을 테스트
			System.out.println("teacherNo, teacherList.jsp => teacherAddrList.jsp : " + teacherNo);
			
			// selectTeacherAddress 메서드를 호출하고 리턴받은 TeacherAddr객체의 참조 값을 teacherAddr 객체 참조변수에 대입 
			TeacherAddr teacherAddr = teacherAddrDao.selectTeacherAddress(teacherNo);		
		%>
		<h1>Teacher Address</h1>
		<table border="1">
			<tr>
				<td>주소 번호</td>
				<td>교사 번호</td>
				<td>교사 주소</td>
				<td>수정</td>
				<td>삭제</td>
			</tr>
			<tr>
				<td><%= teacherAddr.getTeacherAddrNo() %></td>
				<td><%= teacherAddr.getTeacherNo() %></td>
				<td><%= teacherAddr.getTeacherAddrContent() %></td>
				<td><a href="<%= request.getContextPath() %>/UpdateTeacherAddrForm.jsp?teacherNo=<%= teacherNo %>">수정 버튼</a></td>
				<td><a href="<%= request.getContextPath() %>/DeleteTeacherAddrAction.jsp?teacherNo=<%= teacherNo %>">삭제 버튼</a></td>
			</tr>
		</table>
		<a href="<%= request.getContextPath() %>/TeacherList.jsp">teacherList로 이동</a>
	</body>
</html>