<!-- 2018-07-11 이광재 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.EmployeeScoreDao" %>
<%@ page import = "service.EmployeeAndScore" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>EmployeeListAboveAverage</title>
	</head>
	<body>
		<h3>Employee List Above Average</h3>
		<%	
			request.setCharacterEncoding("euc-kr");
			String searchWord = request.getParameter("searchWord");
			if (searchWord == null) {
				searchWord = "";
			}
			
			EmployeeScoreDao employeeScoreDao = new EmployeeScoreDao();
			int AverageScore = employeeScoreDao.averageScore();
			
			int currentPage = 1;
			if(request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			int pagePerRow = 3;
			
			ArrayList<EmployeeAndScore> list = employeeScoreDao.selectEmployeeAndScored(currentPage, pagePerRow, searchWord);
		%>
		<div>
			평균 : <%=AverageScore %>
		</div>
		<table border="1">
			<thead>
				<tr>
					<th>Employee_No</th>
					<th>Employee_Name</th>
					<th>Employee_Score</th>
				</tr>
			</thead>
			<%
				for(int i=0; i<list.size(); i++) {
			%>
					<tr>
						<td><%=list.get(i).getEmployeeScore().getEmployeeNo() %></td>
						<td><%=list.get(i).getEmployee().getEmployeeName() %></td>
						<td><%=list.get(i).getEmployeeScore().getScore() %></td>
					</tr>
			<% 
				}
			%>
		</table>
		<%
			if(currentPage > 1) {
		%>
				<a href="./EmployeeListAboveAverage.jsp?currentPage=<%=currentPage-1 %>">이전</a>
		<%
			}
			// 마지막 페이지의 값은 고정. ex) 행의 갯수가 53개일때 페이지당 보여줄 행의 갯수가 5개라면 마지막 페이지의 숫자는 
			int lastPage = ((list.get(0).getEmployee().getRowNumber() - 1) / pagePerRow) + 1 ; 
			System.out.println(lastPage + ": 마지막 페이지의 숫자");
			
			if (list.get(0).getEmployee().getRowNumber() % pagePerRow != 0) {
				lastPage++;
			}
			if(currentPage<lastPage) {
		%>
				<a href="./EmployeeListAboveAverage.jsp?currentPage=<%=currentPage+1 %>">다음</a>
		<%		
			}
		%>
		<br><br>
		<div>
			<a href = "./index.jsp">메인화면</a>
		</div>
	</body>
</html>


























