<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<style type="text/css">
	.table-counter {
		width: 8%;
	}
	
	.table-datetime {
		width: 20%;
	}
	
	.table-common {
		width: 10%;
	}
	
	.table-operations {
		width: 16%;
	}
	
	.btn-vaga-view {
		width: 20%;
	}
	
	.btn-alterar-estado {
		width: 28%
	}
</style>
</head>
	<body>
		<div class="container mt-5">
			<div class="container-fluid p-5 bg-primary text-white text-center">
				<h1 id="lbl-gerenciamento-de-vagas">Gerenciamento de Vagas</h1>
			</div>
			
			<div class="d-flex m-3 justify-content-evenly align-items-center">
				<div class="d-flex">
					<label class="fs-2" id="lbl-vagas-livres">Vagas Livres:</label>
					<div class="border border-2 mx-2 px-3">
						<span class="fs-3" id="span-vagas-livres"></span>
					</div>
				</div>
		
				<div class="d-flex">
					<label class="fs-2" id="lbl-vagas-ocupadas">Vagas Ocupadas:</label>
					<div class="border border-2 mx-2 px-3">
						<span class="fs-3" id="span-vagas-ocupadas"></span>
					</div>
				</div>
			</div>
			
			<table class="table table-hover table-dark table-bordered my-3 text-center align-middle" id="tblVagas">
				<thead>
					<tr>
						<th class="align-middle table-counter">ID</th>
						<th class="align-middle table-common">Categoria</th>
						<th class="align-middle table-common">Bloco</th>
						<th class="align-middle table-common">Estado</th>
						<th class="align-middle table-datetime">Início da Ocupação</th>
						<th class="align-middle table-operations">Operações</th>
					</tr>
				</thead>
				<tbody id="tbl-body-vagas"></tbody>
			</table>
	
			<div class="container text-center" id="buttons">
				<button type="button" class="btn btn-primary p-3 m-1 btn-vaga-view" id="btn-relatorio">Relatório</button>
				<button type="button" class="btn btn-primary p-3 m-1 btn-vaga-view" id="btn-voltar">Voltar</button>
			</div>
		</div>
		
		<div class="modal" id="modal-alterar-estado" tabindex="-1">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h5 class="modal-title" id="confirmar-modal-label">Confirmar alteração</h5>
		                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fechar"></button>
		            </div>
		            <div class="modal-body">
		                <p class="fs-3 text-center">Alterar estado?</p>
		            </div>
		            <div class="modal-footer justify-content-center">
		                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Não</button>
		                <button type="button" class="btn btn-primary" id="btn-confirmar-alteracao">Sim</button>
		            </div>
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
		<script type="text/javascript">
			$(document).ready(function() {
				
				var tabelaVagas = $("#tbl-body-vagas");
				var modalAlterarEstado = $("#modal-alterar-estado");
				var idVagaSelecionada;
				
				atualizarTabelaVagas();
				
				function atualizarTabelaVagas() {
					//variáveis de contagem de vagas LIVRES e OCUPADAS
					var contagemVagasLivres = 0;
					var contagemVagasOcupadas = 0;
					
					//exibição da contagem de vagas
					var vagasLivres = $("#span-vagas-livres").text(contagemVagasLivres);
					var vagasOcupadas = $("#span-vagas-ocupadas").text(contagemVagasOcupadas);
					
					tabelaVagas.empty();
					
					$.ajax({
						url: "vaga",
						type: "GET",
						dataType: "json",
						success: function(response) {
							$.each(response, function(index, vaga) {
								var row = $("<tr></tr>");									
									
								if(vaga.estado == "LIVRE") {
									row = $("<tr></tr>").addClass("table-success");
									contagemVagasLivres++;
									vagasLivres.text(contagemVagasLivres);
								} else {
									row = $("<tr></tr>").addClass("table-danger");
									contagemVagasOcupadas++;
									vagasOcupadas.text(contagemVagasOcupadas);
								}
								
								var idCell = $("<td></td>").text(vaga.id);
								var categoriaCell = $("<td></td>").text(vaga.categoria);
								var blocoCell = $("<td></td>").text(vaga.bloco);
								var estadoCell = $("<td></td>").text(vaga.estado);
								var timestampCell = $("<td></td>").text(vaga.timestamp);
								
								var btAlterarEstado = $("<button></button>")
									.addClass("btn btn-primary btn-operacoes")
									.text("Aterar Estado")
									.attr("data-bs-toggle", "modal")
									.attr("data-bs-target", "#modal-alterar-estado")
									.on("click", function() {
										idVagaSelecionada = vaga.id;
										abrirModalAlterarEstado();
									});									
								
								var btCalcularPreco = $("<button></button>")
									.addClass("btn btn-warning")
									.text("Calcular Preço")
									.attr("data-bs-toggle", "modal")
									.attr("data-bs-target", "#modal-calcular-preco")
									.on("click", function() {
										idVagaSelecionada = vaga.id;
										abrirModalCalcularPreco();
									});									
								
								var operacoesCell = $("<td></td>")
									.append(btAlterarEstado)
									.append(" ")
									.append(btCalcularPreco);
								
								row.append(idCell);
								row.append(categoriaCell);
								row.append(blocoCell);
								row.append(estadoCell);
								row.append(timestampCell);
								row.append(operacoesCell);
								
								tabelaVagas.append(row);
							});
						}
					});					
				}
				
				function abrirModalAlterarEstado() {
					modalAlterarEstado.modal("show");
					
					//corfirma a alteração do estado da vaga "LIVRE" para "OCUPADO" e vice versa
					$("#btn-confirmar-alteracao").one("click", function() {
						$.ajax({
							url: "vaga_update",
							type: "POST",
							data: {id: idVagaSelecionada},
							success: function(response) {
                                alert("Estado da vaga alterado com sucesso!");
                                atualizarTabelaVagas();
                            },
                            error: function(xhr, status, error) {
                                console.log("Erro ao alterar o estado da vaga!");
                                console.log(xhr.responseText);
                            }
						});
						modalAlterarEstado.modal("hide");
					});					
				}
			});
		</script>
		
	</body>
</html>