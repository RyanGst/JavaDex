<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="components/header.jsp"/>
		<link rel="stylesheet" href="styles/index.css"/>
	</head>
	<body>
		<div class="nes-container">
			<h1>ESCOLHA SEU TIME!</h1>
			<a class="nes-btn" href="<%="editTeam.jsp?id=" + request.getParameter("id")%>">Ver meu time</a>
			<ul id="pokedex"></ul>
			<script src="js/index.js"></script>
		</div>
	</body>
</html>