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
			<div class="container-fluid p-5 bg-primary text-white text-center">
				<h1 id="lbl-gerenciamento-de-vagas">Gerenciamento de Vagas</h1>
			</div>
			
			<div class="d-flex m-3 justify-content-evenly align-items-center">
				<div class="d-flex">
					<label class="fs-2" id="lbl-vagas-livres">Vagas Livres:</label>
					<div class="border border-2 mx-2 px-3">
						<span class="fs-3" id="span-vagas-livres"></span>
					</div>
				</div>
		
				<div class="d-flex">
					<label class="fs-2" id="lbl-vagas-ocupadas">Vagas Ocupadas:</label>
					<div class="border border-2 mx-2 px-3">
						<span class="fs-3" id="span-vagas-ocupadas"></span>
					</div>
				</div>
			</div>
			
			<table class="table table-hover table-dark table-bordered my-3 text-center align-middle" id="tblVagas">
				<thead>
					<tr>
						<th class="align-middle table-counter">ID</th>
						<th class="align-middle table-common">Categoria</th>
						<th class="align-middle table-common">Bloco</th>
						<th class="align-middle table-common">Estado</th>
						<th class="align-middle table-ultima-atualizacao">Última Atualização</th>
						<th class="align-middle table-operations-vagas">Operações</th>
					</tr>
				</thead>
				<tbody id="tbl-body-vagas"></tbody>
			</table>
	
			<div class="container text-center" id="buttons">
				<button type="button" class="btn btn-primary p-3 m-1 btn-opcoes" id="btn-relatorio">Relatório</button>
				<button type="button" value="voltar" class="btn btn-primary p-3 m-1 btn-opcoes" id="btn-voltar" onclick="document.location.href='Admin.jsp'">Voltar</button>
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
		                <form id="form-calcular-total" class="border border-2 p-4 my-3">		                
		                	<div class="my-3">
	                            <label for="form-calcular-total-timestamp" class="form-label" id="lbl-valor-hora">Última Alteração:</label>
	                            <input type="text" class="form-control" id="form-calcular-total-timestamp" name="form-calcular-total-timestamp" disabled>
	                        </div>
		                	
	                    	<div class="my-3">
	                            <label for="form-calcular-total-valor-hora" class="form-label" id="lbl-valor-hora">Valor/Hora:</label>
	                            <select class="form-select" id="form-calcular-total-valor-hora" name="form-calcular-total-valor-hora" required></select>
	                        </div>
	                        
	                        <div class="my-3">
	                            <label for="form-valor-total" class="form-label" id="lbl-valor-total">Valor total:</label>
	                            <input type="text" class="form-control" id="form-calcular-total-valor-total" name="form-calcular-total-valor-total" disabled>
	                        </div>
	                        <div class="text-center">
	                        	<button type="button" form="form-calcular-total" class="btn btn-success btn-lg" id="btn-calcular-total">Calcular</button>
	                        </div>	                        
	                    </form>
		            </div>
		            <div class="modal-footer justify-content-center">
		                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
		                <button type="button" class="btn btn-primary" id="btn-salvar-venda">Salvar</button>
		            </div>
		        </div>
		    </div>
		</div>
		
		<%@ include file="Footer.jsp" %>
	</body>
</html>