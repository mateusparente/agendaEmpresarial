<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adiciona novo setor</title>
<script src="<c:url value='/validate/lib/jquery.js'/>"></script>
<script src="<c:url value='/validate/dist/jquery.validate.js'/>"></script>
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

	$().ready(function() {
		$("#FormularioAdicionaSetor").validate({
			rules: {
				'setor.nomeDoSetor': {
					required: true,
					minlength: 2,
					maxlength: 120
				},
				'setor.gestorResponsavel': {
					required: false,
					maxlength: 120
				},
			},
			
			messages: {
				'setor.nomeDoSetor': "O nome do setor é necessário",
				'setor.gestorResponsavel': "Limite excedido"
				
			} 
		});
	}); 

	</script>
</head>
<body>
<h4 style="padding-left: 15px !important">Adicione um novo setor</h4><hr><br/>
<div style="width: 50% !important;">
<form action="<c:url value='/setores'/>" method="POST" class="form-horizontal" role="form" id="FormularioAdicionaSetor">

<div class="form-group">
<label for="nomeSetor" class="col-sm-2 control-label">Nome do Setor</label>
<div class="col-sm-10">
<input type="text" name="setor.nomeDoSetor" class="form-control" id="nomeSetor">
</div>
</div>

<div class="form-group">
<label for="nomeGestor" class="col-sm-2 control-label">Gestor Responsavel</label>
<div class="col-sm-10">
<input type="text" name="setor.gestorResponsavel" class="form-control" id="nomeGestor">
</div>
</div>
	
<div class="form-group">
<div class="col-sm-offset-2 col-sm-10">
<button type="submit" class="btn btn-default">Cadastrar</button>
</div>
</div>
</form>
</div>
</body>
</html>