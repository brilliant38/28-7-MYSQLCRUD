<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import ="service.StudentAndScore"%>
<%@ page import ="service.StudentScore" %>
<%@ page import ="service.StudentScoreDao" %>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.net.URLDecoder"%>
<!DOCTYPE html>
<table width="100%" border="1">
<tr>
	<td>점수번호</td><td>학생번호</td><td>점수</td>
</tr>
	<%
		request.setCharacterEncoding("euc-kr");
	
		int currentPage = 1;
		if(request.getParameter("currentPage") !=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));		
		}
		int pagePerRow = 5;
		
		int RowNumber = 0;
		
		String searchWord = URLDecoder.decode(request.getParameter("searchWord"),"euc-kr");
		
		System.out.println(searchWord + "<- 1st searchWord");
		
		if(searchWord == null) {
			searchWord = "";
		}
		
		StudentScoreDao studentScoreDao = new StudentScoreDao();
		ArrayList<StudentAndScore> get_alm = studentScoreDao.selectStudentListAboveAvg(currentPage, pagePerRow);
		for(int i=0; i<get_alm.size(); i++) {
			StudentAndScore studentAndForMethod = get_alm.get(i);
			RowNumber = get_alm.get(i).getStudent().getRowNumber();
	%>
		<tr>
			<td><%= get_alm.get(1).getStudentScore().getStudent_score_no() %></td>
			<td><%= get_alm.get(1).getStudent().getStudent_no() %></td>
			<td><%= get_alm.get(1).getStudent().getStudent_name()%></td>
			<td><%= get_alm.get(1).getStudent().getStudent_age() %></td>
			<td><%= get_alm.get(1).getStudent().getStudent_no() %></td>
			<td><%= get_alm.get(1).getStudentScore().getScore() %></td>
		</tr>
		<%
		}
		%>
		</table>
		<%
			if(currentPage>1) {
		%>
			<a href="./StudentAndScore.jsp?currentPage=<%=currentPage-1%>&searchWord=>">이전</a>
		<%
			}
			int lastPage = (RowNumber-1) /pagePerRow;
			
			if ((RowNumber-1) % pagePerRow !=0) {
				lastPage++;
			}
			if(currentPage<lastPage) {
				%>
				<a href="./StudentAndScore.jsp?currentPgge=<%=currentPage+1 %>&searchWord=">다음</a>
		<%
			} 
		%>
				<% %>
			}
			