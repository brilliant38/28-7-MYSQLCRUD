<%@page import="service.StudentScoreDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>StudentrListAboveAvg</h1>
	<%
		StudentScoreDao studentScoreDao = new StudentScoreDao();
		int scoreAng = studentScoreDao.selectScoreAvg();
	%>
	<div>
		평균 : <%=scoreAvg %>
		</div>
		<table>
			<thead>
				<tr>
					<th>STUDENT_NO</th>
					<th>STUDENT_NAME</th>
					<th>STUDENT_SCORE</th>
				</tr>
			</thead>
		<tbody>
			<%
				for(int i=0; i<List.size();i++) {
			%>
					<tr>
						<td><%List.get(i).getStudent().getStudentNo();%></td>
						<td><%List.get(i).getStudent().getStudentName();%></td>
						<td><%List.get(i).getStudentScore().getStudentage();%></td>
				<% 
				}
				%>
		</tbody>
		</table>
</body>
</html>