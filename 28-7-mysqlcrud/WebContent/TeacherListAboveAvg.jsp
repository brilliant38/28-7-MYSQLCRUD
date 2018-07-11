<!-- 2018.07.10 김준영-->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ page import = "service.Teacher" %>
<%@ page import = "service.TeacherScore" %>
<%@ page import = "service.TeacherScoreDao" %>
<%@ page import = "service.TeacherAndScore" %>
<%@ page import = "java.util.ArrayList" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>teacherListAboveAvg</title>
	</head>
	<body>
		<h1>교사점수 평균이상 목록</h1>
		<%
			TeacherScoreDao teacherScoreDao = new TeacherScoreDao();
			int scoreAvg = teacherScoreDao.selectScoreAvg();
			
			ArrayList<TeacherAndScore> arrayList = new ArrayList<TeacherAndScore>();
			arrayList = teacherScoreDao.selectTeacherListAboveAvg();
			
		%>
		<div>
			평균 : <%=scoreAvg %>점
		</div>
		<table border ="1">
			<thead>
				<tr>
					<th>교사번호</th>
					<th>교사이름</th>
					<th>점수</th>
				</tr>
			</thead>
			<tbody>
				<%
					for(int i=0; i<arrayList.size(); i++){
						TeacherAndScore teacherAndScore = arrayList.get(i);
						Teacher teacher = teacherAndScore.getTeacher();
						TeacherScore teacherScore = teacherAndScore.getTeacherScore();
				%>
						<tr>
							<td><%=teacher.getTeacherNo()%></td>
							<td><%=teacher.getTeacherName()%></td>
							<td><%=teacherScore.getScore()%></td>
						</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<a href = "<%=request.getContextPath()%>/index.jsp">인덱스로</a>
	</body>
</html>