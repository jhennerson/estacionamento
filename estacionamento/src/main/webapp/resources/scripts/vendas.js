$(document).ready(function() {
				
	var tabelaVendas = $("#tabela-vendas");
	var modalDeletarVenda = $("#modal-deletar-venda");
	var vendaSelecionada;
	
	atualizarTabelaVendas();
	
	function atualizarTabelaVendas() {
		tabelaVendas.empty();
		
		$.ajax({
			url: "venda",
            type: "GET",
            dataType: "json",
            success: function(response) {
                $.each(response, function(index, venda) {
					var row = $("<tr></tr>");
					
					var idCell = $("<td></td>").text(venda.id);
					var valorCell = $("<td></td>").text(venda.valor);
					var precoHoraCell = $("<td></td>").text(venda.precoHora);
					var timestampCell = $("<td></td>").text(venda.timestamp);

                	var deletarButton = $("<button></button>")
                    	.addClass("btn btn-danger btn-operations-vendas")
                    	.attr("data-bs-toggle", "modal")
						.attr("data-bs-target", "#modal-deletar-venda")
                    	.text("Deletar")
                    	.attr("data-venda-id", venda.id)
                    	.on("click", function() {
                        	vendaSelecionada = venda;
                   		});

                	var operacoesCell = $("<td></td>").append(deletarButton);
					
					row.append(idCell);
					row.append(valorCell);
					row.append(precoHoraCell);
					row.append(timestampCell);
					row.append(operacoesCell);
					
					tabelaVendas.append(row);
				});
			},
			error: function(xhr) {
                console.log("Erro ao obter a lista de vendas!");
                console.log(xhr.responseText);
            }
		});
	}
	
	$("#btn-confirmar-exclusao").on("click", function() {
    	$.ajax({
            url: "venda?id=" + vendaSelecionada.id,                
            type: "DELETE",
            success: function() {
                alert("Venda excluído com sucesso!");
                atualizarTabelaVendas();
            },
            error: function(xhr) {
                console.log("Erro ao excluir o venda!");
                console.log(xhr.responseText);
            }
        });
        
        vendaSelecionada = null;
        modalDeletarVenda.modal("hide");
    });
});