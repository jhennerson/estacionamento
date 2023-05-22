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
	
	.btn-bloco-view {
		width: 20%
	}
</style>
</head>
<body>
	<div class="container mt-5">
		<div class="container-fluid p-5 bg-primary text-white text-center">
			<h1 id="lblGerenciamentoDeVagas">Gerenciamento de Blocos</h1>
		</div>

		<table class="table table-striped table-bordered my-3 text-center align-middle" id="tblBlocos">
			<thead>
				<tr>
					<th class="align-middle table-counter text-primary">ID</th>
					<th class="align-middle text-primary">Descrição</th>
					<th class="align-middle text-primary">Operador</th>
					<th class="align-middle table-counter text-primary">Vagas Carro</th>
					<th class="align-middle table-counter text-primary">Vagas Moto</th>
					<th class="align-middle table-counter text-primary">Vagas Deficiente</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
		
		<label class="fs-4">Bloco Selecionado:</label>
		
		<table class="table table-striped table-bordered" id="tblLinhaSelecionada">
			<tr>
				<td class="align-middle table-counter"></td>
				<td class="align-middle"></td>
				<td class="align-middle"></td>
				<td class="align-middle table-counter"></td>
				<td class="align-middle table-counter"></td>
				<td class="align-middle table-counter"></td>
			</tr>
		</table>
		
		<form action="/action_page.php">
			<div class="mb-3">
				<label class="form-label fs-6 fw-normal" id="lblVagasCarros">Vagas para carros:</label>
				<input type="number" class="form-control" id="vagasCarros" name="spinnerVagasCarros">
			</div>

			<div class="mb-3">
				<label class="form-label fs-6 fw-normal" id="lblVagasMotos">Vagas para motos:</label>
				<input type="number" class="form-control" id="vagasMotos" name="spinnerVagasMotos">
			</div>

			<div class="mb-3">
				<label class="form-label fs-6 fw-normal" id="lblVagasDeficientes">Vagas para deficientes:</label>
				<input type="number" class="form-control" id="vagasDeficientes" name="spinnerVagasDeficientes">
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-primary p-3 m-1 btn-bloco-view" id="btnEditar">Atualizar</button>
				<button type="button" class="btn btn-primary p-3 m-1 btn-bloco-view" id="btnCalcular">Cadastrar</button>
				<button type="button" class="btn btn-primary p-3 m-1 btn-bloco-view" id="btnRelatorio">Deletar</button>
				<button type="button" class="btn btn-primary p-3 m-1 btn-bloco-view" id="btnVoltar">Voltar</button>
			</div>			
		</form>
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