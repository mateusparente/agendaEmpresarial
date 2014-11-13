<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adiciona novo setor</title>
</head>
<body>
<h4>Adicione um novo setor</h4><br/>
<table>
<form action="<c:url value='/setores'/>" method="POST">
	<tr>  <td>Nome do Setor</td>   <td><input type="text" name="setor.nomeDoSetor"></td>  </tr>
	<tr>  <td>Gestor Responsavel</td>   <td><input type="text" name="setor.gestorResponsavel"></td>  </tr>
	
	<tr><td><input type="submit" value="Cadastrar"></td></tr>
</form>
</table>
</body>
</html>