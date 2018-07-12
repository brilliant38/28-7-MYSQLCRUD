<!-- 2018-07-12 김준영 -->
<!-- Update TeacherScoreForm -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Update Score Form</title>
		
	</head>
	<body>
	
				<%
					// teacherScoreList.jsp로 부터 넘겨받은 teacherNo 값을 변수에 대입 후 테스트
					int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
					System.out.println("teacherNo from teacherScoreList.jsp : " + teacherNo);
					
					// 특정 메서드를 호출하기 위해 teacherScoreDao 객체 생성
					TeacherScoreDao teacherScoreDao = new TeacherScoreDao();
					
					// selectTeacherAndTeacherScore 메서드를 호출하고 teacherAndTeacherScore 객체의 참조값을 리턴 받아 변수에 대입.
					TeacherAndScore teacherAndTeacherScore = teacherScoreDao.selectTeacherAndTeacherScore(teacherNo);
				%>
				<h1>Update TeacherScore</h1>
				<form action="<%= request.getContextPath() %>/UpdateTeacherScoreAction.jsp" method="post"> 
					<table border="1">
						<tr>
							<td>교사 번호 : </td>
							<td><input type="text" name="teacherNo" value="<%= teacherAndTeacherScore.getTeacher().getTeacherNo() %>" readonly>
						</tr>
						<tr>
							<td>교사 이름 : </td>
							<td><input type="text" name="teacherName" value="<%= teacherAndTeacherScore.getTeacher().getTeacherName() %>" readonly>
						</tr>
						<tr>
							<td>교사 점수 : </td>
							<td><input type="text" name="teacherScore" value="<%= teacherAndTeacherScore.getTeacherScore().getScore() %>">
						</tr>
						<tr>
							<td colspan="2"><button>수정</button></td>
						</tr>
					</table>
				</form>
		
	</body>
</html>