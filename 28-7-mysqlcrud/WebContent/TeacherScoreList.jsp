<!-- 2018.07.10 김준영-->
<!-- TeacherScoreList -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Teacher Score List</title>
	</head>
	<body>
	
	
				<%
					// TeacherScoreDao 객체 생성
					TeacherScoreDao teacherScoreDao = new TeacherScoreDao();
				
					// teacherList.jsp로 부터 전달 받은 teacherNo 값을 변수에 대입
					int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
					
					// teacherNo 변수 안의 값을 테스트
					System.out.println("teacherNo, teacherList.jsp => teacherAddrList.jsp : " + teacherNo);
					
					// selectTeacherAddress 메서드를 호출하고 리턴받은 TeacherAddr객체의 참조 값을 teacherAddr 객체 참조변수에 대입 
					TeacherAndScore teacherAndTeacherScore = teacherScoreDao.selectTeacherAndTeacherScore(teacherNo);		
				%>
				<h1>Teacher Score List</h1>
				<br><br><br>
				<table id="entityListTable" border="1">
					<thead>
						<tr>
							<th>교사 번호</th>
							<th>교사 이름</th>
							<th>점수</th>
							<th>수정</th>
						</tr>
					</thead>
					<tr>
						<td><%= teacherAndTeacherScore.getTeacher().getTeacherNo() %></td>
						<td><%= teacherAndTeacherScore.getTeacher().getTeacherName() %></td>
						<td><%= teacherAndTeacherScore.getTeacherScore().getScore() %></td>
						<td><a class="buttonToUpdateEntity" href="<%= request.getContextPath() %>/UpdateTeacherScoreForm.jsp?teacherNo=<%= teacherAndTeacherScore.getTeacher().getTeacherNo() %>">수정버튼</a>
					</tr>
				</table>
				<br>
			
					<a id="buttonToList" href="<%= request.getContextPath() %>/TeacherList.jsp">목록으로</a>
				
	
	</body>
</html>