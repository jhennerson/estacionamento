<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".formLogin").submit(function(e) {
			e.preventDefault();
			alert("Login");
		});
	});
</script>
<style type="text/css">
body {
	
}

.areaCadUser {
	width: 50%;
	margin-left: 25%;
}
</style>
</head>
<body>
	<div class="container mt-5">

		<div class="container-fluid p-5 bg-primary text-white text-center">
			<h1 id=lblProjetoSistemaDeEstacionamento>Sistema Gerenciador de Estacionamento</h1>
		</div>

		<div
			class="container d-flex justify-content-center areaLogin border border-2">
			<form class="formLogin">
				<div class="my-3">
					<label for="text" class="form-label">Nome de usuário:</label>
					<input type="text" class="form-control" id="formNome" name="formNome">
				</div>
				<div class="my-3">
					<label for="pwd" class="form-label">Senha:</label>
					<input type="password" class="form-control" id="formSenha" name="formSenha">
				</div>
				<div class="text-center d-grid gap-2">
					<button type="submit" class="btn btn-success p-3 mb-3">Entrar</button>
				</div>
			</form>
		</div>
	</div>

	<div class="container mt-5">
		<div class="mt-5 p-4 bg-dark text-white text-center">
			<p>Instituto Federal de Educação Ciência e Tecnologia de São Paulo - Câmpus Guarulhos</p>
			<p>Desenvolvido por: Jhennerson Barbosa da Silva</p>
			<p>Professor: Cleber Oliveira - Disciplina: Projeto Web</p>
		</div>
	</div>

</body>
</html>