<!-- 2018-07-09 �̱��� -->
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
			table {
				width: 300px;
				border: 1px solid #444444;
				border-collapse: collapse;
				text-align:center;
			}
			th, td {
				border: 1px solid #444444;
			}
		</style>
	</head>
	<body>
		<table>
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
			
			String searchWord = URLDecoder.decode(request.getParameter("searchWord"),"euc-kr");
			
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
				Member member = memberAndScoreForMethod.getMember();
				MemberScore memberScore = memberAndScoreForMethod.getMemberScore();
				RowNumber = member.getRowNumber();
				
				//get�޼ҵ带 ȣ���Ͽ� �ش��ϴ� ���� �ҷ�����.
		%>
			<tr>
				<td><%=memberScore.getMemberScoreNo() %></td>
				<td><%=memberScore.getMemberNo() %></td>
				<td><%=member.getMemberName() %></td>
				<td><%=member.getMemberAge() %></td>
				<td><%=memberScore.getScore() %></td>
			</tr>
		<%
			}
		%>
		</table>
		<%
			if(currentPage>1) { //currentPage ���� 1���� Ŭ���� ����
		%>
			<a href="./MemberAndScore.jsp?currentPage=<%=currentPage-1%>&searchWord=<%=URLEncoder.encode(searchWord,"euc-kr")%>">����</a> <!-- ���� ������ ��ư Ŭ���� "currentPage"������ currentPage-1�� ���� ���� --> 
		<%
			}
			int lastPage = (RowNumber-1) / pagePerRow; // rowNumber-1�� ���� �������� ���� ������ ���� ������ �������� �ѹ�.
			
			if ((RowNumber-1) % pagePerRow !=0) { // rowNumber-1�� ���� �������� ���� ������ �������� 1�� �ƴҶ�
				lastPage++;
			}
			if(currentPage<lastPage) { //���� ������ �ѹ��� ������ ������ �ѹ����� �۾��������� ����.
		%>
			<a href="./MemberAndScore.jsp?currentPage=<%=currentPage+1%>&searchWord=<%=URLEncoder.encode(searchWord,"euc-kr")%>">����</a> <!-- ���� ������ ��ư Ŭ���� "currentPage"������ currentPage+1�� ���� ���� -->
		<%
			} 
		%>
	</body>
</html>