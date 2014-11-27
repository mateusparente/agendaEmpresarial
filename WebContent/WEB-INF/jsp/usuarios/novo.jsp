<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="<c:url value='/validate/lib/jquery.js'/>"></script>
<script src="<c:url value='/validate/dist/jquery.validate.js'/>"></script>
<script src="<c:url value='/validacoesFormularios/regras_adiciona_usuario.js'/>"></script>
</head>
<body>
<h4 style="padding-left: 15px !important">Criar novo usuário</h4><hr><br/>
<div class="container">

<form id="usuariosForm" action="<c:url value='/usuarios'/>" method="POST" class="form-horizontal" role="form">

    <div class="form-group">    
    <label for="nome" class="col-md-4">Nome:</label>
    <div class="col-sm-10"><input id="nome" type="text" name="usuario.nome" value="${usuario.nome }" class="form-control"/></div>
	</div>
	
	<div class="form-group">
    <label for="login" class="col-md-4">Login:</label>
    <div class="col-sm-10"><input id="login" type="text" name="usuario.login" value="${usuario.login }" class="form-control"/></div>
	</div>

    <div class="form-group">
    <label for="senha" class="col-md-4">Senha:</label>
    <div class="col-sm-10"><input id="senha" type="password" name="usuario.senha" class="form-control"/></div>
	</div>
	
	<div class="form-group">
    <label for="confirmacao" class="col-md-4">Confirme a senha:</label>
    <div class="col-sm-10"><input id="confirmacao" type="password" class="form-control" name="confirmacao"/></div>
	</div>
	
    <div class="form-group">
	<div class="col-md-4">
	<button type="submit" class="btn btn-primary">Cadastrar</button>
	</div>

	</div>

</form>
</div>

</body>
</html>