<!-- 28�� ���ؼ� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
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
	StudentDao rownumber = new StudentDao();
	StudentDao studentdao = new StudentDao();
	ArrayList<Student> List = studentdao.selectStudent(currentPage, pagePerRow);
	System.out.println( rownumber + "<- list Ȯ��");
	System.out.println( student + "<- student Ȯ��");
	System.out.println( studentdao + "<- studentdaoȮ��");
	for(int i=0; i< List.size(); i++) {
		student =  List.get(i);
%>
	<tr>
		<td><%=student.getStudent_no() %></td> 
		<td><%=student.getStudent_name()%></td>
		<td><%=student.getStudent_age()%></td>
		<td><a href="./InsertStudentAddrForm.jsp">�ּ��Է�</a></td>
		<td><a href="./DeleteStudentAction.jsp?no=<%=student.getStudent_no()%>">����ĭ</a></td>
		<td><a href="./UpdateStudentForm.jsp?no=<%=student.getStudent_no()%>">����ĭ</a></td>
		<td></td>
		<td></td>
		</tr>
		<%
		}
		%>	
		</table>
		<form action="./StudentAndScore.jsp" method="post">
			<div>
				�̸� :
				<input type="text" name="student_name">
				<button type="submit">ȸ���˻�</button>
			</div>
		</form>
		<%
			if(currentPage>1) { //currentPage ���� 1���� Ŭ���� ����
		%>
			<a href="./StudentList.jsp?currentPage=<%=currentPage-1%>">����</a> <!-- ���� ������ ��ư Ŭ���� "currentPage"������ currentPage-1�� ���� ���� --> 
		<%
			}
			int lastPage = (List.get(0).getRowNumber()-1) / pagePerRow; // rowNumber-1�� ���� �������� ���� ������ ���� ������ �������� �ѹ�.
			
			if ((List.get(0).getRowNumber()-1) % pagePerRow !=0) { // rowNumber-1�� ���� �������� ���� ������ �������� 1�� �ƴҶ�
				lastPage++;
			}
			if(currentPage<lastPage) { //���� ������ �ѹ��� ������ ������ �ѹ����� �۾��������� ����.
		%>
			<a href="./StudentList.jsp?currentPage=<%=currentPage+1%>">����</a> <!-- ���� ������ ��ư Ŭ���� "currentPage"������ currentPage+1�� ���� ���� -->
		<%
			} 
		%>
	</body>
</html>