<!-- 28�� ���ؼ� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"pageEncoding="EUC-KR"%>
<%@ page import = "service.StudentDao" %>
<%@ page import = "service.Student" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>studentList</title>
	</head>
	<body>
�л� ����Ʈ <br>

<table width="100%" border="1">
<tr>
	<th>��ȣ(no)</th>
	<th>�̸�(name)</th>
	<th>����(age)</th>
	<th>�ּ��Է�</th>
	<th>����</th>
	<th>����</th>
	<th>�����Է�</th>
	<th>��������</th>
</tr>

<%	
	int currentPage = 1;
	if(request.getParameter("currentPage") !=null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	int pagePerRow = 5;
	
	Student student = new Student();
	
	StudentDao studentdao = new StudentDao();
	ArrayList<Student> list = studentdao.selectStudent(currentPage, pagePerRow);
	
	for(int i=0; i<list.size(); i++) {
		student = list.get(i);
%>
	<tr>
		<td><%=student.getStudent_no() %></td>
		<td><a href="./StudentList.jsp?no=<%=student.getStudent_no() %>"><%=student.getStudent_name() %></a></td>
		<td><%=student.getStudent_age()%></td>
		<td><a href="./InsertStudentAddrForm.jsp">�ּ��Է�</a></td>
		<td><a href="./DeleteStudentAction.jsp?no=<%=student.getStudent_no()%>">����</a></td>
		<td><a href="./UpdateStudentForm.jsp?no=<%=student.getStudent_no()%>">����</a></td>
		</tr>
		<%
		}
		%>	
		</table>
		<form>
			<div>
				�̸� :
				<input type="text" name="searchWord">
			</div>
		</form>
		<%
			if(currentPage>1) { //currentPage ���� 1���� Ŭ���� ����
		%>
			<a href="./StudentList.jsp?currentPage=<%=currentPage-1%>">����</a> <!-- ���� ������ ��ư Ŭ���� "currentPage"������ currentPage-1�� ���� ���� --> 
		<%
			}
			int lastPage = (student.get()-1) / pagePerRow; // rowNumber-1�� ���� �������� ���� ������ ���� ������ �������� �ѹ�.
			
			if ((student.getRownumber()-1) % pagePerRow !=0) { // rowNumber-1�� ���� �������� ���� ������ �������� 1�� �ƴҶ�
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