<!--  28기 구해성 2018-07-13 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import ="service.StudentAndScore"%>
<%@ page import ="service.StudentScore" %>
<%@ page import ="service.StudentScoreDao" %>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.net.URLDecoder"%>
<!DOCTYPE html>
<table border="1">
<tr>
	<td>점수번호</td><td>학생번호</td><td>이름</td><td>점수</td>
</tr>
	<%
		request.setCharacterEncoding("euc-kr");
	
		int currentPage = 1;
		if(request.getParameter("currentPage") !=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));		
		}
		int pagePerRow = 5;
		
		int RowNumber = 0;
		
	
	
		
		StudentScoreDao studentScoreDao = new StudentScoreDao();
		ArrayList<StudentAndScore> list = studentScoreDao.selectStudentListAboveAvg(currentPage, pagePerRow);
		for(int i=0; i<list.size(); i++) {
			RowNumber = list.get(i).getStudent().getRowNumber();
	%>
		<tr>
			<td><%= list.get(i).getStudentScore().getStudent_score_no() %></td>
			<td><%= list.get(i).getStudent().getStudent_no() %></td>
			<td><%= list.get(i).getStudent().getStudent_name()%></td>
			<td><%= list.get(i).getStudentScore().getScore() %></td>
		</tr>
		<%
		}
		%>
		</table>
		 <%
			if(currentPage>1) {
		%>
			<a href="../StudentAndScore.jsp?currentPage=<%=currentPage-1%>&searchWord=>">이전</a>
		<%
			}
			int lastPage = (RowNumber-1) /pagePerRow;
			
			if ((RowNumber-1) % pagePerRow !=0) {
				lastPage++;
			}
			if(currentPage<lastPage) {
				%>
				<a href="../StudentAndScore.jsp?currentPgge=<%=currentPage+1 %>&searchWord=">다음</a>
		<%
			} 
		%> 