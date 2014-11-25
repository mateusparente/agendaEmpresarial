<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="<c:url value='/validate/lib/jquery.js'/>"></script>
<script src="<c:url value='/validate/dist/jquery.validate.js'/>"></script>
<script type="text/javascript">
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
	$("#usuariosForm").validate({
		rules: {
			'usuario.nome': {
				required: true,
				minlength: 2,
				maxlength: 100
			},
			'usuario.login': {
				required: true,
				maxlength: 100,
				minlength: 4,
			},
			'usuario.senha':{
				required:true,
				maxlength:100,
				minlength:4,
			}
		},
		
		messages: {
			'usuario.nome': {
				required: "O nome do usuário é necessário",
				minlength: "Nome de usuário precisa ter no mínimo 2 caracteres",
				maxlength: "Limite de caracteres excedido",
			},
			'usuario.login': {
				required: "O login é necessário",
				minlength: "Login precisa ter no mínimo 4 caracteres",
				maxlength: "Limite de caracteres excedido",
			},'usuario.senha': {
				required: "Uma senha é necessária",
				minlength: "A senha precisa ter no mínimo 4 caracteres",
				maxlength: "Limite de caracteres excedido",
			},
			
		} 
	});
}); 

</script>
</head>
<body>
<div style="width: 30% !important;">
<form id="usuariosForm" action="<c:url value='/usuarios'/>" method="POST" class="form-horizontal" role="form">
    <legend><h4 style="padding-left: 15px !important">Criar novo usuário</h4></legend>
        
    <div class="form-group">    
    <label for="nome" class="col-sm-2 control-label">Nome:</label>
    <div class="col-sm-10"><input id="nome" type="text" name="usuario.nome" value="${usuario.nome }" class="form-control"/></div>
	</div>
	
	<div class="form-group">
    <label for="login" class="col-sm-2 control-label">Login:</label>
    <div class="col-sm-10"><input id="login" type="text" name="usuario.login" value="${usuario.login }" class="form-control"/></div>
	</div>

    <div class="form-group">
    <label for="senha" class="col-sm-2 control-label">Senha:</label>
    <div class="col-sm-10"><input id="senha" type="password" name="usuario.senha" class="form-control"/></div>
	</div>
	
	<div class="form-group">
    <label for="confirmacao" class="col-sm-2 control-label">Confirme a senha:</label>
    <div class="col-sm-10"><input id="confirmacao" equalTo="#senha" type="password" class="form-control"/></div>
	</div>
	
    <div class="form-group">
	<div class="col-sm-offset-2 col-sm-10">
	<button type="submit" class="btn btn-default">Logar</button>
	<br/>
	</div>
	<c:forEach var="error" items="${errors}">
    	${error.category} - ${error.message}<br />
	</c:forEach>
	</div>
 	
</form>
</div>

</body>
</html>