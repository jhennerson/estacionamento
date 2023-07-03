<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<title>Vagas</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/estilos.css">
</head>
	<body>
		<div class="container mt-5">
			<div class="container-fluid p-5 bg-dark text-white text-center">
				<h1 class="txt-center" id="lbl-admin">Administração</h1>
			</div>
			<div class="container main-box">
				<div class="container mt-3 d-flex justify-content-center border border-2 main-box">
					<div class="d-grid gap-2 col-6 mx-auto">
						<button type="button" class="btn btn-success text-white m-3 p-3" id="btnGerenciarVagas" onclick="document.location.href='Vagas.jsp'">Gerenciar	Vagas</button>
						<button type="button" class="btn btn-warning text-white m-3 p-3" id="btnGerenciarVendas" onclick="document.location.href='Vendas.jsp'">Gerenciar	Vendas</button>
						<button type="button" class="btn btn-danger text-white m-3 p-3" id="btnGerenciarBlocos" onclick="document.location.href='Blocos.jsp'">Gerenciar	Blocos</button>
						<button type="button" class="btn btn-info text-white m-3 p-3" id="btnGerenciarUsuarios" onclick="document.location.href='Operadores.jsp'">Gerenciar	Usuários</button>
						<button type="button" class="btn btn-dark text-white m-3 p-3" id="btnGerenciarPrecos" onclick="document.location.href='Precos.jsp'">Gerenciar	Preços</button>
					</div>				
				</div>
				
				<div class="container text-center" id="buttons">
					<form action="autenticador" method="GET">
						<button type="submit" value="submit" class="btn btn-danger p-3 m-3 btn-opcoes-pagina" id="btn-sair">Sair</button>
					</form>				
				</div>
			</div>
		</div>
		
		<%@ include file="Footer.jsp" %>
	</body>
</html>