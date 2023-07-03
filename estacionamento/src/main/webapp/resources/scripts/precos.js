$(document).ready(function() {
				
	var tabelaPrecos = $("#tabela-precos");
	var modalCadastrarPreco = $("#modal-cadastrar-preco");
	var modalEditarPreco = $("#modal-editar-preco");
	var modalDeletarPreco = $("#modal-deletar-preco");
	var formCadastrarPreco = $("#form-cadastrar-preco");
	var formEditarPreco = $("#form-editar-preco");
	var precoSelecionado;
	
	atualizarTabelaPrecos();
	
	$("#btn-cadastrar").click(abrirModalCadastrarPreco);
	
	function atualizarTabelaPrecos() {
		tabelaPrecos.empty();
		
		$.ajax({
			url: "preco",
            type: "GET",
            dataType: "json",
            success: function(response) {
                $.each(response, function(index, preco) {
					var row = $("<tr></tr>");
					
					var idCell = $("<td></td>").text(preco.id);
					var valorCell = $("<td></td>").text(preco.valor);
					var timestampCell = $("<td></td>").text(preco.timestamp);
					
					var editarButton = $("<button></button>")
                    	.addClass("btn btn-primary btn-operacoes btn-operacoes-precos")
                    	.text("Editar")
                    	.attr("data-bs-toggle", "modal")
						.attr("data-bs-target", "#modal-editar-preco")
                    	.on("click", function() {
                        	precoSelecionado = preco;
                        	editarPreco();
                   		});

                	var deletarButton = $("<button></button>")
                    	.addClass("btn btn-danger btn-operacoes btn-operacoes-precos")
                    	.attr("data-bs-toggle", "modal")
						.attr("data-bs-target", "#modal-deletar-preco")
                    	.text("Deletar")
                    	.attr("data-preco-id", preco.id)
                    	.on("click", function() {
                        	precoSelecionado = preco;
                   		});

                	var operacoesCell = $("<td></td>")
                    	.append(editarButton)
                    	.append(" ")
                    	.append(deletarButton);
					
					row.append(idCell);
					row.append(valorCell);
					row.append(timestampCell);
					row.append(operacoesCell);
					
					tabelaPrecos.append(row);
				});
			},
			error: function(xhr) {
                console.log("Erro ao obter a lista de precoes!");
                console.log(xhr.responseText);
            }
		});
	}
	
	function abrirModalCadastrarPreco() {
		modalCadastrarPreco.modal("show");

        $.ajax({
			url: "preco",
			type: "GET",
			dataType: "json",
			success: function(response) {
				var precoSelect = $("#form-cadastrar-preco-preco");
				precoSelect.empty();
				$.each(response, function(index, precoOption) {
					precoSelect.append($("<option></option>").text(precoOption.valor).val(precoOption.id));
				});
				atualizarTabelaPrecos();
			},
			error: function(xhr) {
				console.log("Erro ao obter a lista de precoes!");
				console.log(xhr.responseText);
			}
		});
    }
	
	formCadastrarPreco.submit(function(event) {
		event.preventDefault();

		var valor = $("#form-cadastrar-preco-valor").val();

		var preco = {
			valor: valor
		};

		var precoJSON = JSON.stringify(preco);

		$.ajax({
			url: "preco",
			type: "POST",
			contentType: "application/json",
			data: precoJSON,
			success: function(response) {
				alert("Preco cadastrado com sucesso!");
				atualizarTabelaPrecos();
				console.log(response);
			},
			error: function(xhr) {
				console.log("Erro ao criar preco!");
				console.log(xhr.responseText);
			}
		});
		
		modalCadastrarPreco.modal("hide");					
	});
	
	function editarPreco() {		
		modalEditarPreco.modal("show");               	
    	
		modalEditarPreco.find("#form-editar-preco-id").val(precoSelecionado.id);
		modalEditarPreco.find("#form-editar-preco-valor").val(precoSelecionado.valor);

        $.ajax({
			url: "preco",
			type: "GET",
			dataType: "json",
			success: function(response) {
				var precoSelect = $("#form-editar-preco-valor");
				precoSelect.empty();
				$.each(response, function(precoOption) {
					precoSelect.append($("<option></option>").text(precoOption.valor).val(precoOption.id));
				});
				atualizarTabelaPrecos();
			},
			error: function(xhr) {
				console.log("Erro ao obter a lista de precos!");
				console.log(xhr.responseText);
			}
		});
    }
	
	formEditarPreco.submit(function(event) {
		event.preventDefault();

		var id = $("#form-editar-preco-id").val();
		var valor = $("#form-editar-preco-valor").val();

		var preco = {
			id: id,
			valor: valor
		};

		var precoJSON = JSON.stringify(preco);

		$.ajax({
			url: "preco_update",
			type: "POST",
			contentType: "application/json",
			data: precoJSON,
			success: function(response) {
				alert("Preco editado com sucesso!");
				atualizarTabelaPrecos();
				console.log(response);
			},
			error: function(xhr) {
				console.log("Erro ao editar preco!");
				console.log(xhr.responseText);
			}
		});
		
		modalEditarPreco.modal("hide");					
	});
	
	
	$("#btn-confirmar-exclusao").on("click", function() {
    	$.ajax({
            url: "preco?id=" + precoSelecionado.id,                
            type: "DELETE",
            success: function() {
                alert("Preco excluído com sucesso!");
                atualizarTabelaPrecos();
            },
            error: function(xhr) {
                console.log("Erro ao excluir o preco!");
                console.log(xhr.responseText);
            }
        });
        
        precoSelecionado = null;
        modalDeletarPreco.modal("hide");        
    });
});