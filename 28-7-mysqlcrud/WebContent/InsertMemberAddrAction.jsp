<!-- 2018-07-03 �̱��� -->
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
			
			String name = request.getParameter("name");
			String address = request.getParameter("address");
			System.out.println(name + " : name check");
			System.out.println(address + " : address check");
			//���۵Ǵ� �� üũ
			Member member = new Member();
			member.setMemberName(name);
			
			MemberAddr memberaddr = new MemberAddr(); // Member ��ü ����
			memberaddr.setMemberAddrContent(address);
			
			MemberAddrDao memberaddrdao = new MemberAddrDao(); //Memberdao ��ü ����
			int result = memberaddrdao.insertMemberAddr(member,memberaddr);
			System.out.println("DB�� ȸ�� �ּ� 1���� �߰��Ǿ����ϴ�.");
			
			response.sendRedirect("./InsertMemberAddrForm.jsp"); //InsertMemberAddrForm.jsp �������� �����̷�Ʈ
		%>
	</body>
</html>