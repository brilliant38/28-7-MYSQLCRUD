<!-- 2018-07-03 �̱��� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.MemberDao"%>
<%@ page import = "service.Member" %>
<%@ page import = "java.util.ArrayList"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>UpdateMemberForm</title>
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
		<h3>ȸ����������</h3>
		<form action="./UpdateMemberAction.jsp" method="post">
			<table id="customers">
			<%
		        request.setCharacterEncoding("euc-kr");
				
				int memberNo = Integer.parseInt(request.getParameter("no"));
				
				Member member = new Member();
				
				MemberDao memberDao = new MemberDao();
				ArrayList<Member> list = memberDao.updateForSelectMember(memberNo);
				System.out.println(list + " : 01 list check");
				
				member = list.get(0);
				
			%>
				<tr>
					<th>�̸�</th>
					<td><input type="text" name="name" size="17" value="<%=member.getMemberName()%>"></td>
				</tr>
				<tr>
					<th>����</th>
					<td><input type="text" name="age" size="17" value="<%=member.getMemberAge()%>"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="ȸ����������">
						<span>
							<input type="hidden" name="no" value="<%=memberNo %>">
						</span>
					</td>
				</tr>
				
			</table>
		</form>
		<!-- <form>
			<div>
				�̸� :
				<input type="text" name="searchWord">
			</div>
		</form> -->
	</body>
</html>