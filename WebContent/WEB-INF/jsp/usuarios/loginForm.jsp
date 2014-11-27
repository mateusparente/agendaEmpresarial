<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h4 style="padding-left: 15px !important">Efetue o login</h4>
<hr>
<div class="container">

<form action="<c:url value='/login'/>" method="POST" class="form-horizontal" role="form">
    
    <div class="form-group">
    <label for="login" class="col-md-4">Login:</label>
    <div class="col-sm-10"><input id="login" type="text" name="usuario.login" class="form-control" autofocus/></div>
    </div>

    <div class="form-group">
    <label for="senha" class="col-md-4">Senha:</label>
    <div class="col-sm-10"><input id="senha" type="password" name="usuario.senha" class="form-control"/></div>
    </div>

    <div class="form-group">
	<div class="col-md-4">
	<button type="submit" class="btn btn-primary">Logar</button>
	</div>
	</div>

</form>
</div>


</body>
</html>