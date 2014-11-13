<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adiciona novo Funcionario</title>
</head>
<body>
<h4>Adicione um novo Funcionário</h4>
<br/>

<table>
<form action="<c:url value='/funcionarios'/>" method="POST">
<tr><td>Nome</td><td><input type="text" name="funcionario.nome"></td></tr>
<tr><td>Ramal</td><td><input type="text" name="funcionario.ramal"></td></tr>
<tr><td>Telefone</td><td><input type="text" name="funcionario.telefone"></td></tr>
<tr><td>Celular</td><td><input type="text" name="funcionario.celular"></td></tr>
<tr><td>Celular 2</td><td><input type="text" name="funcionario.outroCelular"></td></tr>
<tr><td>Email</td><td><input type="text" name="funcionario.email"></td></tr>
<tr><td>Setor</td>

<td>	
<select name="funcionario.setor">

<c:forEach items="${setores}" var="setor">
	<option value="${setor.nomeDoSetor}">${setor.nomeDoSetor }</option>
</c:forEach>
</select>
</td></tr>


<tr><td>Função</td><td><input type="text" name="funcionario.funcao"></td></tr>
<tr><td>Observações</td><td><input type="text" name="funcionario.observacoes"></td></tr>
<tr><td><input type="submit"></td></tr>
</form>
</table>
</body>
</html>