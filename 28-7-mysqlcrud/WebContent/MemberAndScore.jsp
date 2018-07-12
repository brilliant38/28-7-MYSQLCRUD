<!-- 2018-07-09 �̱��� -->
<!--MemberList.jsp���� No���� �޾ƿͼ� MemberAndScore ��ü�� �� DTO�� �ҷ��ͼ� ȸ�� ���� �̸��� ������ ���Ϲ޾� �����ִ� ȭ�� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.MemberAndScore" %>
<%@ page import = "service.MemberScoreDao" %>
<%@ page import = "service.Member" %>
<%@ page import = "service.MemberScore" %>
<%@ page import = "java.util.ArrayList" %>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>memberAndScore</title>
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
		<h3>MemberAndScore</h3>
		<table id="customers">
			<tr>
				<th>������ȣ</th>
				<th>ȸ����ȣ</th>
				<th>ȸ���̸�</th>
				<th>ȸ������</th>
				<th>�������</th>
			</tr>
		<%	
			request.setCharacterEncoding("euc-kr");
			
			int currentPage = 1;
			if(request.getParameter("currentPage") != null) { //������ Ŭ�� ������ �������� �ѱ��� ������ null�� ó���Ѵ�.
				currentPage = Integer.parseInt(request.getParameter("currentPage")); // String Ÿ������ �Ѿ�� "currentPage" ������ Ÿ���� int�� ��ȯ�Ͽ� �����Ѵ�.
			}
			
			int pagePerRow = 5;//�������� ǥ���� ���� ���� ���Ѵ�.
			
			int RowNumber = 0;//��ü ���� ���� ������ ������ �����.
			
			String searchWord = request.getParameter("searchWord");
			
			System.out.println(searchWord + " : searchWord called");
			
			if(searchWord == null) {//searchWord ������ ���� null�̶�� �������� �ٲ� �Է����ش�.
				searchWord = "";
			}
			
			//ù ������ ��ȣ, �������� ǥ���� ���� ��, �˻�� �Ű������� �Է��Ͽ� ȸ�������� ȸ���� ������ �ҷ��� �޼ҵ带 ȣ���Ѵ�.
			MemberScoreDao memberScoreDao = new MemberScoreDao();
			ArrayList<MemberAndScore> memberAndScore = memberScoreDao.selectMemberAndScored(currentPage, pagePerRow, searchWord);
			
			//����Ʈ�� ����ִ� ��ü���� ������ Ÿ�Կ� �´� ������ �ּҰ��� get �Ѵ�. 
			for(int i=0; i<memberAndScore.size(); i++) {
				MemberAndScore memberAndScoreForMethod = memberAndScore.get(i);
				RowNumber = memberAndScore.get(1).getMember().getRowNumber();
				
				//get�޼ҵ带 ȣ���Ͽ� �ش��ϴ� ���� �ҷ�����.
		%>
				<tr><!-- ü���� �̿��ؼ� �޼ҵ� ȣ�� -->
					<td><%=memberAndScore.get(1).getMemberScore().getMemberScoreNo() %></td>
					<td><%=memberAndScore.get(1).getMember().getMemberNo() %></td>
					<td><%=memberAndScore.get(1).getMember().getMemberName() %></td>
					<td><%=memberAndScore.get(1).getMember().getMemberAge() %></td>
					<td><%=memberAndScore.get(1).getMemberScore().getScore() %></td>
				</tr>
		<%
			}
		%>
		</table>
		<%
			if(currentPage>1) { //currentPage ���� 1���� Ŭ���� ����
		%>
			<a href="./MemberAndScore.jsp?currentPage=<%=currentPage-1%>&searchWord=<%=searchWord%>">����</a> <!-- ���� ������ ��ư Ŭ���� "currentPage"������ currentPage-1�� ���� ���� --> 
		<%
			}
			int lastPage = (RowNumber-1) / pagePerRow; // rowNumber-1�� ���� �������� ���� ������ ���� ������ �������� �ѹ�.
			
			if ((RowNumber-1) % pagePerRow !=0) { // rowNumber-1�� ���� �������� ���� ������ �������� 1�� �ƴҶ�
				lastPage++;
			}
			if(currentPage<lastPage) { //���� ������ �ѹ��� ������ ������ �ѹ����� �۾��������� ����.
		%>
			<a href="./MemberAndScore.jsp?currentPage=<%=currentPage+1%>&searchWord=<%=searchWord%>">����</a> <!-- ���� ������ ��ư Ŭ���� "currentPage"������ currentPage+1�� ���� ���� -->
		<%
			} 
		%>
	</body>
</html>