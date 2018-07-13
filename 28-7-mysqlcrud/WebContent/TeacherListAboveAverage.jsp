<!-- 2018.07.10 김준영-->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>TeacherListAboveAverage</title>
		</head>
	<body>
		<h3>TeacherListAboveAverage</h3>
		<%
			
			int currentPage = 1;
			if(request.getParameter("currentPage") != null) { //다음을 클릭 했을때 참조값을 넘기지 않으면 null로 처리한다.
				currentPage = Integer.parseInt(request.getParameter("currentPage")); // String 타입으로 넘어온 "currentPage" 변수의 타입을 int로 변환하여 저장한다.
			}    
			
			int pagePerRow = 5;//페이지당 표시할 행의 수를 정한다.
			
			TeacherScoreDao teacherScoreDao = new TeacherScoreDao();
			int scoreAverage =teacherScoreDao.selectScoreAverage();
			
			ArrayList<TeacherAndScore> list =  teacherScoreDao.selectTeacherListAboveAverage(currentPage, pagePerRow);
			
		%>
		<div>
			평균 : <%=scoreAverage %>
		</div>
		<table  border="1">
			<thead>
			<tr>
				<th>Teacher_No</th>
				<th>Teacher_Name</th>
				<th>Teacher_Score</th>
			</tr>	
			</thead>
			<tbody>
			<%
				for(int i=0; i<list.size(); i++) {
			%>
					<tr>
						<td><%=list.get(i).getTeacher().getTeacherNo() %></td>
						<td><%=list.get(i).getTeacher().getTeacherName() %></td>
						<td><%=list.get(i).getTeacherScore().getScore() %></td>
					</tr>
			<%
				}
			%>
			</tbody>
		</table>
		<%
			if(currentPage>1) { //currentPage 값이 1보다 클때만 실행
		%>
			<a href="./TeacherListAboveAverage.jsp?currentPage=<%=currentPage-1%>">이전</a> <!-- 이전 페이지 버튼 클릭시 "currentPage"변수로 currentPage-1의 값을 전송 --> 
		<%
			}
			int lastPage = (list.get(0).getTeacher().getRowNumber()-1) / pagePerRow; // rowNumber-1의 값과 페이지당 행의 수와의 몫이 마지막 페이지의 넘버.
			
			if ((list.get(0).getTeacher().getRowNumber()-1) % pagePerRow !=0) { // rowNumber-1의 값과 페이지당 행의 수와의 나머지가 1이 아닐때
				lastPage++;
			}
			if(currentPage<lastPage) { //현재 페이지 넘버가 마지막 페이지 넘버보다 작아졌을때만 실행.
		%>
			<a href="./TeacherListAboveAverage.jsp?currentPage=<%=currentPage+1%>">다음</a> <!-- 다음 페이지 버튼 클릭시 "currentPage"변수로 currentPage+1의 값을 전송 -->
		<%
			} 
		%>
		<br><br>
		<a href = "./index.jsp">메인화면으로..</a>
	</body>
</html>