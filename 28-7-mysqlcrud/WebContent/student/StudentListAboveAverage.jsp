<!--  28기 구해성  2018-07-13 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
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
		<h3>StudentrListAboveAvg</h3>
	<%
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int PagePerRow = 5;
		
		StudentScoreDao studentScoreDao = new StudentScoreDao();
		int scoreAvg = studentScoreDao.selectScoreAvg();
		System.out.println(scoreAvg + "<-scoreAvg");
		
		ArrayList<StudentAndScore> list =  studentScoreDao.selectStudentListAboveAvg(currentPage, PagePerRow);
		
		int lastPage = (list.get(0).getStudent().getRowNumber()-1) / PagePerRow; // rowNumber-1의 값과 페이지당 행의 수와의 몫이 마지막 페이지의 넘버.
		
	%>
	<div>
		평균 : <%=scoreAvg %>
	</div>
		<table border ="1">
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
						<td><%=list.get(i).getStudent().getStudent_no()%></td>
						<td><%=list.get(i).getStudent().getStudent_name()%></td>
						<td><%=list.get(i).getStudentScore().getScore()%></td>
					</tr>
				<% 
				}
				%>
		</tbody>
		</table>
		<%
			if(currentPage>1) { //currentPage 값이 1보다 클때만 실행
		%>
			<a href="../StudentListAboveAverage.jsp?currentPage=<%=currentPage-1%>">이전</a> <!-- 이전 페이지 버튼 클릭시 "currentPage"변수로 currentPage-1의 값을 전송 --> 
		<%
			}
			
			if ((list.get(0).getStudent().getRowNumber()-1) % PagePerRow !=0) { // rowNumber-1의 값과 페이지당 행의 수와의 나머지가 1이 아닐때
				lastPage++;
			}
			if(currentPage<lastPage) { //현재 페이지 넘버가 마지막 페이지 넘버보다 작아졌을때만 실행.
		%>
			<a href="../StudentListAboveAverage.jsp?currentPage=<%=currentPage+1%>">다음</a> <!-- 다음 페이지 버튼 클릭시 "currentPage"변수로 currentPage+1의 값을 전송 -->
		<%
			} 
		%>
		<br><br>
		<a href = "./index.jsp">메인화면</a>
</body>
</html>