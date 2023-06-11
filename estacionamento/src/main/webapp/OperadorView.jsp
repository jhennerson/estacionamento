<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        
        <style type="text/css">
            .table-counter {
                width: 8%;
            }

            .table-common {
                width: 20%;
            }
			
			.btn-operador-view {
				width: 40%;
			}
			
            .btn-operacoes {
            	width: 45%;
            }
        </style>
    </head>

    <body>
        <div class="container mt-5">
            <div class="container-fluid p-5 bg-primary text-white text-center">
                <h1 id="lbl-gerenciamento-de-operadores">Gerenciamento de Operadores</h1>
            </div>

            <table class="table table-striped table-bordered my-3 text-center align-middle" id="tbl-operadores">
                <thead>
                    <tr>
                        <th class="align-middle table-counter text-primary">ID</th>
                        <th class="align-middle table-common text-primary">Nome</th>
                        <th class="align-middle table-common text-primary">Senha</th>
                        <th class="align-middle table-common text-primary">Bloco</th>
                        <th class="align-middle table-common text-primary">Operações</th>
                    </tr>
                </thead>
                <tbody id="tbl-body-operadores"></tbody>
            </table>

            <div class="container text-center">
                <button type="button" class="btn btn-primary p-3 m-1 btn-operador-view" id="btn-cadastrar">Cadastrar</button>
                <button type="button" class="btn btn-primary p-3 m-1 btn-operador-view" id="btn-voltar">Voltar</button>
            </div>
        </div>        
        
        <div class="modal" id="modal-cadastrar-operador" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Cadastrar Operador</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="form-cadastrar-operador" class="border border-2 p-4 my-3">
                            <div class="my-3">
                                <label for="form-cadastrar-operador-nome" class="form-label" id="lbl-cadastrar-operador-nome">nome:</label>
                                <input type="text" class="form-control" id="form-cadastrar-operador-nome" name="form-cadastrar-operador-nome">
                            </div>

                            <div class="my-3">
                                <label for="form-cadastrar-operador-senha" class="form-label" id="lbl-cadastrar-operador-senha">senha:</label>
                                <input type="password" class="form-control" id="form-cadastrar-operador-senha" name="form-cadastrar-operador-senha">
                            </div>

                            <div class="mb-3">
                                <label for="form-cadastrar-operador-bloco" class="form-label" id="lbl-cadastrar-operador-bloco">Bloco:</label>
                                <select class="form-select" id="form-cadastrar-operador-bloco" name="form-cadastrar-operador-bloco"></select>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer justify-content-center">
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                        <button type="submit" form="form-cadastrar-operador" class="btn btn-primary">Cadastrar</button>
                    </div>
                </div>
            </div>
        </div>     
        
        <div class="modal" id="modal-editar-operador" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Editar Operador</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fechar"></button>
                    </div>
                    <div class="modal-body">
                        <form id="form-editar-operador-operador" class="border border-2 p-4 my-3">
                        	<div class="my-3">
                                <label for="form-editar-operador-id" class="form-label" id="lbl-editar-id">ID:</label>
                                <input type="text" class="form-control" id="form-editar-operador-id" name="form-editar-operador-id" disabled>
                            </div>
                            
                            <div class="my-3">
                                <label for="form-editar-operador-nome" class="form-label" id="lbl-editar-nome">nome:</label>
                                <input type="text" class="form-control" id="form-editar-operador-nome" name="form-editar-operador-nome">
                            </div>

                            <div class="my-3">
                                <label for="form-editar-operador-senha" class="form-label" id="lbl-editar-senha">senha:</label>
                                <input type="password" class="form-control" id="form-editar-operador-senha" name="form-editar-operador-senha">
                            </div>

                            <div class="mb-3">
                                <label for="form-editar-operador-bloco" class="form-label" id="lbl-editar-bloco">Bloco:</label>
                                <select class="form-select" id="form-editar-operador-bloco" name="form-editar-operador-bloco"></select>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer justify-content-center">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                        <button type="submit" form="form-editar-operador-operador" class="btn btn-primary">Salvar Alterações</button>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="modal" id="modal-deletar-operador" tabindex="-1">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h5 class="modal-title" id="confirmar-modal-label">Confirmar exclusão</h5>
		                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fechar"></button>
		            </div>
		            <div class="modal-body">
		                <p class="fs-3 text-center">Deseja realmente deletar este operador?</p>
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
            	
            	var tabelaOperadores = $("#tbl-body-operadores");
            	var modalCadastrarOperador = $("#modal-cadastrar-operador");
            	var modalEditarOperador = $("#modal-editar-operador");
            	var modalDeletarOperador = $("#modal-deletar-operador");
            	var formCadastrarOperador = $("#form-cadastrar-operador");
            	var formEditarOperador = $("#form-editar-operador-operador");
            	
            	atualizarTabelaOperadores();
            	
            	$("#btn-cadastrar").click(abrirModalCadastrarOperador);
           		
            	//preenche a tabela com os dados dos operadores e os botões de operações para cada operador
            	function atualizarTabelaOperadores() {
            		tabelaOperadores.empty();
            		
            		$.ajax({
                        url: "operador",
                        type: "GET",
                        dataType: "json",
                        success: function(response) {
                            $.each(response, function(index, operador) {
                                var row = $("<tr></tr>");

                                var idCell = $("<td></td>").text(operador.id);
                                var nomeCell = $("<td></td>").text(operador.nome);
                                var senhaCell = $("<td></td>").text(operador.senha);
                                var blocoCell = $("<td></td>").text(operador.bloco);

                                var btEditar = $("<button></button>")
                                    .addClass("btn btn-primary btn-operacoes")
                                    .text("Editar")
                                    .attr("data-operador-id", operador.id)
                                    .attr("data-bs-toggle", "modal")
									.attr("data-bs-target", "#modal-editar-operador")
                                    .click(function () {
                                        abrirModalEditarOperador(operador);
                                    });

                                var btDeletar = $("<button></button>")
                                    .addClass("btn btn-danger btn-operacoes")
                                    .text("Deletar")
                                    .attr("data-operador-id", operador.id)
                                    .attr("data-bs-toggle", "modal")
									.attr("data-bs-target", "#modal-deletar-operador")
                                    .one("click", function() {
                                        abrirModalDeletarOperador(operador.id);
                                    });

                                var operacoesCell = $("<td></td>")
                                    .append(btEditar)
                                    .append(" ")
                                    .append(btDeletar);

                                row.append(idCell);
                                row.append(nomeCell);
                                row.append(senhaCell);
                                row.append(blocoCell);
                                row.append(operacoesCell);

                                tabelaOperadores.append(row);
                            });
                        },
                        error: function(xhr, status, error) {
                            console.log("Erro ao obter a lista de operadores!");
                            console.log(xhr.responseText);
                        }
                    });
            	}
            	
            	function abrirModalCadastrarOperador() {
                	modalCadastrarOperador.modal("show");
                	
                	//resgata lista de blocos
                    $.ajax({
    					url: "bloco",//servlet BlocoServlet
    					type: "GET",
    					dataType: "json",
    					success: function(response) {
    						//preencher o campo "bloco" com as opções da lista de blocos
    						var blocoSelect = $("#form-cadastrar-operador-bloco");
    						blocoSelect.empty();
    						$.each(response, function(index, blocoOption) {
    							blocoSelect.append($("<option></option>").text(blocoOption.descricao).val(blocoOption.id));
    						});
    						atualizarTabelaOperadores();
    					},
    					error: function(xhr, status, error) {
    						console.log("Erro ao obter a lista de blocos!");
    						console.log(xhr.responseText);
    					}
    				});
                }
                
                formCadastrarOperador.submit(function(event) {
					//previne o recarregamento da página
					event.preventDefault();
		
					//obtém os valores dos campos do formulário
					var nome = $("#form-cadastrar-operador-nome").val();
					var senha = $("#form-cadastrar-operador-senha").val();
					var bloco = $("#form-cadastrar-operador-bloco option:selected").text();
		
					//cria um JSON para o operador
					var usuario = {
						nome: nome,
						senha: senha,
						bloco: bloco
					};
		
					//converte o JSON para uma string
					var usuarioJSON = JSON.stringify(usuario);
		
					//configura a requisição AJAX
					$.ajax({
						url: "operador",//servlet UsuarioServlet
						type: "POST",
						contentType: "application/json",
						data: usuarioJSON,
						success: function(response) {
							alert("Usuário cadastrado com sucesso!");
							atualizarTabelaOperadores();
							console.log(response);
						},
						error: function(xhr, status, error) {
							console.log("Erro ao criar usuário!");
							console.log(xhr.responseText);
						}
					});
					
					modalCadastrarOperador.modal("hide");					
				});

                function abrirModalEditarOperador(operador) {
          			modalEditarOperador.modal("show");                	
                	modalEditarOperador.find("#form-editar-operador-id").val(operador.id);
          			modalEditarOperador.find("#form-editar-operador-nome").val(operador.nome);
          		  	modalEditarOperador.find("#form-editar-operador-senha").val(operador.senha);
          		  	modalEditarOperador.find("#form-editar-operador-bloco").empty().append("<option>" + operador.bloco + "</option>");
	          		
          		  	//resgata lista de blocos
                    $.ajax({
    					url: "bloco",//servlet BlocoServlet
    					type: "GET",
    					dataType: "json",
    					success: function(response) {
    						//preencher o campo "bloco" com as opções da lista de blocos
    						var blocoSelect = $("#form-editar-operador-bloco");
    						$.each(response, function(index, blocoOption) {
    							blocoSelect.append($("<option></option>").text(blocoOption.descricao).val(blocoOption.id));
    						});
    						atualizarTabelaOperadores();
    					},
    					error: function(xhr, status, error) {
    						console.log("Erro ao obter a lista de blocos!");
    						console.log(xhr.responseText);
    					}
    				});
                }
                
                formEditarOperador.submit(function(event) {
					//previnir o recarregamento da página
					event.preventDefault();
		
					//obter os valores dos campos do formulário
					var id = $("#form-editar-operador-id").val();
					var nome = $("#form-editar-operador-nome").val();
					var senha = $("#form-editar-operador-senha").val();
					var bloco = $("#form-editar-operador-bloco option:selected").text();
		
					//criar um JSON de operador
					var operadorEdit = {
						id: id,
						nome: nome,
						senha: senha,
						bloco: bloco
					};
		
					//converter o JSON para uma string
					var operadorEditJSON = JSON.stringify(operadorEdit);
		
					//configurar a requisição AJAX
					$.ajax({
						url: "operador_update",//servlet OperadorUpdateServlet
						type: "POST",
						contentType: "application/json",
						data: operadorEditJSON,
						success: function(response) {
							alert("Usuário editado com sucesso!");
							atualizarTabelaOperadores();
							console.log(response);
						},
						error: function(xhr, status, error) {
							console.log("Erro ao editar usuário!");
							console.log(xhr.responseText);
						}
					});
					
					modalEditarOperador.modal("hide");
				});               
             	
                function abrirModalDeletarOperador(id) {
                    modalDeletarOperador.modal("show");
                    
                    //confirmar a exclusão do operador
                    $("#btn-confirmar-exclusao").one("click", function() {                        
                    	$.ajax({
                            url: "operador?id=" + id,
                            type: "DELETE",
                            success: function(response) {
                                alert("Operador excluído com sucesso!");
                                atualizarTabelaOperadores();
                            },
                            error: function(xhr, status, error) {
                                console.log("Erro ao excluir o operador!");
                                console.log(xhr.responseText);
                            }
                        });
                    	
                    	modalDeletarOperador.modal("hide");                    
                    });                    
                }
            });
        </script>

    </body>
</html>