<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adiciona novo Funcionario</title>
<script src="<c:url value='/validate/lib/jquery.js'/>"></script>
<script src="<c:url value='/validate/dist/jquery.validate.js'/>"></script>
<script src="<c:url value='/validate/jquery.maskedinput.js'/>"></script>

<script>
	$.validator.setDefaults({
		
	highlight: function(element) {
        $(element).closest('.form-group').addClass('has-error');
    },
    unhighlight: function(element) {
        $(element).closest('.form-group').removeClass('has-error');
    },
    errorElement: 'span',
    errorClass: 'help-block',
    errorPlacement: function(error, element) {
        if(element.parent('.input-group').length) {
            error.insertAfter(element.parent());
        } else {
            error.insertAfter(element);
        }
    }
	});

	$(document).ready(function() {

		$("#FormularioAdicionaFuncionario").validate({
			rules: {
				'funcionario.nome': {
					required: true,
					minlength: 2,
					maxlength: 100
				},
			},
			
			messages: {
				'funcionario.nome': "O nome é necessário",
			} 

			
		});

		$("#Ramal").mask('9999');
		$("#Telefone").mask('(99)9999-9999?9');
		$("#Celular").mask('(99)9999-9999?9');
		$("#Celular2").mask('(99)9999-9999?9');
		
	}); 

	

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
<input type="text" name="funcionario.nome" class="form-control" id="Nome">
</div>
</div>


<div class="form-group">
<label for="Ramal" class="col-sm-2 control-label">Ramal</label>
<div class="col-sm-10">
<input type="text" name="funcionario.ramal" class="form-control" id="Ramal"></div>
</div>


<div class="form-group">
<label for="Telefone" class="col-sm-2 control-label">Telefone</label>
<div class="col-sm-10">
<input type="text" name="funcionario.telefone" class="form-control" id="Telefone"></div>
</div>


<div class="form-group">
<label for="Celular" class="col-sm-2 control-label">Celular</label>
<div class="col-sm-10">
<input type="text" name="funcionario.celular" class="form-control" id="Celular"></div>
</div>


<div class="form-group">
<label for="Celular2" class="col-sm-2 control-label">Celular 2</label>
<div class="col-sm-10">
<input type="text" name="funcionario.celularOutro" class="form-control" id="Celular2"></div>
</div>


<div class="form-group">
<label for="Email" class="col-sm-2 control-label">Email</label>
<div class="col-sm-10">
<input type="text" name="funcionario.email" class="form-control" id="Email"></div>
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
<input type="text" name="funcionario.funcao" class="form-control" id="Funcao"></div>
</div>


<div class="form-group">
<label for="Observacoes" class="col-sm-2 control-label">Observações</label>
<div class="col-sm-10">
<textarea name="funcionario.observacoes" class="form-control" id="Observacoes"></textarea>
</div>
</div>

<div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">Enviar</button>
      
    </div>
  </div>
</form>
</div>
</body>
</html>