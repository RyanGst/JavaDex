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
			<h1>MODIFIQUE SEU TIME: </h1>
		</div>

		<%
			String id = request.getParameter("id");
			Team team = TeamDao.getTeamById(Integer.parseInt((id)));
		%>

		<form method="post" action="sendEditTeam.jsp">
			<menu class="dialog-menu">
				<input type="hidden" id="id" class="nes-input" value="<%=team.getId()%>" name="id">
				<div class="nes-field is-dark">
					<label for="title">Nome do time</label>
					<input type="text" id="title" class="nes-input" value="<%=team.getTitle()%>" name="title">
				</div>
				<label for="game">Jogo do time</label>
				<div class="nes-select">
					<select name="game" id="game" value="<%=team.getGame()%>">
						<option value="RB">RED AND BLUE</option>
						<option value="GS">GOLD AND SILVER
						</option>
						<option value="RS">RUBY AND SAPPHIRE
						</option>
					</select>
				</div>
				<button class="nes-btn">CANCELAR</button>
				<button type="submit" class="nes-btn is-primary">CONFIRMAR</button>
			</menu>
		</form>
	</body>
</html>