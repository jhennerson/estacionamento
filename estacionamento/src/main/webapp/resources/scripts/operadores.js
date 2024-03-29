$(document).ready(function() {
            	
	var tabelaOperadores = $("#tbl-body-operadores");
	var modalCadastrarOperador = $("#modal-cadastrar-operador");
	var modalEditarOperador = $("#modal-editar-operador");
	var modalDeletarOperador = $("#modal-deletar-operador");
	var formCadastrarOperador = $("#form-cadastrar-operador");
	var formEditarOperador = $("#form-editar-operador-operador");
	var operadorSelecionado;
	
	atualizarTabelaOperadores();
	
	$("#btn-cadastrar").click(abrirModalCadastrarOperador);

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
                        .addClass("btn btn-primary btn-operacoes btn-operacoes-operadores")
                        .text("Editar")
                        .attr("data-operador-id", operador.id)
                        .attr("data-bs-toggle", "modal")
						.attr("data-bs-target", "#modal-editar-operador")
                        .on("click", function () {
                            operadorSelecionado = operador;
                            editarOperador();
                        });

                    var btDeletar = $("<button></button>")
                        .addClass("btn btn-danger btn-operacoes btn-operacoes-operadores")
                        .text("Deletar")
                        .attr("data-operador-id", operador.id)
                        .attr("data-bs-toggle", "modal")
						.attr("data-bs-target", "#modal-deletar-operador")
                        .on("click", function () {
                            operadorSelecionado = operador;
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
            error: function(xhr) {
                console.log("Erro ao obter a lista de operadores!");
                console.log(xhr.responseText);
            }
        });
	}
	
	function abrirModalCadastrarOperador() {
    	modalCadastrarOperador.modal("show");

        $.ajax({
			url: "bloco",
			type: "GET",
			dataType: "json",
			success: function(response) {
				var blocoSelect = $("#form-cadastrar-operador-bloco");
				blocoSelect.empty();
				$.each(response, function(index, blocoOption) {
					blocoSelect.append($("<option></option>").text(blocoOption.descricao).val(blocoOption.id));
				});
				atualizarTabelaOperadores();
			},
			error: function(xhr) {
				console.log("Erro ao obter a lista de blocos!");
				console.log(xhr.responseText);
			}
		});
    }
    
    formCadastrarOperador.submit(function(event) {
		event.preventDefault();

		var nome = $("#form-cadastrar-operador-nome").val();
		var senha = $("#form-cadastrar-operador-senha").val();
		var bloco = $("#form-cadastrar-operador-bloco option:selected").text();

		var usuario = {
			nome: nome,
			senha: senha,
			bloco: bloco
		};

		var usuarioJSON = JSON.stringify(usuario);

		$.ajax({
			url: "operador",
			type: "POST",
			contentType: "application/json",
			data: usuarioJSON,
			success: function(response) {
				alert("Usuário cadastrado com sucesso!");
				atualizarTabelaOperadores();
				console.log(response);
			},
			error: function(xhr) {
				console.log("Erro ao criar usuário!");
				console.log(xhr.responseText);
			}
		});
		
		modalCadastrarOperador.modal("hide");					
	});

    function editarOperador() {
		modalEditarOperador.modal("show");                	
    	modalEditarOperador.find("#form-editar-operador-id").val(operadorSelecionado.id);
		modalEditarOperador.find("#form-editar-operador-nome").val(operadorSelecionado.nome);
	  	modalEditarOperador.find("#form-editar-operador-senha").val(operadorSelecionado.senha);
	  	modalEditarOperador.find("#form-editar-operador-bloco").empty().append("<option>" + operadorSelecionado.bloco + "</option>");

        $.ajax({
			url: "bloco",
			type: "GET",
			dataType: "json",
			success: function(response) {
				var blocoSelect = $("#form-editar-operador-bloco");
				$.each(response, function(index, blocoOption) {
					blocoSelect.append($("<option></option>").text(blocoOption.descricao).val(blocoOption.id));
				});
				atualizarTabelaOperadores();
			},
			error: function(xhr) {
				console.log("Erro ao obter a lista de blocos!");
				console.log(xhr.responseText);
			}
		});
    }
    
    formEditarOperador.submit(function(event) {
		event.preventDefault();

		var id = $("#form-editar-operador-id").val();
		var nome = $("#form-editar-operador-nome").val();
		var senha = $("#form-editar-operador-senha").val();
		var bloco = $("#form-editar-operador-bloco option:selected").text();

		var operadorEdit = {
			id: id,
			nome: nome,
			senha: senha,
			bloco: bloco
		};

		var operadorEditJSON = JSON.stringify(operadorEdit);

		$.ajax({
			url: "operador_update",
			type: "POST",
			contentType: "application/json",
			data: operadorEditJSON,
			success: function(response) {
				alert("Usuário editado com sucesso!");
				atualizarTabelaOperadores();
				console.log(response);
			},
			error: function(xhr) {
				console.log("Erro ao editar usuário!");
				console.log(xhr.responseText);
			}
		});
		
		modalEditarOperador.modal("hide");
	});               
 	

    $("#btn-confirmar-exclusao").one("click", function() {                        
    	$.ajax({
            url: "operador?id=" + operadorSelecionado.id,
            type: "DELETE",
            success: function() {
                alert("Operador excluído com sucesso!");
                atualizarTabelaOperadores();
            },
            error: function(xhr) {
                console.log("Erro ao excluir o operador!");
                console.log(xhr.responseText);
            }
        });
        
    	operadorSelecionado = null;
    	modalDeletarOperador.modal("hide");
    });
});