<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Adiciona novo setor</title>

<script src="<c:url value='/validate/lib/jquery.js'/>"></script>
<script src="<c:url value='/validate/dist/jquery.validate.js'/>"></script>
<script src="<c:url value='/validacoesFormularios/regras_adiciona_setor.js'/>"></script>

</head>
<body>
<h4 style="padding-left: 15px !important">Adicione um novo setor</h4><hr>
<br/>
<div class="container">
<form action="<c:url value='/setores'/>" method="POST" class="form-horizontal" role="form" id="FormularioAdicionaSetor">

<div class="form-group">
<label for="nomeSetor" class="col-md-4">Nome do Setor</label>
<div class="col-sm-10">
<input type="text" name="setor.nomeDoSetor" class="form-control" id="nomeSetor" autofocus>
</div>
</div>

<div class="form-group">
<label for="nomeGestor" class="col-md-4">Gestor Responsavel</label>
<div class="col-sm-10">
<input type="text" name="setor.gestorResponsavel" class="form-control" id="nomeGestor">
</div>
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