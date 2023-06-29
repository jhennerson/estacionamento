<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Operadores</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/estilos.css">
	<script src="${pageContext.request.contextPath}/resources/scripts/operadores.js"></script>
</head>
<body>
	<div class="container mt-5">
	    <div class="container-fluid p-5 bg-primary text-white text-center">
	        <h1 id="lbl-gerenciamento-de-operadores">Gerenciamento de Operadores</h1>
	    </div>
	
        <table class="table table-striped table-bordered my-3 text-center align-middle" id="tbl-operadores">
            <thead>
                <tr>
                    <th class="align-middle table-counter text-primary">ID</th>
                    <th class="align-middle table-common text-primary">Nome</th>
                    <th class="align-middle table-common text-primary">Senha</th>
                    <th class="align-middle table-common text-primary">Bloco</th>
                    <th class="align-middle table-operations-operadores text-primary">Operações</th>
                </tr>
            </thead>
            <tbody id="tbl-body-operadores"></tbody>
        </table>
	
	    <div class="container text-center">
	        <button type="button" class="btn btn-primary p-3 m-1 btn-opcoes" id="btn-cadastrar">Cadastrar</button>
	        <button type="button" value="voltar" class="btn btn-primary p-3 m-1 btn-opcoes" id="btn-voltar" onclick="document.location.href='Admin.jsp'">Voltar</button>
	    </div>
	</div>        
	      
    <div class="modal" id="modal-cadastrar-operador" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Cadastrar Operador</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="form-cadastrar-operador" class="border border-2 p-4 my-3">
                        <div class="my-3">
                            <label for="form-cadastrar-operador-nome" class="form-label" id="lbl-cadastrar-operador-nome">nome:</label>
                            <input type="text" class="form-control" id="form-cadastrar-operador-nome" name="form-cadastrar-operador-nome">
                        </div>

                        <div class="my-3">
                            <label for="form-cadastrar-operador-senha" class="form-label" id="lbl-cadastrar-operador-senha">senha:</label>
                            <input type="password" class="form-control" id="form-cadastrar-operador-senha" name="form-cadastrar-operador-senha">
                        </div>

                        <div class="mb-3">
                            <label for="form-cadastrar-operador-bloco" class="form-label" id="lbl-cadastrar-operador-bloco">Bloco:</label>
                            <select class="form-select" id="form-cadastrar-operador-bloco" name="form-cadastrar-operador-bloco"></select>
                        </div>
                    </form>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" form="form-cadastrar-operador" class="btn btn-primary">Cadastrar</button>
                </div>
            </div>
        </div>
    </div>     
	      
    <div class="modal" id="modal-editar-operador" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Editar Operador</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fechar"></button>
                </div>
                <div class="modal-body">
                    <form id="form-editar-operador-operador" class="border border-2 p-4 my-3">
                    	<div class="my-3">
                            <label for="form-editar-operador-id" class="form-label" id="lbl-editar-id">ID:</label>
                            <input type="text" class="form-control" id="form-editar-operador-id" name="form-editar-operador-id" disabled>
                        </div>
                        
                        <div class="my-3">
                            <label for="form-editar-operador-nome" class="form-label" id="lbl-editar-nome">nome:</label>
                            <input type="text" class="form-control" id="form-editar-operador-nome" name="form-editar-operador-nome">
                        </div>

                        <div class="my-3">
                            <label for="form-editar-operador-senha" class="form-label" id="lbl-editar-senha">senha:</label>
                            <input type="password" class="form-control" id="form-editar-operador-senha" name="form-editar-operador-senha">
                        </div>

                        <div class="mb-3">
                            <label for="form-editar-operador-bloco" class="form-label" id="lbl-editar-bloco">Bloco:</label>
                            <select class="form-select" id="form-editar-operador-bloco" name="form-editar-operador-bloco"></select>
                        </div>
                    </form>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                    <button type="submit" form="form-editar-operador-operador" class="btn btn-primary">Salvar Alterações</button>
                </div>
            </div>
        </div>
    </div>
	      
    <div class="modal" id="modal-deletar-operador" tabindex="-1">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="confirmar-modal-label">Confirmar exclusão</h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fechar"></button>
	            </div>
	            <div class="modal-body">
	                <p class="fs-3 text-center">Deseja realmente deletar este operador?</p>
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