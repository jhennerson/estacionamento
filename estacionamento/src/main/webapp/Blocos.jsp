<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Blocos</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/estilos.css">
	<script src="${pageContext.request.contextPath}/resources/scripts/blocos.js"></script>
</head>
<body>
	<div class="container mt-5">
		<div class="container-fluid p-5 bg-primary text-white text-center">
			<h1 id="lblGerenciamentoDeVagas">Gerenciamento de Blocos</h1>
		</div>
	
		<table class="table table-striped table-bordered my-3 text-center align-middle" id="tblBlocos">
			<thead>
				<tr>
					<th class="align-middle table-counter text-primary">ID</th>
					<th class="align-middle text-primary">Descrição</th>
					<th class="align-middle text-primary">Operador</th>
					<th class="align-middle table-counter text-primary">Vagas Carro</th>
					<th class="align-middle table-counter text-primary">Vagas Moto</th>
					<th class="align-middle table-counter text-primary">Vagas Deficiente</th>
					<th class="align-middle table-operations-blocos text-primary">Operações</th>
				</tr>
			</thead>
			<tbody id="tabela-blocos"></tbody>
		</table>
		
		<div class="container text-center" id="buttons">
	        <button type="button" class="btn btn-primary p-3 m-1 btn-opcoes" id="btn-cadastrar">Cadastrar</button>
	        <button type="button" value="voltar" class="btn btn-primary p-3 m-1 btn-opcoes" id="btn-voltar" onclick="document.location.href='Admin.jsp'">Voltar</button>
	    </div>			
	</div>
	
	<div class="modal" id="modal-cadastrar-bloco" tabindex="-1">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title">Cadastrar Bloco</h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body">
	                <form id="form-cadastrar-bloco" class="border border-2 p-4 my-3">
	                    <div class="my-3">
	                        <label for="form-cadastrar-bloco-descricao" class="form-label" id="lbl-cadastrar-bloco-descricao">Descrição:</label>
	                        <input type="text" class="form-control" id="form-cadastrar-bloco-descricao" name="form-cadastrar-bloco-descricao">
	                    </div>
	
	                    <div class="my-3">
	                        <label for="form-cadastrar-bloco-operador" class="form-label" id="lbl-cadastrar-bloco-operador">Operador:</label>
	                        <select class="form-select" id="form-cadastrar-bloco-operador" name="form-cadastrar-bloco-operador"></select>
	                    </div>
	
	                    <div class="mb-3">
	                        <label for="form-cadastrar-bloco-vagas-carros" class="form-label" id="lbl-cadastrar-bloco-vagas-carros">Vagas Carro:</label>
	                        <input type="number" class="form-control" id="form-cadastrar-bloco-vagas-carros" name="form-cadastrar-bloco-vagas-carros">
	                    </div>
	                    
	                    <div class="mb-3">
	                        <label for="form-cadastrar-bloco-vagas-motos" class="form-label" id="lbl-cadastrar-bloco-vagas-motos">Vagas Moto:</label>
	                        <input type="number" class="form-control" id="form-cadastrar-bloco-vagas-motos" name="form-cadastrar-bloco-vagas-motos">
	                    </div>
	                    
	                    <div class="mb-3">
	                        <label for="form-cadastrar-bloco-vagas-deficientes" class="form-label" id="lbl-cadastrar-bloco-vagas-deficientes">Vagas Deficiente:</label>
	                        <input type="number" class="form-control" id="form-cadastrar-bloco-vagas-deficientes" name="form-cadastrar-bloco-vagas-deficientes">
	                    </div>
	                </form>
	            </div>
	            <div class="modal-footer justify-content-center">
	                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
	                <button type="submit" form="form-cadastrar-bloco" class="btn btn-primary">Cadastrar</button>
	            </div>
	        </div>
	    </div>
	</div>
	      
    <div class="modal" id="modal-editar-bloco" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Editar Bloco</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="form-editar-bloco" class="border border-2 p-4 my-3">
                    	<div class="my-3">
                            <label for="form-editar-bloco-id" class="form-label" id="lbl-editar-bloco-id">ID:</label>
                            <input type="text" class="form-control" id="form-editar-bloco-id" name="form-editar-bloco-id" disabled>
                        </div>
                        
                        <div class="my-3">
                            <label for="form-editar-bloco-descricao" class="form-label" id="lbl-editar-bloco-descricao">Descrição:</label>
                            <input type="text" class="form-control" id="form-editar-bloco-descricao" name="form-editar-bloco-descricao">
                        </div>

                        <div class="my-3">
                            <label for="form-cadastrar-bloco-operador" class="form-label" id="lbl-cadastrar-bloco-operador">Operador:</label>
                            <select class="form-select" id="form-editar-bloco-operador" name="form-editar-bloco-operador"></select>
                        </div>

                        <div class="mb-3">
                            <label for="form-editar-bloco-vagas-carros" class="form-label" id="lbl-editar-bloco-vagas-carros">Vagas Carro:</label>
                            <input type="number" class="form-control" id="form-editar-bloco-vagas-carros" name="form-editar-bloco-vagas-carros">
                        </div>
                        
                        <div class="mb-3">
                            <label for="form-editar-bloco-vagas-motos" class="form-label" id="lbl-editar-bloco-vagas-motos">Vagas Moto:</label>
                            <input type="number" class="form-control" id="form-editar-bloco-vagas-motos" name="form-editar-bloco-vagas-motos">
                        </div>
                        
                        <div class="mb-3">
                            <label for="form-editar-bloco-vagas-deficientes" class="form-label" id="lbl-editar-bloco-vagas-deficientes">Vagas Deficiente:</label>
                            <input type="number" class="form-control" id="form-editar-bloco-vagas-deficientes" name="form-editar-bloco-vagas-deficientes">
                        </div>
                    </form>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" form="form-editar-bloco" class="btn btn-primary">Salvar</button>
                </div>
            </div>
        </div>
    </div>
	      
    <div class="modal" id="modal-deletar-bloco" tabindex="-1">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="confirmar-modal-label">Confirmar exclusão</h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fechar"></button>
	            </div>
	            <div class="modal-body">
	                <p>Deseja realmente deletar este operador?</p>
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