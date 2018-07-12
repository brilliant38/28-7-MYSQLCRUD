<!-- 2018-07-11 �̱��� -->
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
		<h3>MemberList</h3>
		<table id="customers">
			<tr>
				<th>no</th>
				<th>name</th>
				<th>age</th>
				<th>�ּ��Է�</th>
				<th>�����Է�</th>
				<th>����Ȯ��</th>
				<th>����</th>
				<th>����</th>
			</tr>
		<%	
			request.setCharacterEncoding("euc-kr");
			int currentPage = 1;
			if(request.getParameter("currentPage") != null) { //������ Ŭ�� ������ �������� �ѱ��� ������ null�� ó���Ѵ�.
				currentPage = Integer.parseInt(request.getParameter("currentPage")); // String Ÿ������ �Ѿ�� "currentPage" ������ Ÿ���� int�� ��ȯ�Ͽ� �����Ѵ�.
			}    
 
			int pagePerRow = 5;
			
			String searchWord = request.getParameter("searchWord");
			System.out.println(searchWord + " : 01 searchWord check");
			
			MemberDao memberDao = new MemberDao();
			ArrayList<Member> list = memberDao.selectMemberByPage(currentPage, pagePerRow);
			System.out.println(list + " : 02 list check");
			
			ArrayList<Member> searchList = memberDao.searchMemberList(currentPage, pagePerRow, searchWord);
			System.out.println(searchList + " : 03 searchList check");
			
			int RowNumber = list.get(0).getRowNumber();
			if(searchList.size() > 0) {
				RowNumber = searchList.get(0).getRowNumber();
			}
			
			if (searchList.size() == 0) {
				for(int i=0; i<list.size(); i++) {
		%>
					<tr>
						<td><%=list.get(i).getMemberNo()%></td>
						<td><a href="./MemberAddrList.jsp?no=<%=list.get(i).getMemberNo()%>"><%=list.get(i).getMemberName()%></a></td>
						<td><%=list.get(i).getMemberAge()%></td>
						<td><a href="./InsertMemberAddrForm.jsp?no=<%=list.get(i).getMemberNo()%>">�ּ��Է�</a></td>
						<td><a href="./InsertMemberScoreForm.jsp?no=<%=list.get(i).getMemberNo()%>">�����Է�</a></td>
						<td><a href="./MemberAndPersonalScore.jsp?no=<%=list.get(i).getMemberNo()%>">����Ȯ��</a></td>
						<td><a href="./DeleteMemberAction.jsp?no=<%=list.get(i).getMemberNo()%>">����</a></td>
						<td><a href="./UpdateMemberForm.jsp?no=<%=list.get(i).getMemberNo()%>">����</a></td>
					</tr>
		<%
				}
			} else if (searchList.size() > 0) {
				for (int i=0; i<searchList.size(); i++) {
		%>
				<tr>
					<td><%=searchList.get(i).getMemberNo()%></td>
					<td><a href="./MemberAddrList.jsp?no=<%=searchList.get(i).getMemberNo()%>"><%=searchList.get(i).getMemberName()%></a></td>
					<td><%=searchList.get(i).getMemberAge()%></td>
					<td><a href="./InsertMemberAddrForm.jsp?no=<%=searchList.get(i).getMemberNo()%>">�ּ��Է�</a></td>
					<td><a href="./InsertMemberScoreForm.jsp?no=<%=searchList.get(i).getMemberNo()%>">�����Է�</a></td>
					<td><a href="./MemberAndPersonalScore.jsp?no=<%=searchList.get(i).getMemberNo()%>">����Ȯ��</a></td>
					<td><a href="./DeleteMemberAction.jsp?no=<%=searchList.get(i).getMemberNo()%>">����</a></td>
					<td><a href="./UpdateMemberForm.jsp?no=<%=searchList.get(i).getMemberNo()%>">����</a></td>
				</tr>
		<%
				}
			}
		%>
		</table>
		<form action="./MemberList.jsp" method="post">
			<div>
				�̸� :
				<input type="text" name="searchWord">
				<button type="submit">ȸ���˻�</button>
			</div>
		</form>
		<%
			if(currentPage>1) { //currentPage ���� 1���� Ŭ���� ����
				if(searchList.size() == 0) {
		%>
					<a href="./MemberList.jsp?currentPage=<%=currentPage-1%>">����</a> <!-- ���� ������ ��ư Ŭ���� "currentPage"������ currentPage-1�� ���� ���� --> 
		<%
				} else if (searchList.size() > 0) {
		%>
					<a href="./MemberList.jsp?currentPage=<%=currentPage-1%>&searchWord=<%=searchList.get(0).getSearchWord()%>">����</a> <!-- ���� ������ ��ư Ŭ���� "currentPage"������ currentPage-1�� ���� ���� -->
		<%
				}
			}
			int lastPage = ((RowNumber-1) / pagePerRow) +1 ; // rowNumber-1�� ���� �������� ���� ������ ���� ������ �������� �ѹ�.
			
			
			for(int i=1; i<lastPage; i++) {
		%>
				<a href="./MemberList.jsp?currentPage=<%=i%>">[<%=i%>]</a>
		<%
			}
			
			if(currentPage<lastPage) { //���� ������ �ѹ��� ������ ������ �ѹ����� �۾��������� ����.
				if(searchList.size() == 0) {
		%>
					<a href="./MemberList.jsp?currentPage=<%=currentPage+1%>">����</a> <!-- ���� ������ ��ư Ŭ���� "currentPage"������ currentPage+1�� ���� ���� -->
		<%
				} else if (searchList.size() > 0) {
		%>
					<a href="./MemberList.jsp?currentPage=<%=currentPage+1%>&searchWord=<%=searchList.get(0).getSearchWord()%>">����</a> <!-- ���� ������ ��ư Ŭ���� "currentPage"������ currentPage+1�� ���� ���� -->
		<%
				}
			}
		%>
		<br><br>
		<div>
		<a href = "./index.jsp">����ȭ������..</a>
		</div>
		<div>
		<a href="./InsertMemberForm.jsp">ȸ������</a>
		</div>
	</body>
</html>