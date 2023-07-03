<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<title>Painel</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/estilos.css">
</head>
	<body>
		<div class="container mt-5">
			<div class="container-fluid mb-3 p-5 bg-dark text-white text-center">
				<h1 class="txt-center" id="lbl-operador">Administração</h1>
			</div>
			<div class="container mt-3 d-flex justify-content-center border border-2 main-box">
				<div class="d-grid gap-2 col-6 mx-auto">
					<button type="button" class="btn btn-success text-white m-3 p-3" id="btnGerenciarVagas" onclick="document.location.href='Vagas.jsp'">Gerenciar	Vagas</button>
					<button type="button" class="btn btn-warning text-white m-3 p-3" id="btnGerenciarVendas" onclick="document.location.href='Vendas.jsp'">Gerenciar	Vendas</button>
				</div>				
			</div>
			
			<div class="container text-center" id="buttons">
				<form action="autenticador" method="GET">
					<button type="submit" value="submit" class="btn btn-danger p-3 m-3 btn-opcoes-pagina" id="btn-sair">Sair</button>
				</form>				
			</div>
		</div>
		
		<%@ include file="Footer.jsp" %>
	</body>
</html>