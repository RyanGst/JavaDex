<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.trabalho.trabalho.dao.TeamDao, com.trabalho.trabalho.bean.*, java.util.List"
         contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="components/header.jsp"/>
		<link rel="stylesheet" href="styles/index.css"/>
	</head>
	<body class="nes-container" style="height: 100%">


		<div>
			<h1>CRIE SEU TIME!</h1>
		</div>
		<section>
			<button type="button" class="nes-btn is-primary"
			        onclick="document.getElementById('dialog-default').showModal();">
				NOVO TIME
			</button>
			<dialog class="nes-dialog" id="dialog-default">
				<form method="post" action="create.jsp">
					<p>Criando novo time</p>
					<menu class="dialog-menu">
						<div class="nes-field">
							<label for="title">Nome do time</label>
							<input type="text" id="title" class="nes-input" name="title">
						</div>
						<label for="game">Jogo do time</label>
						<div class="nes-select">
							<select name="game" id="game">
								<option value="" disabled selected hidden>Selecione seu jogo...</option>
								<option value="RB">RED AND BLUE</option>
								<option value="GS">GOLD AND SILVER</option>
								<option value="RS">RUBY AND SAPPHIRE</option>
							</select>
						</div>
						<button class="nes-btn">CANCELAR</button>
						<button class="nes-btn is-primary">CONFIRMAR</button>
					</menu>
				</form>
			</dialog>
		</section>
		<section class="nes-container is-dark with-title">
			<h3 class="title"> Listagem de times</h3>
			<%
				List<Team> list = TeamDao.getTeams();
				request.setAttribute("list", list);
			%>
			<div class="nes-table-responsive">
				<table class="nes-table is-bordered is-centered is-dark">
					<thead>
						<tr>
							<th>ID</th>
							<th>Nome do time</th>

							<th>Jogo</th>
							<th>Adicionar Pokemons</th>
							<th>Editar</th>
							<th>Remover</th>
						</tr>
					</thead>
					<c:forEach items="${list}" var="team">
						<tr>
							<td>
									${team.getId()}
							</td>
							<td>
									${team.getTitle()}
							</td>
							<td>
									${team.getGame()}
							</td>
							<td>
								<a href="listing.jsp?id=${team.getId()}">
									<i class="nes-icon is-large star"></i>

								</a>
							</td>
							<td>
								<a href="editTeam.jsp?id=${team.getId()}">
									<i class="nes-icon trophy is-medium"></i>

								</a>
							</td>
							<td>
								<a href="deleteTeam.jsp?id=${team.getId()}">
									<i class="nes-icon close is-medium"></i>
								</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</section>
	</body>
</html>