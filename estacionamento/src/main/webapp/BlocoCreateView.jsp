<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

	<style type="text/css">
		.bt-bloco-create {
			width: 50%;
		}
	</style>
</head>

<script type="text/javascript">
	
</script>

<body>

	<div class="container mt-5">
		<div class="container-fluid p-5 bg-primary text-white text-center">
			<h1 class="txt-center" id="lblCadastroDeBlocos">Cadastro de Blocos</h1>
		</div>

		<form id="formCriarBloco"class="border border-2 p-4 mt-3 mb-5">
			<div class="mb-3 mt-3">
				<label class="form-label" id="lblDescricao">Descrição:</label> <input
					type="text" class="form-control" id="formDescricao"
					name="formDescricao">
			</div>

			<div class="mb-3">
				<label class="form-label" id="lblOperador">Operador:</label> <select
					class="form-select" id="formOperador" name="formOperador">
				</select>
			</div>

			<div class="mb-3">
				<label class="form-label" id="lblVagasCarros">Vagas para carros:</label>
				<input type="number" class="form-control" id="formVagasCarros" name="formVagasCarros">
			</div>

			<div class="mb-3">
				<label class="form-label" id="lblVagasMotos">Vagas para motos:</label>
				<input type="number" class="form-control" id="formVagasMotos" name="formVagasMotos">
			</div>

			<div class="mb-3">
				<label class="form-label" id="lblVagasDeficientes">Vagas para deficientes:</label>
				<input type="number" class="form-control" id="formVagasDeficientes" name="formVagasDeficientes">
			</div>
			<div class="container mt-3 d-flex justify-content-center">
				<button type="submit" class="btn btn-success p-3 m-3 bt-bloco-create" id="btnCadastrar">Cadastrar</button>
				<button type="button" class="btn btn-danger p-3 m-3 bt-bloco-create" id="btnCancelar">Cancelar</button>
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
	
	<script type="text/javascript">	
		$(document).ready(function() {
			
			$.ajax({
				url: "operador",//servlet OperadorServlet
				type: "GET",
				dataType: "json",
				success: function(response) {
					//preencher o campo "operador" com as opções da lista de blocos
					var operadorSelect = $("#formOperador");
					$.each(response, function(index, operadorOption) {
						operadorSelect.append($("<option></option>").text(operadorOption.nome).val(operadorOption.id));
					});
				},
				error: function(xhr, status, error) {
					console.log("Erro ao obter a lista de blocos!");
					console.log(xhr.responseText);
				}
			});				
			
			$("#formCriarBloco").submit(function(event) {
				//previnir o recarregamento da página
				event.preventDefault();

				//obter os valores dos campos do formulário
				var descricao = $("#formDescricao").val();
				var operador = $("#formOperador option:selected").text();
				var vagasCarros = $("#formVagasCarros").val();
				var vagasMotos = $("#formVagasMotos").val();
				var vagasDeficientes = $("#formVagasDeficientes").val();
				
				//criar um JSON
				var bloco = {
					descricao: descricao,
					operador: operador,
					vagasCarros: vagasCarros,
					vagasMotos: vagasMotos,
					vagasDeficientes: vagasDeficientes
				};

				//converter o JSON para uma string
				var blocoJSON = JSON.stringify(bloco);
				$("div").text(blocoJSON);
								
				//configurar a requisição AJAX
				$.ajax({
					type: "POST",
					contentType: "application/json",
					url: "bloco",//servlet BlocoServlet
					data: blocoJSON,
					success: function(response) {
						alert("Bloco cadastrado com sucesso!");
						console.log(response);
					},
					error: function(xhr, status, error) {
						console.log("Erro ao criar bloco!");
						console.log(xhr.responseText);
					}
				});
			});
		});
	</script>
</body>
</html>