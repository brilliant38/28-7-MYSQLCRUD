<!-- 2018-07-03 ���ؿ� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.TeacherDao"%>
<%@ page import = "service.Teacher" %>
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
			<tr>
				<th>no</th>
				<th>name</th>
				<th>age</th>
				<th>����</th>
				<th>����</th>
			</tr>
		<%
	        
			int currentPage = 1;
			if(request.getParameter("currentPage") != null) { //������ Ŭ�� ������ �������� �ѱ��� ������ null�� ó���Ѵ�.
				currentPage = Integer.parseInt(request.getParameter("currentPage")); // String Ÿ������ �Ѿ�� "currentPage" ������ Ÿ���� int�� ��ȯ�Ͽ� �����Ѵ�.
			}    
 
			int pagePerRow = 5;
			
			Teacher teacher = new Teacher();
			
			
			TeacherDao teacherDao = new TeacherDao();
			ArrayList<Teacher> list = teacherDao.selectteacherByPage(currentPage, pagePerRow);
			System.out.println(list + " : 01 list check");
			
			teacher = list.get(1);
			
			for(int i=0; i<list.size(); i++) {
				teacher = list.get(i);
		%>
				<tr>
					<td><%=teacher.getTeacherNo()%></td>
					<td><a href="./TeacherAddrList.jsp?=<%=no%>"><%=teacher.getTeacherName()%></a></td>
					<td><%=teacher.getTeacherAge()%></td>
					<td><a href="<%= request.getContextPath() %>./DeleteTeacherAction.jsp?send_id=<%=teacher.getTeacherName() %>">������ư</a>		
					<td><a href="<%= request.getContextPath() %>./UpdateTeacherAction.jsp?send_id=<%=teacher.getTeacherName() %>">������ư</a>	
					<!-- ./UpdateTeacherForm.jsp -> UpdateTeacherAction���� ����-->
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
			<a href="./TeacherList.jsp?currentPage=<%=currentPage-1%>">����</a> <!-- ���� ������ ��ư Ŭ���� "currentPage"������ currentPage-1�� ���� ���� --> 
		<%
			}
			int lastPage = (teacher.getRowNumber()-1) / pagePerRow; // rowNumber-1�� ���� �������� ���� ������ ���� ������ �������� �ѹ�.
			
			if ((teacher.getRowNumber()-1) % pagePerRow !=0) { // rowNumber-1�� ���� �������� ���� ������ �������� 1�� �ƴҶ�
				lastPage++;
			}
			if(currentPage<lastPage) { //���� ������ �ѹ��� ������ ������ �ѹ����� �۾��������� ����.
		%>
			<a href="./TeacherList.jsp?currentPage=<%=currentPage+1%>">����</a> <!-- ���� ������ ��ư Ŭ���� "currentPage"������ currentPage+1�� ���� ���� -->
		<%
			} 
		%>
		
	</body>
</html>