<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Adiciona novo Funcionario</title>

<script src="<c:url value='/validate/lib/jquery.js'/>"></script>
<script src="<c:url value='/validate/dist/jquery.validate.js'/>"></script>
<script src="<c:url value='/validate/jquery.maskedinput.js'/>"></script>
<script src="<c:url value='/validacoesFormularios/regras_adiciona_funcionario.js'/>"></script>

</head>
<body>
<h4 style="padding-left: 15px;">Adicione um novo funcionário</h4>
<hr>

<br/>


<form action="<c:url value='/funcionarios'/>" method="POST" class="form-horizontal" role="form" id="FormularioAdicionaFuncionario">
<div class="container">
<div class="form-group">
<label for="nome" class="col-sm-2 control-label">Nome</label>
<div class="col-sm-10"><input type="text" name="funcionario.nome" class="form-control" id="Nome" value="${funcionario.nome}" autofocus></div>
</div>


<div class="form-group">
<label for="Ramal" class="col-sm-2 control-label">Ramal</label>
<div class="col-sm-10">
<input type="text" name="funcionario.ramal" class="form-control" id="Ramal" value="${funcionario.ramal}"></div>
</div>


<div class="form-group">
<label for="Telefone" class="col-sm-2 control-label">Telefone</label>
<div class="col-sm-10">
<input type="text" name="funcionario.telefone" class="form-control" id="Telefone" value="${funcionario.telefone}"></div>
</div>


<div class="form-group">
<label for="Celular" class="col-sm-2 control-label">Celular</label>
<div class="col-sm-10">
<input type="text" name="funcionario.celular" class="form-control" id="Celular" value="${funcionario.celular}"></div>
</div>


<div class="form-group">
<label for="Celular2" class="col-sm-2 control-label">Celular 2</label>
<div class="col-sm-10">
<input type="text" name="funcionario.celularOutro" class="form-control" id="Celular2" value="${funcionario.celularOutro}"></div>
</div>


<div class="form-group">
<label for="Email" class="col-sm-2 control-label">Email</label>
<div class="col-sm-10">
<input type="text" name="funcionario.email" class="form-control" id="Email" value="${funcionario.email}"></div>
</div>

<div class="form-group">
<label for="setor" class="col-sm-2 control-label">Setor</label>

	
<div class="col-sm-10">
<select name="funcionario.setor" class="form-control" id="setor">
<option value="Não cadastrado">Selecione o setor</option>
<c:forEach items="${setores}" var="setor">
	<option value="${setor.nomeDoSetor}">${setor.nomeDoSetor}</option>
</c:forEach>
</select>
</div>
</div>


<div class="form-group">
<label for="Funcao" class="col-sm-2 control-label">Funcao</label>
<div class="col-sm-10">
<input type="text" name="funcionario.funcao" class="form-control" id="Funcao"  value="${funcionario.funcao}"></div>
</div>


<div class="form-group">
<label for="Observacoes" class="col-sm-2 control-label">Observações</label>
<div class="col-sm-10">
<textarea name="funcionario.observacoes" class="form-control" id="Observacoes">${funcionario.observacoes}</textarea>
</div>
</div>

<div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-primary">Cadastrar</button>
      
    </div>
  </div>
</div>
</form>

</body>
</html>