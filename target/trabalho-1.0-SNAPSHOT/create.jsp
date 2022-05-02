<%@ page import="com.trabalho.trabalho.bean.*, com.trabalho.trabalho.dao.*" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<jsp:useBean id="u" class="com.trabalho.trabalho.bean.Team"></jsp:useBean>
<jsp:setProperty name="u" property="*"/>

<%
	Team newTeam = TeamDao.createTeam(u);
	response.sendRedirect("listing.jsp");
%>