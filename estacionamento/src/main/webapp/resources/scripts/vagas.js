$(document).ready(function() {				
	var tabelaVagas = $("#tbl-body-vagas");
	var modalAlterarEstado = $("#modal-alterar-estado");
	var modalCalcularPreco = $("#modal-calcular-preco");
	var formCalcularTotal = $("#form-calcular-venda");
	var vagasLivres = $("#span-vagas-livres");
	var vagasOcupadas = $("#span-vagas-ocupadas");
	var vagaSelecionada;
	
	console.log(vagaSelecionada);
	
	atualizarTabelaVagas();
	
	function atualizarTabelaVagas() {
		var contagemVagasLivres = 0;
		var contagemVagasOcupadas = 0;		
		
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
						.addClass("btn btn-primary btn-operacoes btn-operacoes-vagas")
						.text("Aterar Estado")
						.attr("data-bs-toggle", "modal")
						.attr("data-bs-target", "#modal-alterar-estado")
						.on("click", function() {
							vagaSelecionada = vaga;
						});									
					
					var btCalcularPreco = $("<button></button>")
						.addClass("btn btn-warning btn-operacoes btn-operacoes-vagas")
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

		vagasLivres.text(contagemVagasLivres);
		vagasOcupadas.text(contagemVagasOcupadas);					
	}	
	
	function abrirModalCalcularPreco(vaga) {
		modalCalcularPreco.modal("show");
		modalCalcularPreco.find("#form-calcular-venda-timestamp").val(vaga.timestamp);		
		
		$.ajax({
			url: "preco",
			type: "GET",
			dataType: "json",
			success: function(response) {
				var precoSelect = $("#form-calcular-venda-preco-hora");
				precoSelect.empty();
				modalCalcularPreco.find("#form-calcular-venda-preco-hora")
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
		
		$("#form-calcular-venda-preco-hora").change(function() {
			precoSelecionado = ($(this).val());
		});
		
		$("#btn-calcular-venda").on("click", function() {			
			$.ajax({
				url: "calculadora",
				type: "POST",
				data: {timestamp: vaga.timestamp, valorHora: precoSelecionado},
				success: function(response) {
	                modalCalcularPreco.find("#form-calcular-venda-valor").val(response);
	            },
	            error: function(xhr) {
	                console.log("Erro ao calcular o total!");
	                console.log(xhr.responseText);
	            }
			});
		});
	}

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
	
	formCalcularTotal.submit(function(event) {
		event.preventDefault();

		var operador = $("#form-calcular-venda-operador").val();
		var bloco = $("#form-calcular-venda-bloco").val();
		var precoHora = $("#form-calcular-venda-preco-hora option:selected").text();
		var valor = $("#form-calcular-venda-valor").val().replace(/,/, '.');
		var valorConvertido = parseFloat(valor);

		var venda = {
			operador: operador,
			bloco: bloco,
			precoHora: precoHora,
			valor: valorConvertido
		};

		var vendaJSON = JSON.stringify(venda);

		$.ajax({
			url: "venda",
			type: "POST",
			contentType: "application/json",
			data: vendaJSON,
			success: function(response) {
				alert("Venda cadastrada com sucesso!");
				console.log(response);
			},
			error: function(xhr) {
				console.log("Erro ao cadastrar venda!");
				console.log(xhr.responseText);
			}
		});
		
		modalCalcularPreco.modal("hide");
	});
});