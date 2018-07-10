<!-- 2018.07.10 ���ؿ�-->
<!-- TeacherList  -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Teacher List</title>
	</head>
	<body>
		<%
			// �ѱ��� �Է¹ޱ� ����
			request.setCharacterEncoding("euc-kr");
			
			// �˻�� ���޹޴� ����
			String searchValue = "";
			if(request.getParameter("searchValue") != null){
				searchValue = request.getParameter("searchValue");
			}
			
			System.out.println(searchValue);
			
			// ����¡ �˰���
			int rowPerPage = 5;
			int currentPage = 1;
			if(request.getParameter("currentPage") != null){
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			// TeacherDao ��ü ����
			TeacherDao teacherDao = new TeacherDao();
			
			// teacherAddrDao ��ü ����
			TeacherAddrDao teacherAddrDao = new TeacherAddrDao();
			
			// selectTeacherByPage �޼��带 ���� ���ϵǴ� ���� ��(arrayListTeacher��ü�� ������)�� ����
			ArrayList<Teacher> arrayListTeacher = teacherDao.selectTeacherByPage(currentPage, rowPerPage, searchValue);
			
			// ������ ������
			int lastPage = teacherDao.countTotalRecordsBySearchValue(searchValue) / rowPerPage;
			if ((teacherDao.countTotalRecordsBySearchValue(searchValue) % rowPerPage) != 0){
				lastPage++;
			}
		%>
		<h1>Teacher</h1>
		<table border="1">
			<tr>
				<td>���� ��ȣ</td>
				<td>���� �̸�</td>
				<td>���� ����</td>
				<td>�ּ� �Է�</td>
				<td>���� �Է�</td>
				<td>���� ����</td>
				<td>�� ��</td>
				<td>�� ��</td>
			</tr>
			<% 
				// size() �޼���� ������ �ε��� ������ ��� ������ �������ش�.
				// ex) arrayListTeacher[17] ���� �����͸� ���� ���� ��� 18�� ����
				for(int i = 0; i < arrayListTeacher.size(); i++){
					// get�޼��带 ���� ������ ��ҿ� ����� Teacher ��ü�� �ҷ��´�.
					Teacher teacher = arrayListTeacher.get(i);
					
					// selectTeacherAddress �޼��带 ȣ���ϰ� ���Ϲ��� TeacherAddr��ü�� ���� ���� teacherAddr ��ü ���������� ���� 
					TeacherAddr teacherAddr = teacherAddrDao.selectTeacherAddress(teacher.getTeacherNo());
			%>
					<tr>
						<td><%= teacher.getTeacherNo() %></td>
						<%
							// �ش� ������ �ּ� ������ �����Ѵٸ�
							if(teacherAddr != null){
						%>
								<td><a href="<%= request.getContextPath() %>/TeacherAddrList.jsp?teacherNo=<%= teacher.getTeacherNo() %>"><%= teacher.getTeacherName() %></a></td>
						<%	
							// �� ��
							} else {
						%>
								<td><%= teacher.getTeacherName() %></td>
						<%
							}
						%>
						<td><%= teacher.getTeacherAge() %></td>
						<td><a href="<%= request.getContextPath() %>/InsertTeacherAddrForm.jsp?teacherNo=<%= teacher.getTeacherNo() %>">�ּ� �Է�</a></td>
						<td><a href="<%= request.getContextPath() %>/InsertTeacherScoreForm.jsp?teacherNo=<%= teacher.getTeacherNo() %>">���� �Է�</a></td>
						<td><a href="<%= request.getContextPath() %>/TeacherScoreList.jsp?teacherNo=<%= teacher.getTeacherNo() %>">���� ����</a></td>
						<td><a href="<%= request.getContextPath() %>/UpdateTeacherForm.jsp?teacherNo=<%= teacher.getTeacherNo() %>">���� ��ư</a></td>
						<td><a href="<%= request.getContextPath() %>/DeleteTeacherAction.jsp?teacherNo=<%= teacher.getTeacherNo() %>">���� ��ư</a></td>
					</tr>
			<% 
				}
			%>
		</table>
		<br>
		<div>
			<%
				if(currentPage > 1){
			%>
					<a href="<%= request.getContextPath() %>/TeacherList.jsp?currentPage=<%= currentPage - 1 %>&searchValue=<%= searchValue %>">&lt; ����</a>
			<%
				} else {
			%>
					<span>&lt; ����</span>
			<%
				}
				
				if(currentPage < lastPage){
			%>
					<a href="<%= request.getContextPath() %>/TeacherList.jsp?currentPage=<%= currentPage + 1 %>&searchValue=<%= searchValue %>">���� &gt;</a>
			<%
				} else {
			%>
					<span>���� &gt;</span>
			<%
				}
			%>
		</div>
		<br>
		<div>
			<form action="<%= request.getContextPath() %>/TeacherList.jsp" method="post">
				<label>�̸� :  
					<input type="text" name="searchValue">
				</label>
				<button>�˻�</button>
			</form>
		</div>
		<br>
		<a href="<%= request.getContextPath() %>/index.jsp">teacherIndex�� �̵�</a>
	</body>
</html>