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

	});
</script>
<style type="text/css">
	.table-counter {
		width: 8%;
	}
	
	.table-common {
		width: 30%;
	}
	
	.btn-usuario-view {
		width: 20%
	}
</style>
</head>
<body>
	<div class="container mt-5">
		<div class="container-fluid p-5 bg-primary text-white text-center">
			<h1 id="lblGerenciamentoDeUsuarios">Gerenciamento de Usuários</h1>
		</div>

		<table class="table table-striped table-bordered my-3 text-center align-middle" id="tblUsuarios">
			<thead>
				<tr>
					<th class="align-middle table-counter text-primary">ID</th>
					<th class="align-middle table-common text-primary">Username</th>
					<th class="align-middle table-common text-primary">Password</th>
					<th class="align-middle table-common text-primary">Bloco</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>

		<label class="fs-4">Usuário Selecionado:</label>
		
		<table class="table table-striped table-bordered my-3" id="tblUsuarioSelecionado">
			<tr>
				<td class="align-middle table-counter"></td>
				<td class="align-middle table-common"></td>
				<td class="align-middle table-common"></td>
				<td class="align-middle table-common"></td>
			</tr>
		</table>

		<div class="container text-center">
				<button type="submit" class="btn btn-primary p-3 m-1 btn-usuario-view" id="btnCadastrar">Cadastrar</button>
				<button type="button" class="btn btn-primary p-3 m-1 btn-usuario-view" id="btnEditar">Editar</button>
				<button type="button" class="btn btn-primary p-3 m-1 btn-usuario-view" id="btnRelatorio">Deletar</button>
				<button type="button" class="btn btn-primary p-3 m-1 btn-usuario-view" id="btnVoltar">Voltar</button>
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