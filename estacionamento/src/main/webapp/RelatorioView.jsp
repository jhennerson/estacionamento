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
		width: 40%;
	}
	
	.relatorio-value {
		width: 40%;
	}	
</style>
</head>
<body>
	<div class="container">
		<div class="container-fluid p-5 bg-primary text-white text-center">
			<h1 id="lblRelatorio">Relatório</h1>
		</div>

		<table class="table table-striped table-bordered my-3 text-center align-middle" id="tblBlocos">
			<thead>
				<tr>
					<th class="text-primary">ID</th>
					<th class="text-primary">Valor</th>
					<th class="text-primary">Data/Hora</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="table-counter"></td>
					<td></td>
					<td class="table-datetime"></td>
				</tr>
			</tbody>
		</table>


		<div class="d-flex">
			<div>
				<label class="total-label text-danger fw-bold fs-3">Valor total R$:</label>
			</div>			
			<div class="border border-2 mx-2 px-3">
				<span class="fs-3" id="valorTotal"></span>
			</div>						
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