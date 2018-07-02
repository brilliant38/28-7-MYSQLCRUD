<!-- 2018-07-03 �̱��� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.EmployeeDao"%>
<%@ page import = "service.Employee" %>
<%@ page import = "java.util.ArrayList"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>memberList</title>
		<style>
			table {
				width: 200px;
				border: 1px solid #444444;
				border-collapse: collapse;
			}
			th, td {
				border: 1px solid #444444;
			}
		</style>
	</head>
	<body>
		<table>
		<%
	        
			int currentPage = 1;
			if(request.getParameter("currentPage") != null) { //������ Ŭ�� ������ �������� �ѱ��� ������ null�� ó���Ѵ�.
				currentPage = Integer.parseInt(request.getParameter("currentPage")); // String Ÿ������ �Ѿ�� "currentPage" ������ Ÿ���� int�� ��ȯ�Ͽ� �����Ѵ�.
			}    
 
			int pagePerRow = 5;
			
			Employee employee = new Employee();
			
			EmployeeDao employeeDao = new EmployeeDao();
			ArrayList<Employee> list = employeeDao.selectEmployeeByPage(currentPage, pagePerRow);
			System.out.println(list + " : 01 list check");
			employee = list.get(1);
			
			for(int i=0; i<list.size(); i++) {
				employee = list.get(i);
		%>
				<tr>
					<td><%=employee.getEmployeeNo()%></td>
					<td><%=employee.getEmployeeName()%></td>
					<td><%=employee.getEmployeeAge()%></td>
				</tr>
		<%
			}
		%>
		</table>
		<%
			if(currentPage>1) { //currentPage ���� 1���� Ŭ���� ����
		%>
			<a href="./Member_List.jsp?currentPage=<%=currentPage-1%>">����</a> <!-- ���� ������ ��ư Ŭ���� "currentPage"������ currentPage-1�� ���� ���� --> 
		<%
			}
			int lastPage = (employee.getRowNumber()-1) / pagePerRow; // rowNumber-1�� ���� �������� ���� ������ ���� ������ �������� �ѹ�.
			
			if ((employee.getRowNumber()-1) % pagePerRow !=0) { // rowNumber-1�� ���� �������� ���� ������ �������� 1�� �ƴҶ�
				lastPage++;
			}
			if(currentPage<lastPage) { //���� ������ �ѹ��� ������ ������ �ѹ����� �۾��������� ����.
		%>
			<a href="./Member_List.jsp?currentPage=<%=currentPage+1%>">����</a> <!-- ���� ������ ��ư Ŭ���� "currentPage"������ currentPage+1�� ���� ���� -->
		<%
			} 
		%>
	</body>
</html>