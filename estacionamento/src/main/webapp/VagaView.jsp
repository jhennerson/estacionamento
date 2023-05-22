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
	
	.table-datetime {
		width: 20%;
	}
	
	.table-common {
		width: 23%;
	}
	
	.btn-vaga-view {
		width: 14%;
	}
	
	.btn-alterar-estado {
		width: 28%
	}
</style>
</head>
<body>
	<div class="container mt-5">
		<div class="container-fluid p-5 bg-primary text-white text-center">
			<h1 id="lblGerenciamentoDeVagas">Gerenciamento de Vagas</h1>
		</div>
		
		<div class="d-flex m-3 justify-content-evenly align-items-center">
			<div class="d-flex">
				<label class="fs-2" id="lblSpanVagasLivres">Vagas Livres:</label>
				<div class="border border-2 mx-2 px-3">
					<span class="fs-3" id="spanVagasLivres"></span>
				</div>
			</div>
	
			<div class="d-flex">
				<label class="fs-2" id="lblSpanVagasOcupadas">Vagas Ocupadas:</label>
				<div class="border border-2 mx-2 px-3">
					<span class="fs-3" id="spanVagasOcupadas"></span>
				</div>
			</div>
		</div>
		
		<table class="table table-striped table-bordered my-3 text-center align-middle" id="tblVagas">
			<thead>
				<tr>
					<th class="align-middle table-counter text-primary">ID</th>
					<th class="align-middle table-common text-primary">Categoria</th>
					<th class="align-middle table-common text-primary">Bloco</th>
					<th class="align-middle table-common text-primary">Estado</th>
					<th class="align-middle table-datetime text-primary">Início da Ocupação</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
		
		<label class="fs-4">Vaga Selecionada:</label>
		
		<table class="table table-striped table-bordered my-3 text-center align-middle" id="tblLinhaSelecionada">
			<tr>
				<th class="align-middle table-counter text-danger"></th>
				<th class="align-middle table-common text-danger"></th>
				<th class="align-middle table-common text-danger"></th>
				<th class="align-middle table-common text-danger"></th>
				<th class="align-middle table-datetime text-danger"></th>
			</tr>
		</table>

		<div class="d-flex m-3 justify-content-evenly align-items-center">
			<div class="d-flex">
				<label class="fs-3" id="lblSpanTempoOcupado">Tempo ocupado:</label>
				<div class="border border-2 mx-2 px-3">
					<span class="fs-3" id="spanTempoOcupado"></span>
				</div>
			</div>
	
			<div class="d-flex">
				<label class="fs-3" id="lblSpanValorTotal">Valor total:</label>
				<div class="border border-2 mx-2 px-3">
					<span class="fs-3" id="spanValorTotal"></span>
				</div>
			</div>
		</div>


		<div class="d-flex my-3" id="buttons">
			<button type="button" class="btn btn-primary p-3 m-1 btn-vaga-view" id="btnLimpar">Limpar</button>
			<button type="button" class="btn btn-primary p-3 m-1 btn-vaga-view" id="btnCalcular">Calcular</button>
			<button type="button" class="btn btn-primary p-3 m-1 btn-vaga-view" id="btnSalvar">Salvar</button>
			<button type="button" class="btn btn-primary p-3 m-1 btn-vaga-view" id="btnRelatorio">Relatório</button>
			<button type="button" class="btn btn-primary p-3 m-1 btn-vaga-view" id="btnVoltar">Voltar</button>
			<button type="button" class="btn btn-danger p-3 m-1 btn-alterar-estado fs-4" id="btnAlterarEstado">Alterar Estado</button>
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