$(document).ready(function() {				
	var tabelaVagas = $("#tbl-body-vagas");
	var modalAlterarEstado = $("#modal-alterar-estado");
	var modalCalcularPreco = $("#modal-calcular-preco");
	var vagaSelecionada;
	
	console.log(vagaSelecionada);
	
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
						.addClass("btn btn-primary btn-operations-vagas fw-bold")
						.text("Aterar Estado")
						.attr("data-bs-toggle", "modal")
						.attr("data-bs-target", "#modal-alterar-estado")
						.on("click", function() {
							vagaSelecionada = vaga;
						});									
					
					var btCalcularPreco = $("<button></button>")
						.addClass("btn btn-warning btn-operations-vagas fw-bold")
						.text("Calcular Preço")
						.attr("data-bs-toggle", "modal")
						.attr("data-bs-target", "#modal-calcular-preco")
						.on("click", function() {
							abrirModalCalcularPreco(vaga);								
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
	
	function abrirModalCalcularPreco(vaga) {
		modalCalcularPreco.modal("show");
		modalCalcularPreco.find("#form-calcular-total-timestamp").val(vaga.timestamp);		
		
		$.ajax({
			url: "preco",
			type: "GET",
			dataType: "json",
			success: function(response) {
				//preencher o campo "Valor/hora" com as opções da lista de blocos
				var precoSelect = $("#form-calcular-total-valor-hora");
				precoSelect.empty();
				modalCalcularPreco.find("#form-calcular-total-valor-hora")
								  .empty()
								  .append("<option selected disabled>Selecione uma opção</option>")
				$.each(response, function(index, precoOption) {
					precoSelect.append($("<option></option>").text(precoOption.valor).val(precoOption.valor));
				});
			},
			error: function(xhr) {				
				console.log("Erro ao obter a lista de precos!");
				console.log(xhr.responseText);
			}
		});
		
		var precoSelecionado;
		
		$("#form-calcular-total-valor-hora").change(function() {
			precoSelecionado = ($(this).val());
		});
		
		$("#btn-calcular-total").on("click", function() {			
			$.ajax({
				url: "calculadora",
				type: "POST",
				data: {timestamp: vaga.timestamp, valorHora: precoSelecionado},
				success: function(response) {
	                modalCalcularPreco.find("#form-calcular-total-valor-total").val(response);
	            },
	            error: function(xhr) {
	                console.log("Erro ao calcular o total!");
	                console.log(xhr.responseText);
	            }
			});
		});
	}

	//corfirma a alteração do estado da vaga "LIVRE" para "OCUPADO" e vice versa
	$("#btn-confirmar-alteracao").on("click", function() {
		$.ajax({
			url: "vaga_update",
			type: "POST",
			data: {id: vagaSelecionada.id},
			success: function() {
                alert("Estado da vaga alterado com sucesso!");
                atualizarTabelaVagas();
            },
            error: function(xhr) {
                console.log("Erro ao alterar o estado da vaga!");
                console.log(xhr.responseText);
            }
		});
		
		vagaSelecionada = null;
		modalAlterarEstado.modal("hide");
	});
});