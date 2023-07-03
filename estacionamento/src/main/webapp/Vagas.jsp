<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<title>Vagas</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/estilos.css">
	<script src="${pageContext.request.contextPath}/resources/scripts/vagas.js"></script>
</head>
	<body>
		<div class="container mt-5">
			<div class="container-fluid mb-3 p-5 bg-dark text-white text-center">
				<h1 id="lbl-gerenciamento-de-vagas">Gerenciamento de Vagas</h1>
			</div>
			<div class="container main-box">			
				<div class="d-flex m-3 justify-content-evenly align-items-center">
					<div class="d-flex my-3">
						<label class="fs-2" id="lbl-vagas-livres">Vagas Livres:</label>
						<div class="border border-success border-3 rounded mx-2 px-3">
							<span class="text-success fs-3" id="span-vagas-livres"></span>
						</div>
					</div>
			
					<div class="d-flex my-3">
						<label class="fs-2" id="lbl-vagas-ocupadas">Vagas Ocupadas:</label>
						<div class="border border-danger border-3 rounded mx-2 px-3">
							<span class="text-danger fs-3" id="span-vagas-ocupadas"></span>
						</div>
					</div>
				</div>
				
				<table class="table table-hover table-dark table-bordered my-3 text-center align-middle" id="tblVagas">
					<thead>
						<tr>
							<th class="align-middle">ID</th>
							<th class="align-middle">Categoria</th>
							<th class="align-middle ">Bloco</th>
							<th class="align-middle">Estado</th>
							<th class="align-middle">Última Atualização</th>
							<th class="align-middle">Operações</th>
						</tr>
					</thead>
					<tbody id="tbl-body-vagas"></tbody>
				</table>
		
				<div class="d-flex flex-row justify-content-center">				
					<form action="autenticador" method="POST">
		       			<input type="hidden" name="nome" value="<%= session.getAttribute("nome") %>">
		       			<button type="submit" value="voltar" class="btn btn-danger p-3 m-3 btn-voltar" id="btn-voltar">Voltar</button>
		       		</form>
				</div>
			</div>
		</div>
		
		<div class="modal" id="modal-alterar-estado" tabindex="-1">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h5 class="modal-title" id="confirmar-modal-label">Confirmar alteração</h5>
		                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fechar"></button>
		            </div>
		            <div class="modal-body">
		                <p class="fs-3 text-center">Alterar estado?</p>
		            </div>
		            <div class="modal-footer justify-content-center">
		                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Não</button>
		                <button type="button" class="btn btn-primary" id="btn-confirmar-alteracao">Sim</button>
		            </div>
		        </div>
		    </div>
		</div>
		
		<div class="modal" id="modal-calcular-preco" tabindex="-1">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h5 class="modal-title" id="confirmar-modal-label">Confirmar alteração</h5>
		                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fechar"></button>
		            </div>
		            <div class="modal-body">		            
		                <form id="form-calcular-venda" class="border border-2 p-4 my-3">	                        
	                        <div class="my-3">
	                            <label for="form-calcular-venda-timestamp" class="form-label" id="lbl-valor-hora">Última atualização:</label>
	                            <input type="text" class="form-control" id="form-calcular-venda-timestamp" name="form-calcular-venda-timestamp" disabled>
	                        </div>
		                	
	                    	<div class="my-3">
	                            <label for="form-calcular-venda-preco-hora" class="form-label" id="lbl-valor-hora">preço/hora:</label>
	                            <select class="form-select" id="form-calcular-venda-preco-hora" name="form-calcular-venda-preco-hora" required></select>
	                        </div>
	                        
	                        <div class="my-3">
	                            <label for="form-calcular-venda-valor" class="form-label" id="lbl-valor-total">Valor total:</label>
	                            <input type="text" class="form-control" id="form-calcular-venda-valor" name="form-calcular-venda-valor" disabled>
	                        </div>
	                        <div class="text-center">
	                        	<button type="button" class="btn btn-success btn-lg" id="btn-calcular-venda">Calcular</button>
	                        </div>	                        
	                    </form>
		            </div>
		            <div class="modal-footer justify-content-center">
		                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
		                <button type="submit" form="form-calcular-venda" class="btn btn-primary" id="btn-salvar-venda">Salvar</button>
		            </div>
		        </div>
		    </div>
		</div>
		
		<%@ include file="Footer.jsp" %>
	</body>
</html>