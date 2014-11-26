<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista de setores</title>
</head>
<body>
<table class="table table-striped">
<thead>
<tr bgcolor="#EBEAEA">
	<td>Setor</td>
	<td>Gestor responsável</td>
	<td>Opções</td>
</tr>
<thead>
<tbody>

	<c:forEach items="${setorList}" var="setor">
	<tr>
		<td><a href="<c:url value='/buscaFuncionario?setor=${setor.nomeDoSetor}'/>">${setor.nomeDoSetor }</a></td>
		<td><a href="<c:url value='/buscaFuncionario?nome=${setor.gestorResponsavel}'/>">${setor.gestorResponsavel }</a></td>
		
		<c:if test="${usuarioWeb.logado}">
			<td><a href="removeSetor?id=${setor.id}">Remover</a></td>
		</c:if>
		<c:if test="${empty usuarioWeb or not usuarioWeb.logado}">
			<td>--</td>
		</c:if>
	</tr>
	</c:forEach>

</tbody>
</table>
</body>
</html>