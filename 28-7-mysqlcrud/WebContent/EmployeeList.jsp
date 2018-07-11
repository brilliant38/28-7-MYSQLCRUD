<!-- 2018-07-11 이광재 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.EmployeeDao"%>
<%@ page import = "service.Employee" %>
<%@ page import = "java.util.ArrayList"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>EmployeeList</title>
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
		<h3>직원 명부</h3>
		<table class="zui-table">
			<tr>
				<th>no</th>
				<th>name</th>
				<th>age</th>
				<th>주소입력</th>
				<th>점수보기</th>
				<th>삭제</th>
				<th>수정</th>
			</tr>
		<%
	        
			int currentPage = 1;
			if(request.getParameter("currentPage") != null) { 
				currentPage = Integer.parseInt(request.getParameter("currentPage")); // String 타입으로 넘어온 "currentPage" 변수의 타입을 int로 변환하여 저장한다.
			}    
			
			int pagePerRow = 5;
			
			EmployeeDao employeeDao = new EmployeeDao();
			ArrayList<Employee> list = employeeDao.selectEmployeeByPage(currentPage, pagePerRow);
			System.out.println(list + " : 01 list check");
			
			int rowNumber = employeeDao.selectRowNumber();
			
			
			for(int i=0; i<list.size(); i++) {
				
		%>
				<tr>
					<td><%=list.get(i).getEmployeeNo()%></td>
					<td><a href="./EmployeeAddrList.jsp?no=<%=list.get(i).getEmployeeNo()%>"><%=list.get(i).getEmployeeName()%></a></td>
					<td><%=list.get(i).getEmployeeAge()%></td>
					<td><a href="./InsertEmployeeAddrForm.jsp?no=<%=list.get(i).getEmployeeNo()%>">주소입력</a></td>
					<td><a href="./EmployeeAndScore.jsp?employeeNo=<%=list.get(i).getEmployeeNo() %>">점수보기</a></td>
					<td><a href="./DeleteEmployeeAction.jsp?no=<%=list.get(i).getEmployeeNo()%>">삭제</a></td>
					<td><a href="./UpdateEmployeeForm.jsp?no=<%=list.get(i).getEmployeeNo()%>">수정</a></td>
				</tr>
		<%
			}
		%>
		</table>
		<%
			if(currentPage>1) { //currentPage 값이 1보다 클때만 실행
		%>
			<a href="./EmployeeList.jsp?currentPage=<%=currentPage-1%>">[이전]</a> <!-- 이전 페이지 버튼 클릭시 "currentPage"변수로 currentPage-1의 값을 전송 --> 
		<%
			}
			/*	마지막 페이지의 번호 구하기(페이지의 총 갯수는 총 행의 갯수 -1에서 페이지당 보여줄 행의 수를 나눈 몫에다가 1을 더한다.)
				예) (총 행 갯수 (25 - 1) / 페이지당 보여줄 행의수 5 = 5) +1 = 마지막 페이지의 번호는 5 --> 행 갯수와 PPR이 딱 나누어 떨어질 때
				예) (총 행 갯수 (27 - 1) / 페이지당 보여줄 행의수 5 = 5) +1 = 마지막 페이지의 번호는 6 --> 행 갯수와 PPR이 딱 나누어 떨어지지 않을 때
			*/
			int lastPage = ((rowNumber - 1) / pagePerRow) + 1 ;
			System.out.println(rowNumber + " : rowNumber called");
			System.out.println(pagePerRow + " : pagePerRow called");
			System.out.println(lastPage + " : lastPage called");
			
			/*	if ((employee.getRowNumber()-1) % pagePerRow !=0) { // rowNumber-1의 값과 페이지당 행의 수와의 나머지가 1이 아닐때
					lastPage++;
				}
 			*/
			int pageNum = 0;
 			
 			for(int i=1; i<=lastPage; i++) {
				
		%>
				<a href="./EmployeeList.jsp?currentPage=<%=i%>">[<%=i%>]</a>
		<%
 			}
 			
			if(currentPage<lastPage) { /* 현재 페이지 넘버가 마지막 페이지 넘버보다 작아졌을때만 실행. */
		%>
				<a href="./EmployeeList.jsp?currentPage=<%=currentPage+1%>">[다음]</a> <!-- 다음 페이지 버튼 클릭시 "currentPage"변수로 currentPage+1의 값을 전송 -->
		<%
			} 
		%>
		<br><br>
		<a href = "./index.jsp">메인화면으로..</a>
	</body>
</html>