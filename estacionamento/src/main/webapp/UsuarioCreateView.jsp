<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de Usuários</title>

</head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<script>
	$(document).ready(function() {

		$.ajax({
			url: "BlocoListServlet",
			type: "GET",
			dataType: "json",
			success: function(response) {
				//preencher o campo "bloco" com as opções da lista de blocos
				var blocoSelect = $("#formBloco");
				$.each(response, function(index, bloco) {
					blocoSelect.append($("<option></option>").text(bloco.descricao).val(bloco.id));
				});
			},
			error: function(xhr, status, error) {
				console.log("Erro ao obter a lista de blocos!");
				console.log(xhr.responseText);
			}
		});

		$("#formCriarUsuario").submit(function(event) {
			//previnir o recarregamento da página
			event.preventDefault();

			//obter os valores dos campos do formulário
			var nome = $("#formNome").val();
			var senha = $("#formSenha").val();
			var bloco = $("#formBloco").val();

			//criar um JSON
			var usuario = {
				nome: nome,
				senha: senha,
				bloco: bloco
			};

			//converter o JSON para uma string
			var usuarioJSON = JSON.stringify(usuario);

			//configurar a requisição AJAX
			$.ajax({
				url: "UsuarioCreateServlet",
				type: "POST",
				contentType: "application/json",
				data: usuarioJSON,
				success: function(response) {
					alert("Usuário cadastrado com sucesso!");
					console.log(response);
				},
				error: function(xhr, status, error) {
					console.log("Erro ao criar usuário!");
					console.log(xhr.responseText);
				}
			});
		});
	});
</script>

<style type="text/css">
.bt-usuario-create {
	width: 50%;
}
</style>
</head>

<script type="text/javascript">
	
</script>

<body>

	<div class="container mt-5">
		<div class="container-fluid p-5 bg-primary text-white text-center">
			<h1 class="txt-center" id=lblCadastroDeOperadores>Cadastro	de Usuários</h1>
		</div>

		<form id="formCriarUsuario" class="border border-2 p-4 my-3">
			<div class="my-3">
				<label class="form-label" id="lblDescricao">nome:</label> <input
					type="text" class="form-control" id="formNome" name="formNome">
			</div>

			<div class="my-3">
				<label class="form-label" id="lblSenha">senha:</label> <input
					type="password" class="form-control" id="formSenha" name="formSenha">
			</div>

			<div class="mb-3">
				<label class="form-label" id="lblBloco">Bloco:</label> <select
					class="form-select" id="formBloco" name="formBloco">
				</select>
			</div>
			<div class="container mt-3 d-flex justify-content-center">
				<button type="submit"
					class="btn btn-success p-3 m-3 bt-usuario-create"
					id="btnCadastrar">Cadastrar</button>
				<button type="button"
					class="btn btn-danger p-3 m-3 bt-usuario-create" id="btnCancelar">Cancelar</button>
			</div>
		</form>
	</div>

	<div class="container mt-5">
		<div class="mt-5 p-4 bg-dark text-white text-center">
			<p>Instituto Federal de Educação Ciência e Tecnologia de São
				Paulo - Câmpus Guarulhos</p>
			<p>Desenvolvido por: Jhennerson Barbosa da Silva</p>
			<p>Professor: Cleber Oliveira - Disciplina: Projeto Web</p>
		</div>
	</div>

</body>
</html>