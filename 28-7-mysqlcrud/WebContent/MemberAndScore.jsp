<!-- 2018-07-09 �̱��� -->
<!--MemberList.jsp���� No���� �޾ƿͼ� MemberAndScore ��ü�� �� DTO�� �ҷ��ͼ� ȸ�� ���� �̸��� ������ ���Ϲ޾� �����ִ� ȭ�� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.MemberAndScore" %>
<%@ page import = "service.MemberScoreDao" %>
<%@ page import = "service.Member" %>
<%@ page import = "service.MemberScore" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>memberAndScore</title>
	</head>
	<body>
		<h3>MemberAndScore</h3>
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
			
			int no = Integer.parseInt(request.getParameter("no"));
			
			//ù ������ ��ȣ, �������� ǥ���� ���� ��, �˻�� �Ű������� �Է��Ͽ� ȸ�������� ȸ���� ������ �ҷ��� �޼ҵ带 ȣ���Ѵ�.
			MemberScoreDao memberScoreDao = new MemberScoreDao();
			ArrayList<MemberAndScore> memberAndScore = memberScoreDao.MemberAndScore(no);
			
			//����Ʈ�� ����ִ� ��ü���� ������ Ÿ�Կ� �´� ������ �ּҰ��� get �Ѵ�. 
			for(int i=0; i<memberAndScore.size(); i++) {
				MemberAndScore memberAndScoreForMethod = memberAndScore.get(i);
				
				//get�޼ҵ带 ȣ���Ͽ� �ش��ϴ� ���� �ҷ�����.
		%>
				<tr><!-- ü���� �̿��ؼ� �޼ҵ� ȣ�� -->
					<td><%=memberAndScore.get(i).getMemberScore().getMemberScoreNo() %></td>
					<td><%=memberAndScore.get(i).getMember().getMemberNo() %></td>
					<td><%=memberAndScore.get(i).getMember().getMemberName() %></td>
					<td><%=memberAndScore.get(i).getMember().getMemberAge() %></td>
					<td><%=memberAndScore.get(i).getMemberScore().getScore() %></td>
				</tr>
		<%
			}
		%>
		</table>
	</body>
</html>