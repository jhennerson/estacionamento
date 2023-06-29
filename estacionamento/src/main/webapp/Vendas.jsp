<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Vendas</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/estilos.css">
	<script src="${pageContext.request.contextPath}/resources/scripts/vendas.js"></script>
</head>
<body>
	<div class="container">
		<div class="container-fluid p-5 bg-primary text-white text-center">
			<h1 id="lbl-relatorio">Relatório de Vendas</h1>
		</div>

		<table class="table table-striped table-bordered my-3 text-center align-middle" id="tbl-vendas">
			<thead>
				<tr>
					<th class="text-primary">ID</th>
					<th class="text-primary">Valor</th>
					<th class="text-primary">Preço/hora</th>
					<th class="text-primary">Data/Hora</th>
				</tr>
			</thead>
			<tbody id="tabela-vendas"></tbody>
		</table>
		
		<div class="d-flex justify-content-center my-3">
			<div>
				<label class="total-label text-danger fw-bold fs-3">Valor total R$:</label>
			</div>			
			<div class="border border-2 mx-2 px-3">
				<span class="fs-3" id="valorTotal"></span>
			</div>						
		</div>
		
		<div class="container text-center" id="buttons">
	        <button type="button" class="btn btn-primary p-3 m-1 btn-opcoes" id="btn-cadastrar">Calcular Total</button>
	        <button type="button" value="voltar" class="btn btn-primary p-3 m-1 btn-opcoes" id="btn-voltar" onclick="document.location.href='Admin.jsp'">Voltar</button>
	    </div>
	</div>
	
	<div class="modal" id="modal-deletar-venda" tabindex="-1">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="confirmar-modal-label">Confirmar exclusão</h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fechar"></button>
	            </div>
	            <div class="modal-body">
	                <p>Deseja realmente deletar esta venda?</p>
	            </div>
	            <div class="modal-footer justify-content-center">
	                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Não</button>
	                <button type="button" class="btn btn-danger" id="btn-confirmar-exclusao">Sim</button>
	            </div>
	        </div>
	    </div>
	</div>
	
	<%@ include file="Footer.jsp" %>
</body>
</html>