<%@ page import="com.trabalho.trabalho.dao.TeamDao, com.trabalho.trabalho.bean.Team" %>
<jsp:useBean id="u" class="com.trabalho.trabalho.bean.Team"></jsp:useBean>
<jsp:setProperty name="u" property="*"/>
<%
	int i = TeamDao.updateTeam(u);
    System.out.println(i);
	response.sendRedirect("index.jsp");
%>
