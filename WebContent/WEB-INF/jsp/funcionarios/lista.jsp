<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Funcionários cadastrados</title>
</head>
<body>
<table class="table table-striped">
	<thead>
		<tr>
			<td><h4>Nome</h4></td>
			<td><h4>Ramal</h4></td>
			<td><h4>Setor</h4></td>
			<td><h4>Funcao</h4></td>
			<td><h4>Opções</h4></td>
		</tr>
	</thead>
	<c:forEach items="${funcionarioList}" var="funcionario">
	
		<tr>
			<td><a href="<c:url value='/buscaFuncionario?nome=${funcionario.nome}'/>">${funcionario.nome }</a></td>
			<td>${funcionario.ramal }</td>
			<td><a href="<c:url value='/buscaFuncionario?setor=${funcionario.setor}'/>">${funcionario.setor }</a></td>
			<td>${funcionario.funcao }</td>
			<c:if test="${usuarioWeb.logado}">
			<td><a href="edita/${funcionario.id}">Editar</a>
				<a href="remove?id=${funcionario.id }">Remover</a>
			</td>
			</c:if>
			<c:if test="${empty usuarioWeb or not usuarioWeb.logado}">
				<td>--</td>
			</c:if>
		</tr>
	
	</c:forEach>
</table>
</body>
</html>