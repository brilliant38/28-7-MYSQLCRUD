<!-- 2018.07.10 김준영-->
<!-- InsertTeacher ScoreList  -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ page import = "service.TeacherScoreDao" %>
<%@ page import = "service.Teacher" %>
<%@ page import = "service.TeacherScore" %>
<%@ page import = "service.TeacherAndScore" %>
<%@ page import = "java.util.ArrayList" %>


<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>teacherAndScoreList</title>
	</head>
	<body>
	<%		
		request.setCharacterEncoding("EUC-KR");
		int teacherNo = Integer.parseInt(request.getParameter("no"));
		System.out.println(teacherNo);
		
		TeacherScoreDao teacherScoreDao = new TeacherScoreDao();
		ArrayList<TeacherAndScore> arrayList = teacherScoreDao.selectTeacherAndScored(teacherNo);	
	%>
		<h2>교사 점수</h2>	
			<table border="1">
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>나이</th>
					<th>점수</th>
				</tr>
				<%
					for(int i=0;i<arrayList.size();i++){
						TeacherAndScore teacherAndScore = arrayList.get(i);
						Teacher teacher = teacherAndScore.getTeacher();
						TeacherScore teacherScore = teacherAndScore.getTeacherScore();
						System.out.println(teacherScore.getTeacherNo());
						System.out.println(teacher.getTeacherName());
						System.out.println(teacher.getTeacherAge());
						System.out.println(teacherScore.getScore());
						
				%>
						<tr>
							<td><%=teacherScore.getTeacherNo()%></td>
							<td><%=teacher.getTeacherName()%></td>
							<td><%=teacher.getTeacherAge()%></td>
							<td><%=teacherScore.getScore()%></td>
						</tr>
				<%
					}
				%>
			</table>
	</body>
</html>