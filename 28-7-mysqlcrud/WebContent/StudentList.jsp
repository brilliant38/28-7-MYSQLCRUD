<!-- 28�� ���ؼ� -->
<%@page import="java.util.ArrayList"%>
<%@page import="org.eclipse.jdt.internal.compiler.flow.FinallyFlowContext"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<%@ page import = "service.StudentDao" %>
<%@ page import = "service.Student" %>
�л� ����Ʈ <br>
<table width="100%" border="1">
<tr>
	<th>��ȣ(no)</th><th>�̸�(name)</th><th>����(age)</th><th>�ּ��Է�</th><th>����</th><th>����</th>
</tr>

<%
	        
			int currentPage = 1;
			if(request.getParameter("currentPage") != null) { //������ Ŭ�� ������ �������� �ѱ��� ������ null�� ó���Ѵ�.
				currentPage = Integer.parseInt(request.getParameter("currentPage")); // String Ÿ������ �Ѿ�� "currentPage" ������ Ÿ���� int�� ��ȯ�Ͽ� �����Ѵ�.
			}    
 
			int pagePerRow = 5;
			
			Student member = new Student();
			
			
			StudentDao memberDao = new StudentDao();
			ArrayList<Student> list = memberDao.SelectStudentPage(currentPage, pagePerRow);
			System.out.println(list + " : 01 list check");
			
			member = list.get(1);
			
			for(int i=0; i<list.size(); i++) {
				member = list.get(i);
		%>
		<tr>
					<td><%=Student.getStudent_no()%></td>
					<td><a href="./MemberAddrList.jsp?no=<%=no%>"><%=Student.getStudentName()%></a></td>
					<td><%=Student.getStudentAge()%></td>
					<td><a href="./DeleteMemberAction.jsp?send_id=<%=student_no%>">����</a></td>
					<td><a href="./UpdateMemberForm.jsp?send_id=<%=student_no%>">����</a></td>
					<!-- ./updateMemberForm.jsp -> updateMemberAction���� ����-->
				</tr>ss
			
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
			<a href="./Member_List.jsp?currentPage=<%=currentPage-1%>">����</a> <!-- ���� ������ ��ư Ŭ���� "currentPage"������ currentPage-1�� ���� ���� --> 
		<%
			}
			int lastPage = (member.getRowNumber()-1) / pagePerRow; // rowNumber-1�� ���� �������� ���� ������ ���� ������ �������� �ѹ�.
			
			if ((member.getRowNumber()-1) % pagePerRow !=0) { // rowNumber-1�� ���� �������� ���� ������ �������� 1�� �ƴҶ�
				lastPage++;
			}
			if(currentPage<lastPage) { //���� ������ �ѹ��� ������ ������ �ѹ����� �۾��������� ����.
		%>
			<a href="./Member_List.jsp?currentPage=<%=currentPage+1%>">����</a> <!-- ���� ������ ��ư Ŭ���� "currentPage"������ currentPage+1�� ���� ���� -->
		<%
			} 
		%>
		
