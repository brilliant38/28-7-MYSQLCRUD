<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="service.StudentScoreDao"%>
<%@page import="service.Student"%>
<%@page import="service.StudentDao"%>
<%@page import="service.StudentAndScore" %>
<%@page import="java.util.ArrayList"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>StudentrListAboveAvg</h1>
	<%
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int PagePerRow =5;
		
		
		StudentScoreDao studentScoreDao = new StudentScoreDao();
		int scoreAvg = studentScoreDao.selectScoreAvg();
		
		ArrayList<StudentAndScore> list =  studentScoreDao.selectStudentListAboveAvg(currentPage, PagePerRow);
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
				for(int i=0; i<list.size();i++) {
			%>
					<tr>
						<td><%list.get(i).getStudent().getStudent_no();%></td>
						<td><%list.get(i).getStudent().getStudent_name();%></td>
						<td><%list.get(i).getStudentScore().getStudent_score_no();%></td>
				<% 
				}
				%>
		</tbody>
		</table>
</body>
</html>