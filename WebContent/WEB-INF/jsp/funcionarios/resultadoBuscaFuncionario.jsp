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
<h4>Resultado da busca: ${nome}${setor}</h4><br/>
<table border="1" cellpadding="5" cellspacing="0" class="table table-striped">
	<thead>
		<tr bgcolor="c0c0c0">
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
	<c:forEach items="${funcionarioList}" var="funcionario">
	<tbody>
		<tr>
			<td>${funcionario.nome }</td>
			<td>${funcionario.ramal }</td>
			<td>${funcionario.telefone }</td>
			<td>${funcionario.celular }</td>
			<td>${funcionario.celularOutro }</td>
			<td>${funcionario.email }</td>
			<td>${funcionario.setor }</td>
			<td>${funcionario.funcao }</td>
			<td>${funcionario.observacoes }</td>
			<td><a href="edita/${funcionario.id}">Editar</a>
				<a href="remove?id=${funcionario.id }">Remover</a>
			</td>
		</tr>
	</tbody>
	</c:forEach>
</table>

</body>
</html>