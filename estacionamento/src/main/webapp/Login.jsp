<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Login</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/estilos.css">
</head>
<body>
	<div class="container mt-5">

		<div class="container-fluid mb-3 p-5 bg-dark text-white text-center">
			<h1 id=lbl-login-main>Sistema Gerenciador de Estacionamento</h1>
		</div>

		<div class="container d-flex justify-content-center areaLogin border border-2 main-box">			
			<form id="form-login" class="w-25" action="autenticador" method="POST">
				<div class="my-3">
					<label for="form-login" class="form-label">Nome de usuário:</label>
					<input type="text" class="form-control" id="form-nome" name="nome" required>
				</div>
				<div class="my-3">
					<label for="form-login" class="form-label">Senha:</label>
					<input type="password" class="form-control" id="form-senha" name="senha" required>
				</div>			
				
				<div class="text-center d-grid gap-2">
					<input type="submit" value="Enviar" id="form-login-entrar" class="btn btn-success p-3 mb-3">
				</div>
				
				<div>
					<h6 class="my-3 text-center text-danger">${msg}</h6>
				</div>
			</form>
		</div>
	</div>

	<%@ include file="Footer.jsp" %>
</body>
</html>