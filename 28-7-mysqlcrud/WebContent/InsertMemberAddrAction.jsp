<!-- 2018-06-26 �̱��� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.Member" %>
<%@ page import = "service.MemberAddr" %>
<%@ page import = "service.MemberAddrDao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>memberInsertAction</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euc-kr"); //�޴� ���� ������ euc-kr�� ���ڵ�
			
			String memberAddrContent = request.getParameter("memberAddrContent");
			System.out.println(memberAddrContent + " : name check");
			//���۵Ǵ� �� üũ
			
			Member member = new Member(); // Member ��ü ����
			MemberAddr memberAddr = new MemberAddr();	//MemberAddr ��ü ����
			
			
			MemberAddrDao memberAddrDao = new MemberAddrDao(); //Memberdao ��ü ����
			
			int result = memberAddrDao.insertMemberAddr(member, memberAddrDao);
			System.out.println("DB�� ȸ�� �Ѹ��� �߰��Ǿ����ϴ�.");
			
			response.sendRedirect("./memberInsert.jsp"); //memberInsert.jsp �������� �����̷�Ʈ
		%>
	</body>
</html>