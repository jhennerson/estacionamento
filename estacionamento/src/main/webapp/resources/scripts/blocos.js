$(document).ready(function() {
				
	var tabelaBlocos = $("#tabela-blocos");
	var modalCadastrarBloco = $("#modal-cadastrar-bloco");
	var modalEditarBloco = $("#modal-editar-bloco");
	var modalDeletarBloco = $("#modal-deletar-bloco");
	var formCadastrarBloco = $("#form-cadastrar-bloco");
	var formEditarBloco = $("#form-editar-bloco");
	var blocoSelecionado;
	
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
                    	.addClass("btn btn-primary btn-operations-blocos")
                    	.text("Editar")
                    	.attr("data-bloco-id", bloco.id)
                    	.attr("data-bs-toggle", "modal")
						.attr("data-bs-target", "#modal-editar-bloco")
                    	.click(function () {
							blocoSelecionado = bloco;
                        	editarBloco();
                   		});

                	var deletarButton = $("<button></button>")
                    	.addClass("btn btn-danger btn-operations-blocos")
                    	.attr("data-bs-toggle", "modal")
						.attr("data-bs-target", "#modal-deletar-bloco")
                    	.text("Deletar")
                    	.attr("data-bloco-id", bloco.id)
                    	.one("click", function() {
                        	blocoSelecionado = bloco;
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
			error: function(xhr) {
                console.log("Erro ao obter a lista de operadores!");
                console.log(xhr.responseText);
            }
		});
	}
	
	function abrirModalCadastrarBloco() {
		modalCadastrarBloco.modal("show");
    	
    	//resgata lista de operadores
        $.ajax({
			url: "operador",
			type: "GET",
			dataType: "json",
			success: function(response) {
				//preencher o campo "bloco" com as opções da lista de blocos
				var operadorSelect = $("#form-cadastrar-bloco-operador");
				operadorSelect.empty();
				$.each(response, function(operadorOption) {
					operadorSelect.append($("<option></option>").text(operadorOption.nome).val(operadorOption.id));
				});
				atualizarTabelaBlocos();
			},
			error: function(xhr) {
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
			url: "bloco",
			type: "POST",
			contentType: "application/json",
			data: blocoJSON,
			success: function(response) {
				alert("Bloco cadastrado com sucesso!");
				atualizarTabelaBlocos();
				console.log(response);
			},
			error: function(xhr) {
				console.log("Erro ao criar bloco!");
				console.log(xhr.responseText);
			}
		});
		
		modalCadastrarBloco.modal("hide");					
	});
	
	function editarBloco() {
		modalEditarBloco.modal("show");          	
    	
		modalEditarBloco.find("#form-editar-bloco-id").val(blocoSelecionado.id);
		modalEditarBloco.find("#form-editar-bloco-descricao").val(blocoSelecionado.descricao);
	  	modalEditarBloco.find("#form-editar-bloco-operador").empty().append("<option>" + blocoSelecionado.operador + "</option>");
	  	modalEditarBloco.find("#form-editar-bloco-vagas-carros").val(blocoSelecionado.vagasCarros);
		modalEditarBloco.find("#form-editar-bloco-vagas-motos").val(blocoSelecionado.vagasMotos);
	  	modalEditarBloco.find("#form-editar-bloco-vagas-deficientes").val(blocoSelecionado.vagasDeficientes);
  		
	  	//resgata lista de operadores
        $.ajax({
			url: "operador",
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
			error: function(xhr) {
				console.log("Erro ao obter a lista de operadores!");
				console.log(xhr.responseText);
			}
		});
    }
	
	formEditarBloco.submit(function(event) {
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
			url: "bloco_update",
			type: "POST",
			contentType: "application/json",
			data: blocoJSON,
			success: function(response) {
				alert("Bloco editado com sucesso!");
				atualizarTabelaBlocos();
				console.log(response);
			},
			error: function(xhr) {
				console.log("Erro ao editar bloco!");
				console.log(xhr.responseText);
			}
		});
		
		modalEditarBloco.modal("hide");					
	});
	

    $("#btn-confirmar-exclusao").one("click", function() {
        
    	$.ajax({
            url: "bloco?id=" + blocoSelecionado.id,
            type: "DELETE",
            success: function() {
                alert("Bloco excluído com sucesso!");
                atualizarTabelaBlocos();
            },
            error: function(xhr) {
                console.log("Erro ao excluir o bloco!");
                console.log(xhr.responseText);
            }
        });
        
    	blocoSelecionado = null;
    	modalDeletarBloco.modal("hide");                        
    });
});