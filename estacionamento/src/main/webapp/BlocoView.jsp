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
			
			.table-common {
                width: 20%;
            }
			
			.btn-bloco-view {
				width: 20%
			}
			
			.btn-operacoes {
		        width: 45%;
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
						<th class="align-middle table-common text-primary">Operações</th>
					</tr>
				</thead>
				<tbody id="tabela-blocos"></tbody>
			</table>
			
			<div class="container text-center" id="buttons">
		        <button type="button" class="btn btn-primary p-3 m-1 btn-bloco-view" id="btn-cadastrar">Cadastrar</button>
		        <button type="button" class="btn btn-primary p-3 m-1 btn-bloco-view" id="btn-voltar">Voltar</button>
	        </div>			
		</div>
		
		<div class="modal" id="modal-cadastrar-bloco" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Cadastrar Bloco</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="form-cadastrar-bloco" class="border border-2 p-4 my-3">
                            <div class="my-3">
                                <label for="form-cadastrar-bloco-descricao" class="form-label" id="lbl-cadastrar-bloco-descricao">Descrição:</label>
                                <input type="text" class="form-control" id="form-cadastrar-bloco-descricao" name="form-cadastrar-bloco-descricao">
                            </div>

                            <div class="my-3">
                                <label for="form-cadastrar-bloco-operador" class="form-label" id="lbl-cadastrar-bloco-operador">Operador:</label>
                                <select class="form-select" id="form-cadastrar-bloco-operador" name="form-cadastrar-bloco-operador"></select>
                            </div>

                            <div class="mb-3">
                                <label for="form-cadastrar-bloco-vagas-carros" class="form-label" id="lbl-cadastrar-bloco-vagas-carros">Vagas Carro:</label>
                                <input type="number" class="form-control" id="form-cadastrar-bloco-vagas-carros" name="form-cadastrar-bloco-vagas-carros">
                            </div>
                            
                            <div class="mb-3">
                                <label for="form-cadastrar-bloco-vagas-motos" class="form-label" id="lbl-cadastrar-bloco-vagas-motos">Vagas Moto:</label>
                                <input type="number" class="form-control" id="form-cadastrar-bloco-vagas-motos" name="form-cadastrar-bloco-vagas-motos">
                            </div>
                            
                            <div class="mb-3">
                                <label for="form-cadastrar-bloco-vagas-deficientes" class="form-label" id="lbl-cadastrar-bloco-vagas-deficientes">Vagas Deficiente:</label>
                                <input type="number" class="form-control" id="form-cadastrar-bloco-vagas-deficientes" name="form-cadastrar-bloco-vagas-deficientes">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer justify-content-center">
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                        <button type="submit" form="form-cadastrar-bloco" class="btn btn-primary">Cadastrar</button>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="modal" id="modal-editar-bloco" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Editar Bloco</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="form-editar-bloco" class="border border-2 p-4 my-3">
                        	<div class="my-3">
                                <label for="form-editar-bloco-id" class="form-label" id="lbl-editar-bloco-id">ID:</label>
                                <input type="text" class="form-control" id="form-editar-bloco-id" name="form-editar-bloco-id" disabled>
                            </div>
                            
                            <div class="my-3">
                                <label for="form-editar-bloco-descricao" class="form-label" id="lbl-editar-bloco-descricao">Descrição:</label>
                                <input type="text" class="form-control" id="form-editar-bloco-descricao" name="form-editar-bloco-descricao">
                            </div>

                            <div class="my-3">
                                <label for="form-cadastrar-bloco-operador" class="form-label" id="lbl-cadastrar-bloco-operador">Operador:</label>
                                <select class="form-select" id="form-editar-bloco-operador" name="form-editar-bloco-operador"></select>
                            </div>

                            <div class="mb-3">
                                <label for="form-editar-bloco-vagas-carros" class="form-label" id="lbl-editar-bloco-vagas-carros">Vagas Carro:</label>
                                <input type="number" class="form-control" id="form-editar-bloco-vagas-carros" name="form-editar-bloco-vagas-carros">
                            </div>
                            
                            <div class="mb-3">
                                <label for="form-editar-bloco-vagas-motos" class="form-label" id="lbl-editar-bloco-vagas-motos">Vagas Moto:</label>
                                <input type="number" class="form-control" id="form-editar-bloco-vagas-motos" name="form-editar-bloco-vagas-motos">
                            </div>
                            
                            <div class="mb-3">
                                <label for="form-editar-bloco-vagas-deficientes" class="form-label" id="lbl-editar-bloco-vagas-deficientes">Vagas Deficiente:</label>
                                <input type="number" class="form-control" id="form-editar-bloco-vagas-deficientes" name="form-editar-bloco-vagas-deficientes">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer justify-content-center">
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                        <button type="submit" form="form-editar-bloco" class="btn btn-primary">Salvar</button>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="modal" id="modal-deletar-bloco" tabindex="-1">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h5 class="modal-title" id="confirmar-modal-label">Confirmar exclusão</h5>
		                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fechar"></button>
		            </div>
		            <div class="modal-body">
		                <p>Deseja realmente deletar este operador?</p>
		            </div>
		            <div class="modal-footer justify-content-center">
		                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Não</button>
		                <button type="button" class="btn btn-danger" id="btn-confirmar-exclusao">Sim</button>
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
				
				var tabelaBlocos = $("#tabela-blocos");
				var modalCadastrarBloco = $("#modal-cadastrar-bloco");
				var modalEditarBloco = $("#modal-editar-bloco");
				var modalDeletarBloco = $("#modal-deletar-bloco");
				var formCadastrarBloco = $("#form-cadastrar-bloco");
				var formEditarBloco = $("#form-editar-bloco");
				
				atualizarTabelaBlocos();
				
				$("#btn-cadastrar").click(abrirModalCadastrarBloco);
				
				function atualizarTabelaBlocos() {
					tabelaBlocos.empty();
					
					$.ajax({
						url: "bloco",
                        type: "GET",
                        dataType: "json",
                        success: function(response) {
                            $.each(response, function(index, bloco) {
								var row = $("<tr></tr>");
								
								var idCell = $("<td></td>").text(bloco.id);
								var descricaoCell = $("<td></td>").text(bloco.descricao);
								var operadorCell = $("<td></td>").text(bloco.operador);
								var vagasCarrosCell = $("<td></td>").text(bloco.vagasCarros);
								var vagasMotosCell = $("<td></td>").text(bloco.vagasMotos);
								var vagasDeficientesCell = $("<td></td>").text(bloco.vagasDeficientes);
								
								var editarButton = $("<button></button>")
                                	.addClass("btn btn-primary btn-operacoes")
                                	.text("Editar")
                                	.attr("data-bloco-id", bloco.id)
                                	.attr("data-bs-toggle", "modal")
									.attr("data-bs-target", "#modal-editar-bloco")
                                	.click(function () {
                                    	abrirModalEditarBloco(bloco);
                               		});

                            	var deletarButton = $("<button></button>")
                                	.addClass("btn btn-danger btn-operacoes")
                                	.attr("data-bs-toggle", "modal")
									.attr("data-bs-target", "#modal-deletar-bloco")
                                	.text("Deletar")
                                	.attr("data-bloco-id", bloco.id)
                                	.one("click", function() {
                                    	abrirModalDeletarBloco(bloco.id);
                                	});

                            	var operacoesCell = $("<td></td>")
                                	.append(editarButton)
                                	.append(" ")
                                	.append(deletarButton);
								
								row.append(idCell);
								row.append(descricaoCell);
								row.append(operadorCell);
								row.append(vagasCarrosCell);
								row.append(vagasMotosCell);
								row.append(vagasDeficientesCell);
								row.append(operacoesCell);
								
								tabelaBlocos.append(row);
							});
						},
						error: function(xhr, status, error) {
	                        console.log("Erro ao obter a lista de operadores!");
	                        console.log(xhr.responseText);
	                    }
					});
				}
				
				function abrirModalCadastrarBloco() {
					modalCadastrarBloco.modal("show");
                	
                	//resgata lista de operadores
                    $.ajax({
    					url: "operador",//servlet BlocoServlet
    					type: "GET",
    					dataType: "json",
    					success: function(response) {
    						//preencher o campo "bloco" com as opções da lista de blocos
    						var operadorSelect = $("#form-cadastrar-bloco-operador");
    						operadorSelect.empty();
    						$.each(response, function(index, operadorOption) {
    							operadorSelect.append($("<option></option>").text(operadorOption.nome).val(operadorOption.id));
    						});
    						atualizarTabelaBlocos();
    					},
    					error: function(xhr, status, error) {
    						console.log("Erro ao obter a lista de operadores!");
    						console.log(xhr.responseText);
    					}
    				});
                }
				
				formCadastrarBloco.submit(function(event) {
					//previne o recarregamento da página
					event.preventDefault();
		
					//obtém os valores dos campos do formulário
					var descricao = $("#form-cadastrar-bloco-descricao").val();
					var operador = $("#form-cadastrar-bloco-operador option:selected").text();
					var vagasCarros = $("#form-cadastrar-bloco-vagas-carros").val();
					var vagasMotos = $("#form-cadastrar-bloco-vagas-motos").val();
					var vagasDeficientes = $("#form-cadastrar-bloco-vagas-deficientes").val();
		
					//cria um JSON para o bloco
					var bloco = {
						descricao: descricao,
						operador: operador,
						vagasCarros: vagasCarros,
						vagasMotos: vagasMotos,
						vagasDeficientes: vagasDeficientes
					};
					
					//converte o JSON para uma string
					var blocoJSON = JSON.stringify(bloco);
		
					//configura a requisição AJAX
					$.ajax({
						url: "bloco",//servlet BlocoServlet
						type: "POST",
						contentType: "application/json",
						data: blocoJSON,
						success: function(response) {
							alert("Bloco cadastrado com sucesso!");
							atualizarTabelaBlocos();
							console.log(response);
						},
						error: function(xhr, status, error) {
							console.log("Erro ao criar bloco!");
							console.log(xhr.responseText);
						}
					});
					
					modalCadastrarBloco.modal("hide");					
				});
				
				function abrirModalEditarBloco(bloco) {
          			modalEditarBloco.modal("show");               	
                	
          			modalEditarBloco.find("#form-editar-bloco-id").val(bloco.id);
          			modalEditarBloco.find("#form-editar-bloco-descricao").val(bloco.descricao);
          		  	modalEditarBloco.find("#form-editar-bloco-operador").empty().append("<option>" + bloco.operador + "</option>");
          		  	modalEditarBloco.find("#form-editar-bloco-vagas-carros").val(bloco.vagasCarros);
        			modalEditarBloco.find("#form-editar-bloco-vagas-motos").val(bloco.vagasMotos);
        		  	modalEditarBloco.find("#form-editar-bloco-vagas-deficientes").val(bloco.vagasDeficientes);
	          		
        		  	//resgata lista de operadores
                    $.ajax({
    					url: "operador",//servlet BlocoServlet
    					type: "GET",
    					dataType: "json",
    					success: function(response) {
    						//preencher o campo "bloco" com as opções da lista de blocos
    						var operadorSelect = $("#form-editar-bloco-operador");
    						operadorSelect.empty();
    						$.each(response, function(index, operadorOption) {
    							operadorSelect.append($("<option></option>").text(operadorOption.nome).val(operadorOption.id));
    						});
    						atualizarTabelaBlocos();
    					},
    					error: function(xhr, status, error) {
    						console.log("Erro ao obter a lista de operadores!");
    						console.log(xhr.responseText);
    					}
    				});
                }
				
				formEditarBloco.submit(function(event) {
					//previne o recarregamento da página
					event.preventDefault();
		
					//obtém os valores dos campos do formulário
					var id = $("#form-editar-bloco-id").val();
					var descricao = $("#form-editar-bloco-descricao").val();
					var operador = $("#form-editar-bloco-operador option:selected").text();
					var vagasCarros = $("#form-editar-bloco-vagas-carros").val();
					var vagasMotos = $("#form-editar-bloco-vagas-motos").val();
					var vagasDeficientes = $("#form-editar-bloco-vagas-deficientes").val();
		
					//cria um JSON para o bloco
					var bloco = {
						id: id,
						descricao: descricao,
						operador: operador,
						vagasCarros: vagasCarros,
						vagasMotos: vagasMotos,
						vagasDeficientes: vagasDeficientes
					};

					//converte o JSON para uma string
					var blocoJSON = JSON.stringify(bloco);
		
					//configura a requisição AJAX
					$.ajax({
						url: "blocoupdate",//servlet BlocoServlet
						type: "POST",
						contentType: "application/json",
						data: blocoJSON,
						success: function(response) {
							alert("Bloco editado com sucesso!");
							atualizarTabelaBlocos();
							console.log(response);
						},
						error: function(xhr, status, error) {
							console.log("Erro ao editar bloco!");
							console.log(xhr.responseText);
						}
					});
					
					modalEditarBloco.modal("hide");					
				});
				
				function abrirModalDeletarBloco(id) {
                    var blocoId = $(this).data("bloco-id");
                    modalDeletarBloco.modal("show");
                    
                  //confirmaar a exclusão do bloco
                    $("#btn-confirmar-exclusao").one("click", function() {
                        
                    	$.ajax({
                            url: "bloco?id=" + id,
                            type: "DELETE",
                            success: function(response) {
                                alert("Bloco excluído com sucesso!");
                                atualizarTabelaBlocos();
                            },
                            error: function(xhr, status, error) {
                                console.log("Erro ao excluir o bloco!");
                                console.log(xhr.responseText);
                            }
                        });
                    	
                    	modalDeletarBloco.modal("hide");                        
                    });                    
                }
			});
		</script>
	</body>
</html>