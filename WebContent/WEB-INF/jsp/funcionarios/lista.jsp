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
<table border="1" cellpadding="5" cellspacing="0">
	<thead>
		<tr bgcolor="c0c0c0">
			<td>Nome</td>
			<td>Ramal</td>
			<td>Setor</td>
			<td>Funcao</td>
			<td>Opções</td>
		</tr>
	</thead>
	<c:forEach items="${funcionarioList}" var="funcionario">
	<tbody>
		<tr>
			<td><a href="<c:url value='/buscaFuncionario?nome=${funcionario.nome}'/>">${funcionario.nome }</a></td>
			<td>${funcionario.ramal }</td>
			<td>${funcionario.setor }</td>
			<td>${funcionario.funcao }</td>
			<td><a href="edita/${funcionario.id}">Editar</a>
				<a href="remove?id=${funcionario.id }">Remover</a>
			</td>
		</tr>
	</tbody>
	</c:forEach>
</table>
</body>
</html>