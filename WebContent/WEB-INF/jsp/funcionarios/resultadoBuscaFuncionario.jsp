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
<h4 style="padding-left: 15px !important;">Resultado da busca: ${nome}${setor}</h4><br/>
<table class="table table-hover">
	<thead>
		<tr bgcolor="#EBEAEA">
			<td>Nome</td>
			<td>Ramal</td>
			<td>Telefone</td>
			<td>Celular</td>
			<td>Celular 2</td>
			<td>Email</td>
			<td>Setor</td>
			<td>Funcao</td>
			<td>Observacoes</td>
			<td>Opções</td>
		</tr>
	</thead>
	<tbody>
	<c:choose>

	<c:when test="${funcionarioList == null}">
		<div class="container"><h3>Nada foi encontrado</h3></div>
	</c:when>
	
	
	<c:otherwise>
	<c:forEach items="${funcionarioList}" var="funcionario">
		<tr>
			<td>${funcionario.nome }</td>
			<td>${funcionario.ramal }</td>
			<td>${funcionario.telefone }</td>
			<td>${funcionario.celular }</td>
			<td>${funcionario.celularOutro }</td>
			<td>${funcionario.email }</td>
			<td>${funcionario.setor }</td>
			<td>${funcionario.funcao }</td>
			<td width="10%">${funcionario.observacoes }</td>
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
	</c:otherwise>
	
	</c:choose>
	
	</tbody>

</table>

</body>
</html>