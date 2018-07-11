<!-- 2018-07-11 �̱��� -->
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
		<h3>���� ���</h3>
		<table class="zui-table">
			<tr>
				<th>no</th>
				<th>name</th>
				<th>age</th>
				<th>�ּ��Է�</th>
				<th>��������</th>
				<th>����</th>
				<th>����</th>
			</tr>
		<%
	        
			int currentPage = 1;
			if(request.getParameter("currentPage") != null) { 
				currentPage = Integer.parseInt(request.getParameter("currentPage")); // String Ÿ������ �Ѿ�� "currentPage" ������ Ÿ���� int�� ��ȯ�Ͽ� �����Ѵ�.
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
					<td><a href="./InsertEmployeeAddrForm.jsp?no=<%=list.get(i).getEmployeeNo()%>">�ּ��Է�</a></td>
					<td><a href="./EmployeeAndScore.jsp?employeeNo=<%=list.get(i).getEmployeeNo() %>">��������</a></td>
					<td><a href="./DeleteEmployeeAction.jsp?no=<%=list.get(i).getEmployeeNo()%>">����</a></td>
					<td><a href="./UpdateEmployeeForm.jsp?no=<%=list.get(i).getEmployeeNo()%>">����</a></td>
				</tr>
		<%
			}
		%>
		</table>
		<%
			if(currentPage>1) { //currentPage ���� 1���� Ŭ���� ����
		%>
			<a href="./EmployeeList.jsp?currentPage=<%=currentPage-1%>">[����]</a> <!-- ���� ������ ��ư Ŭ���� "currentPage"������ currentPage-1�� ���� ���� --> 
		<%
			}
			/*	������ �������� ��ȣ ���ϱ�(�������� �� ������ �� ���� ���� -1���� �������� ������ ���� ���� ���� �򿡴ٰ� 1�� ���Ѵ�.)
				��) (�� �� ���� (25 - 1) / �������� ������ ���Ǽ� 5 = 5) +1 = ������ �������� ��ȣ�� 5 --> �� ������ PPR�� �� ������ ������ ��
				��) (�� �� ���� (27 - 1) / �������� ������ ���Ǽ� 5 = 5) +1 = ������ �������� ��ȣ�� 6 --> �� ������ PPR�� �� ������ �������� ���� ��
			*/
			int lastPage = ((rowNumber - 1) / pagePerRow) + 1 ;
			System.out.println(rowNumber + " : rowNumber called");
			System.out.println(pagePerRow + " : pagePerRow called");
			System.out.println(lastPage + " : lastPage called");
			
			/*	if ((employee.getRowNumber()-1) % pagePerRow !=0) { // rowNumber-1�� ���� �������� ���� ������ �������� 1�� �ƴҶ�
					lastPage++;
				}
 			*/
			int pageNum = 0;
 			
 			for(int i=1; i<=lastPage; i++) {
				
		%>
				<a href="./EmployeeList.jsp?currentPage=<%=i%>">[<%=i%>]</a>
		<%
 			}
 			
			if(currentPage<lastPage) { /* ���� ������ �ѹ��� ������ ������ �ѹ����� �۾��������� ����. */
		%>
				<a href="./EmployeeList.jsp?currentPage=<%=currentPage+1%>">[����]</a> <!-- ���� ������ ��ư Ŭ���� "currentPage"������ currentPage+1�� ���� ���� -->
		<%
			} 
		%>
		<br><br>
		<a href = "./index.jsp">����ȭ������..</a>
	</body>
</html>