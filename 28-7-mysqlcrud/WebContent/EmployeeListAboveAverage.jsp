<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.EmployeeScoreDao" %>
<%@ page import = "service.EmployeeAndScore" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>EmployeeListAboveAverage</title>
		<style>
			.zui-table {
			    border: solid 1px #DDEEEE;
			    border-collapse: collapse;
			    border-spacing: 0;
			    font: normal 13px Arial, sans-serif;
			}
			.zui-table thead th {
			    background-color: #DDEFEF;
			    border: solid 1px #DDEEEE;
			    color: #336B6B;
			    padding: 10px;
			    text-align: left;
			    text-shadow: 1px 1px 1px #fff;
			}
			.zui-table tbody td {
			    border: solid 1px #DDEEEE;
			    color: #333;
			    padding: 10px;
			    text-shadow: 1px 1px 1px #fff;
			}
		</style>
	</head>
	<body>
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
		<table class="zui-table">
			<tr>
				<th>이름</th>
				<th>나이</th>
				<th>번호</th>
				<th>점수</th>
			</tr>
			<%
				for(int i=0; i<list.size(); i++) {
			%>
					<tr>
						<td><%=list.get(i).getEmployee().getEmployeeName() %></td>
						<td><%=list.get(i).getEmployee().getEmployeeAge() %></td>
						<td><%=list.get(i).getEmployeeScore().getEmployeeNo() %></td>
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
			int lastPage = list.get(0).getEmployee().getRowNumber() / pagePerRow ; 
			System.out.println(lastPage + ": 마지막 페이지의 숫자");
			
			if (list.get(0).getEmployee().getRowNumber() % pagePerRow != 0) {
				lastPage++;
			}
			if(currentPage < lastPage) {
		%>
				<a href="./EmployeeListAboveAverage.jsp?currentPage=<%=currentPage+1 %>">다음</a>
		<%		
			}
		%>
		<form action="./EmployeeListAboveAverage.jsp" method="post">
			<div>
				이름으로 검색 : <input type="text" name="searchWord">
			</div>
			<br>
			<div>
			<a href = "./index.jsp">메인화면으로..</a>
			</div>
		</form>
	</body>
</html>


























