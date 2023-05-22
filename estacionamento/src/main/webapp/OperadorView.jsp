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
                <h1 id="lblGerenciamentoDeUsuarios">Gerenciamento de Operadores</h1>
            </div>

            <table class="table table-striped table-bordered my-3 text-center align-middle" id="tblUsuarios">
                <thead>
                    <tr>
                        <th class="align-middle table-counter text-primary">ID</th>
                        <th class="align-middle table-common text-primary">Nome</th>
                        <th class="align-middle table-common text-primary">Senha</th>
                        <th class="align-middle table-common text-primary">Bloco</th>
                        <th class="align-middle table-common text-primary">Operações</th>
                    </tr>
                </thead>
                <tbody id="tabelaOperadores"></tbody>
            </table>

            <div class="container text-center">
                <button type="button" class="btn btn-primary p-3 m-1 btn-operador-view" id="btnCadastrar">Cadastrar</button>
                <button type="button" class="btn btn-primary p-3 m-1 btn-operador-view" id="btnVoltar">Voltar</button>
            </div>
        </div>

        <div class="container mt-5">
            <div class="mt-5 p-4 bg-dark text-white text-center">
                <p>Instituto Federal de Educação Ciência e Tecnologia de São Paulo - Câmpus Guarulhos</p>
                <p>Desenvolvido por: Jhennerson Barbosa da Silva</p>
                <p>Professor: Cleber Oliveira - Disciplina: Projeto Web</p>
            </div>
        </div>
        
        <div class="modal" id="modalCadastrarOperador" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Cadastrar Operador</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="formCadastrarOperador" class="border border-2 p-4 my-3">
                            <div class="my-3">
                                <label for="formCadastrarNome" class="form-label" id="lblCadastrarDescricao">nome:</label>
                                <input type="text" class="form-control" id="formCadastrarNome" name="formCadastrarNome">
                            </div>

                            <div class="my-3">
                                <label for="formCadastrarSenha" class="form-label" id="lblCadastrarSenha">senha:</label>
                                <input type="password" class="form-control" id="formCadastrarSenha" name="formCadastrarSenha">
                            </div>

                            <div class="mb-3">
                                <label for="formCadastrarBloco" class="form-label" id="lblCadastrarBloco">Bloco:</label>
                                <select class="form-select" id="formCadastrarBloco" name="formCadastrarBloco"></select>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                        <button type="submit" form="formCadastrarOperador" class="btn btn-primary">Cadastrar</button>
                    </div>
                </div>
            </div>
        </div>     
        
        <div class="modal" id="modalEditarOperador" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Editar Operador</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="formEditarOperador" class="border border-2 p-4 my-3">
                        	<div class="my-3">
                                <label for="formEditarId" class="form-label" id="lblEditarId">ID:</label>
                                <input type="text" class="form-control" id="formEditarId" name="formEditarId" disabled>
                            </div>
                            
                            <div class="my-3">
                                <label for="formEditarNome" class="form-label" id="lblEditarNome">nome:</label>
                                <input type="text" class="form-control" id="formEditarNome" name="formEditarNome">
                            </div>

                            <div class="my-3">
                                <label for="formEditarSenha" class="form-label" id="lblEditarSenha">senha:</label>
                                <input type="password" class="form-control" id="formEditarSenha" name="formEditarSenha">
                            </div>

                            <div class="mb-3">
                                <label for="formEditarBloco" class="form-label" id="lblEditarBloco">Bloco:</label>
                                <select class="form-select" id="formEditarBloco" name="formEditarBloco"></select>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                        <button type="submit" form="formEditarOperador" class="btn btn-primary">Salvar Alterações</button>
                    </div>
                </div>
            </div>
        </div>
       
        <script type="text/javascript">
            $(document).ready(function () {
            	
            	var modalCadastrarOperador = $("#modalCadastrarOperador");
            	var modalEditarOperador = $("#modalEditarOperador");
            	var formCadastrarOperador = $("#formCadastrarOperador");
            	var formEditarOperador = $("#formEditarOperador");
            	
            	$("#btnCadastrar").click(abrirModalCadastrarOperador);
            	
                $.ajax({
                    url: "operador",
                    type: "GET",
                    dataType: "json",
                    success: function (response) {
                        var tabelaOperadores = $("#tabelaOperadores");

                        $.each(response, function (index, operador) {
                            var row = $("<tr></tr>");

                            var idCell = $("<td></td>").text(operador.id);
                            var nomeCell = $("<td></td>").text(operador.nome);
                            var senhaCell = $("<td></td>").text(operador.senha);
                            var blocoCell = $("<td></td>").text(operador.bloco);

                            var editarButton = $("<button></button>")
                                .addClass("btn btn-primary btn-operacoes")
                                .text("Editar")
                                .attr("data-operador-id", operador.id)
                                .click(function () {
                                    abrirModalEditarOperador(operador);
                                });

                            var deletarButton = $("<button></button>")
                                .addClass("btn btn-danger btn-operacoes")
                                .text("Deletar")
                                .attr("data-operador-id", operador.id)
                                .click(function () {
                                    abrirModalDeletarOperador(operador.id);
                                });

                            var operacoesCell = $("<td></td>")
                                .append(editarButton)
                                .append(" ")
                                .append(deletarButton);

                            row.append(idCell);
                            row.append(nomeCell);
                            row.append(senhaCell);
                            row.append(blocoCell);
                            row.append(operacoesCell);

                            tabelaOperadores.append(row);
                        });
                    },
                    error: function (xhr, status, error) {
                        console.log("Erro ao obter a lista de operadores!");
                        console.log(xhr.responseText);
                    }
                });

                function abrirModalEditarOperador(operador) {
                	//abre o modal de edição de operador
          			modalEditarOperador.modal("show");                	
                	modalEditarOperador.find("#formEditarId").val(operador.id);
          			modalEditarOperador.find("#formEditarNome").val(operador.nome);
          		  	modalEditarOperador.find("#formEditarSenha").val(operador.senha);
          		  	modalEditarOperador.find("#formEditarBloco").empty().append("<option>" + operador.bloco + "</option>");
	          		
          		  	//resgata lista de blocos
                    $.ajax({
    					url: "bloco",//servlet BlocoServlet
    					type: "GET",
    					dataType: "json",
    					success: function(response) {
    						//preencher o campo "bloco" com as opções da lista de blocos
    						var blocoSelect = $("#formEditarBloco");
    						$.each(response, function(index, blocoOption) {
    							blocoSelect.append($("<option></option>").text(blocoOption.descricao).val(blocoOption.id));
    						});
    					},
    					error: function(xhr, status, error) {
    						console.log("Erro ao obter a lista de blocos!");
    						console.log(xhr.responseText);
    					}
    				});
                }
                
                function abrirModalCadastrarOperador() {
                	//abre o modal de cadastro de operador
                	modalCadastrarOperador.modal("show");
                	
                	//resgata lista de blocos
                    $.ajax({
    					url: "bloco",//servlet BlocoServlet
    					type: "GET",
    					dataType: "json",
    					success: function(response) {
    						//preencher o campo "bloco" com as opções da lista de blocos
    						var blocoSelect = $("#formCadastrarBloco");
    						blocoSelect.empty();
    						$.each(response, function(index, blocoOption) {
    							blocoSelect.append($("<option></option>").text(blocoOption.descricao).val(blocoOption.id));
    						});
    					},
    					error: function(xhr, status, error) {
    						console.log("Erro ao obter a lista de blocos!");
    						console.log(xhr.responseText);
    					}
    				});
                }
                
                formCadastrarOperador.submit(function(event) {
					//previnir o recarregamento da página
					event.preventDefault();
		
					//obter os valores dos campos do formulário
					var nome = $("#formCadastrarNome").val();
					var senha = $("#formCadastrarSenha").val();
					var bloco = $("#formCadastrarBloco option:selected").text();
		
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
						url: "operador",//servlet UsuarioServlet
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
					
					modalCadastrarOperador.modal("hide");					
				});
                
                formEditarOperador.submit(function(event) {
					//previnir o recarregamento da página
					event.preventDefault();
		
					//obter os valores dos campos do formulário
					var id = $("#formEditarId").val();
					var nome = $("#formEditarNome").val();
					var senha = $("#formEditarSenha").val();
					var bloco = $("#formEditarBloco option:selected").text();
		
					//criar um JSON
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
						url: "operadorupdate",//servlet OperadorUpdateServlet
						type: "POST",
						contentType: "application/json",
						data: operadorEditJSON,
						success: function(response) {
							alert("Usuário editado com sucesso!");
							console.log(response);
						},
						error: function(xhr, status, error) {
							console.log("Erro ao editar usuário!");
							console.log(xhr.responseText);
						}
					});
					
					modalEditarOperador.modal("hide");
				});
            });
        </script>

    </body>

    </html>