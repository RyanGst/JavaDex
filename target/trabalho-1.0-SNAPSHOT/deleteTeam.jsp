<%@ page import="com.trabalho.trabalho.bean.*, com.trabalho.trabalho.dao.*" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.util.Objects" %>
<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="components/header.jsp"/>
		<link rel="stylesheet" href="styles/index.css"/>
	</head>
	<body>
		<div class="box">
			<h1>TIME DELETADO COM SUCESSO! </h1>
		</div>
		<%
			String id = request.getParameter("id");
			TeamDao.deleteTeam(Integer.parseInt((id)));
            response.sendRedirect("index.jsp");
		%>
	</body>
</html>