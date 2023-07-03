<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Preços</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/estilos.css">
	<script src="${pageContext.request.contextPath}/resources/scripts/precos.js"></script>
</head>
<body>
	<div class="container mt-5">
		<div class="container-fluid p-5 bg-dark text-white text-center">
			<h1 id="lbl-precos">Gerenciamento de Preços</h1>
		</div>
		<div class="container main-box">	
			<table class="table table-striped table-bordered my-3 text-center align-middle" id="tbl-precos">
				<thead>
					<tr>
						<th class="align-middle text-primary">ID</th>
						<th class="align-middle text-primary">Valor R$</th>
						<th class="align-middle text-primary">Última Atualização</th>
						<th class="align-middle text-primary">Operações</th>
					</tr>
				</thead>
				<tbody id="tabela-precos"></tbody>
			</table>
			
			<div class="d-flex flex-row justify-content-center">
		        <div>
		        	<button type="button" class="btn btn-primary p-3 m-3" id="btn-cadastrar">Cadastrar</button>
		        </div>
		        
				<div>
					<form action="autenticador" method="POST">
		       			<input type="hidden" name="nome" value="<%= session.getAttribute("nome") %>">
		       			<button type="submit" value="voltar" class="btn btn-danger p-3 m-3 btn-voltar" id="btn-voltar">Voltar</button>
		       		</form>
	       		</div>
		    </div>
	    </div>
	</div>
	
	<div class="modal" id="modal-cadastrar-preco" tabindex="-1">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title">Cadastrar Preco</h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body">
	                <form id="form-cadastrar-preco" class="border border-2 p-4 my-3">
	                    <div class="my-3">
	                        <label for="form-cadastrar-preco-valor" class="form-label" id="lbl-cadastrar-preco-valor">Preço:</label>
	                        <input type="text" class="form-control" id="form-cadastrar-preco-valor" name="form-cadastrar-preco-valor">
	                    </div>
	                </form>
	            </div>
	            <div class="modal-footer justify-content-center">
	                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
	                <button type="submit" form="form-cadastrar-preco" class="btn btn-primary">Cadastrar</button>
	            </div>
	        </div>
	    </div>
	</div>
	      
    <div class="modal" id="modal-editar-preco" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Editar Preço</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="form-editar-preco" class="border border-2 p-4 my-3">
                    	<div class="my-3">
                            <label for="form-editar-preco-id" class="form-label" id="lbl-editar-preco-id">ID:</label>
                            <input type="text" class="form-control" id="form-editar-preco-id" name="form-editar-preco-id" disabled>
                        </div>
                        
                        <div class="my-3">
                            <label for="form-editar-preco-valor" class="form-label" id="lbl-editar-preco-valor">Valor:</label>
                            <input type="text" class="form-control" id="form-editar-preco-valor" name="form-editar-preco-valor">
                        </div>
                    </form>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" form="form-editar-preco" class="btn btn-primary">Salvar</button>
                </div>
            </div>
        </div>
    </div>
	      
    <div class="modal" id="modal-deletar-preco" tabindex="-1">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="confirmar-modal-label">Confirmar exclusão</h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fechar"></button>
	            </div>
	            <div class="modal-body">
	                <p>Deseja realmente deletar este preço?</p>
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