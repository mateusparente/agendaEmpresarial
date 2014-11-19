<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
	$.validator.setDefaults({
		submitHandler: function() {
			alert("submitted!");
		}
	});

	$("#usuariosForm").$.validate();
</script>
</head>
<body>
<div style="width: 30% !important;">
<form id="usuariosForm" action="<c:url value='/usuarios'/>" method="POST">
    <legend><h4 style="padding-left: 15px !important">Criar novo usuário</h4></legend>
        
    <div class="form-group">    
    <label for="nome" class="col-sm-2 control-label">Nome:</label>
    <div class="col-sm-10"><input id="nome" type="text" name="usuario.nome" value="${usuario.nome }" class="form-control" required/></div>
	</div>
	
	<div class="form-group">
    <label for="login" class="col-sm-2 control-label">Login:</label>
    <div class="col-sm-10"><input id="login" type="text" name="usuario.login" value="${usuario.login }" class="form-control" required/></div>
	</div>

    <div class="form-group">
    <label for="senha" class="col-sm-2 control-label">Senha:</label>
    <div class="col-sm-10"><input id="senha" type="password" name="usuario.senha" class="form-control" required/></div>
	</div>
	
	<div class="form-group">
    <label for="confirmacao" class="col-sm-2 control-label">Confirme a senha:</label>
    <div class="col-sm-10"><input id="confirmacao" equalTo="#senha" type="password" class="form-control" required/></div>
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