<!-- 2018-07-02 �̱��� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.MemberDao"%>
<%@ page import = "service.Member" %>
<%@ page import = "java.util.ArrayList"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>memberList</title>
		<style>
			#customers {
			    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
			    border-collapse: collapse;
			    width: 500px;
			}
			
			#customers td, #customers th {
			    border: 1px solid #ddd;
			    padding: 8px;
			}
			
			#customers tr:nth-child(even){background-color: #f2f2f2;}
			
			#customers tr:hover {background-color: #ddd;}
			
			#customers th {
			    padding-top: 12px;
			    padding-bottom: 12px;
			    text-align: left;
			    background-color: #4CAF50;
			    color: white;
			}
		</style>
	</head>
	<body>
		<table id="customers">
			<tr>
				<th>no</th>
				<th>name</th>
				<th>age</th>
				<th>�ּ��Է�</th>
				<th>����</th>
				<th>����</th>
			</tr>
		<%
	        
			int currentPage = 1;
			if(request.getParameter("currentPage") != null) { //������ Ŭ�� ������ �������� �ѱ��� ������ null�� ó���Ѵ�.
				currentPage = Integer.parseInt(request.getParameter("currentPage")); // String Ÿ������ �Ѿ�� "currentPage" ������ Ÿ���� int�� ��ȯ�Ͽ� �����Ѵ�.
			}    
 
			int pagePerRow = 5;
			
			Member member = new Member();
			
			MemberDao memberDao = new MemberDao();
			ArrayList<Member> list = memberDao.selectMemberByPage(currentPage, pagePerRow);
			System.out.println(list + " : 01 list check");
			
			member = list.get(0);
			
			for(int i=0; i<list.size(); i++) {
				member = list.get(i);
		%>
				<tr>
					<td><%=member.getMemberNo()%></td>
					<td><a href="./MemberAddrList.jsp?no=<%=member.getMemberNo()%>"><%=member.getMemberName()%></a></td>
					<td><%=member.getMemberAge()%></td>
					<td><a href="./InsertMemberAddrForm.jsp">�ּ��Է�</a></td>
					<td><a href="./DeleteMemberAction.jsp?no=<%=member.getMemberNo()%>">����</a></td>
					<td><a href="./UpdateMemberForm.jsp?no=<%=member.getMemberNo()%>">����</a></td>
					<!-- ./updateMemberForm.jsp -> updateMemberAction���� ����-->
				</tr>
		<%
			}
		%>
		</table>
		<form action="./MemberAndScore.jsp" method="post">
			<div>
				�̸� :
				<input type="text" name="searchWord">
				<button type="submit">ȸ���˻�</button>
			</div>
		</form>
		<%
			if(currentPage>1) { //currentPage ���� 1���� Ŭ���� ����
		%>
			<a href="./MemberList.jsp?currentPage=<%=currentPage-1%>">����</a> <!-- ���� ������ ��ư Ŭ���� "currentPage"������ currentPage-1�� ���� ���� --> 
		<%
			}
			int lastPage = (member.getRowNumber()-1) / pagePerRow; // rowNumber-1�� ���� �������� ���� ������ ���� ������ �������� �ѹ�.
			
			if ((member.getRowNumber()-1) % pagePerRow !=0) { // rowNumber-1�� ���� �������� ���� ������ �������� 1�� �ƴҶ�
				lastPage++;
			}
			if(currentPage<lastPage) { //���� ������ �ѹ��� ������ ������ �ѹ����� �۾��������� ����.
		%>
			<a href="./MemberList.jsp?currentPage=<%=currentPage+1%>">����</a> <!-- ���� ������ ��ư Ŭ���� "currentPage"������ currentPage+1�� ���� ���� -->
		<%
			} 
		%>
		<br><br>
		<a href = "./index.jsp">����ȭ������..</a>
	</body>
</html>