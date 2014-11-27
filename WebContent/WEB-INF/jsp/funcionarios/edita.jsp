<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Editando</title>
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

		$("#FormularioEditaFuncionario").validate({
			rules: {
				'funcionario.nome': {
					required: true,
					minlength: 2,
					maxlength: 100
				},
				'funcionario.email':{
					required: false,
					maxlength: 100,
				},
				'funcionario.funcao':{
					required: false,
					maxlength: 120,
				},
				'funcionario.observacoes':{
					required: false,
					maxlength: 255,
				},
				
			},
			
			messages: {
				'funcionario.nome': "O nome é necessário",
				'funcionario.observacoes': "Limite de tamanho atingido",
				'funcionario.email': "Limite de tamanho atingido"
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

<h4 style="padding-left: 15px;">Editando funcionario</h4><hr>
<c:forEach var="error" items="${errors}">
    <p style="padding-left: 15px !important; color: red"><img src='<c:url value="/imgs/warning.png"/>' style="padding-right: 7px;"><b>${error.category} - ${error.message}</b></p>
</c:forEach>
<br/>
<div class="container">

<form action="<c:url value='/altera'/>" method="POST" id="FormularioEditaFuncionario" class="form-horizontal" role="form">
<input type="hidden" name="funcionario.id" value="${funcionario.id }"/>	
<div class="form-group">
<label for="nome" class="col-sm-2 control-label">Nome</label>
<div class="col-sm-10">
<input type="text" name="funcionario.nome" class="form-control" id="Nome" value="${funcionario.nome}">
</div>
</div>


<div class="form-group">
<label for="Ramal" class="col-sm-2 control-label">Ramal</label>
<div class="col-sm-10">
<input type="text" name="funcionario.ramal" class="form-control" id="Ramal"  value="${funcionario.ramal}"></div>
</div>


<div class="form-group">
<label for="Telefone" class="col-sm-2 control-label">Telefone</label>
<div class="col-sm-10">
<input type="text" name="funcionario.telefone" class="form-control" id="Telefone"  value="${funcionario.telefone}"></div>
</div>


<div class="form-group">
<label for="Celular" class="col-sm-2 control-label">Celular</label>
<div class="col-sm-10">
<input type="text" name="funcionario.celular" class="form-control" id="Celular"  value="${funcionario.celular}"></div>
</div>


<div class="form-group">
<label for="Celular2" class="col-sm-2 control-label">Celular 2</label>
<div class="col-sm-10">
<input type="text" name="funcionario.celularOutro" class="form-control" id="Celular2"  value="${funcionario.celularOutro}"></div>
</div>


<div class="form-group">
<label for="Email" class="col-sm-2 control-label">Email</label>
<div class="col-sm-10">
<input type="text" name="funcionario.email" class="form-control" id="Email"  value="${funcionario.email}"></div>
</div>

<div class="form-group">
<label for="setor" class="col-sm-2 control-label">Setor</label>

<div class="col-sm-10">
<select name="funcionario.setor" class="form-control">
<c:if test="${funcionario.setor=='Não cadastrado'}"><option value="Não cadastrado" selected="selected">Selecione o setor</option></c:if>
<c:forEach items="${setores}" var="setor">
	<c:choose>
		<c:when test="${funcionario.setor == setor.nomeDoSetor}">
			<option value="${setor.nomeDoSetor}" selected="selected">${setor.nomeDoSetor}</option>
		</c:when>
		<c:otherwise>
			<option value="${setor.nomeDoSetor}">${setor.nomeDoSetor }</option>
		</c:otherwise>
	</c:choose>
</c:forEach>

</select>
</div>
</div>


<div class="form-group">
<label for="Funcao" class="col-sm-2 control-label">Funcao</label>
<div class="col-sm-10">
<input type="text" name="funcionario.funcao" class="form-control" id="Funcao" value="${funcionario.funcao}"></div>
</div>


<div class="form-group">
<label for="Observacoes" class="col-sm-2 control-label">Observações</label>
<div class="col-sm-10">
<textarea name="funcionario.observacoes" class="form-control" id="Observacoes">${funcionario.observacoes}</textarea>
</div>
</div>

<div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-primary">Editar</button>
    </div>
  </div>
</form>

</div>

</body>
</html>