<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adiciona novo Funcionario</title>
<script src="../../../validate/lib/jquery.js"></script>
<script src="../../../validate/dist/jquery.validate.js"></script>
<script type="text/javascript">
	$.validator.setDefaults({
		submitHandler: function() {
			alert("submitted!");
		}
	});

	$("#FormularioAdicionaFuncionario").$.validate();
</script>
</head>
<body>
<h4 style="padding-left: 15px;">Adicione um novo funcionário</h4>
<hr>
<br/>

<div style="width: 50% !important;">

<form action="<c:url value='/funcionarios'/>" method="POST" class="form-horizontal" role="form" id="FormularioAdicionaFuncionario">

<div class="form-group">
<label for="nome" class="col-sm-2 control-label">Nome</label>
<div class="col-sm-10">
<input type="text" name="funcionario.nome" class="form-control" id="nome" required>
</div>
</div>


<div class="form-group">
<label for="Ramal" class="col-sm-2 control-label">Ramal</label>
<div class="col-sm-10">
<input type="text" name="funcionario.ramal" class="form-control" id="Ramal"></div>
</div>


<div class="form-group">
<tr><td>
<label for="Telefone" class="col-sm-2 control-label">Telefone</label>
</td><td>
<div class="col-sm-10">
<input type="text" name="funcionario.telefone" class="form-control" id="Telefone"></div>
</td></tr>
</div>


<div class="form-group">
<tr><td>
<label for="Celular" class="col-sm-2 control-label">Celular</label>
</td><td>
<div class="col-sm-10">
<input type="text" name="funcionario.celular" class="form-control" id="Celular"></div>
</td></tr>
</div>


<div class="form-group">
<tr><td>
<label for="Celular2" class="col-sm-2 control-label">Celular 2</label>
</td><td>
<div class="col-sm-10">
<input type="text" name="funcionario.celularOutro" class="form-control" id="Celular2"></div>
</td></tr>
</div>


<div class="form-group">
<tr><td>
<label for="Email" class="col-sm-2 control-label">Email</label>
</td><td>
<div class="col-sm-10">
<input type="email" name="funcionario.email" class="form-control" id="Email"></div>
</td></tr>
</div>

<div class="form-group">
<tr><td><label for="setor" class="col-sm-2 control-label">Setor</label></td>

<td>	
<div class="col-sm-10">
<select name="funcionario.setor" class="form-control" id="setor">
<option>Selecione o setor</option>
<c:forEach items="${setores}" var="setor">
	<option value="${setor.nomeDoSetor}">${setor.nomeDoSetor}</option>
</c:forEach>
</select>
</div>
</td></tr>
</div>


<div class="form-group">
<tr><td>
<label for="Funcao" class="col-sm-2 control-label">Funcao</label>
</td><td>
<div class="col-sm-10">
<input type="text" name="funcionario.funcao" class="form-control" id="Funcao"></div>
</td></tr>
</div>


<div class="form-group">
<tr><td>
<label for="Observacoes" class="col-sm-2 control-label">Observações</label>
</td><td>
<div class="col-sm-10">
<textarea name="funcionario.observacoes" class="form-control" id="Observacoes"></textarea>
</div>
</td></tr>
</div>

<div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <tr><td><button type="submit" class="btn btn-default">Enviar</button></td></tr>
      
    </div>
  </div>
</form>
</div>
</body>
</html>