<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Editando</title>
</head>
<body>

<h4>Editar</h4>
<br/>

<table>
<form action="<c:url value='/altera'/>" method="POST">
<input type="hidden" name="funcionario.id" value="${funcionario.id }"/>	
<tr><td>Nome</td><td><input type="text" name="funcionario.nome" value="${funcionario.nome }"></td></tr>
<tr><td>Ramal</td><td><input type="text" name="funcionario.ramal" value="${funcionario.ramal }"></td></tr>
<tr><td>Telefone</td><td><input type="text" name="funcionario.telefone" value="${funcionario.telefone }"></td></tr>
<tr><td>Celular</td><td><input type="text" name="funcionario.celular" value="${funcionario.celular }"></td></tr>
<tr><td>Celular 2</td><td><input type="text" name="funcionario.outroCelular" value="${funcionario.celularOutro }"></td></tr>
<tr><td>Email</td><td><input type="text" name="funcionario.email" value="${funcionario.email }"></td></tr>
<tr><td>Setor</td>

<td>	
<select name="funcionario.setor">
<c:forEach items="${setores}" var="setor">
	<c:choose>
		<c:when test="${funcionario.setor == setor.nomeDoSetor}">
			<option value="${setor.nomeDoSetor}" selected="selected">${setor.nomeDoSetor}</option>
		</c:when>
		<c:otherwise>
			<option value="${setor.nomeDoSetor}">${setor.nomeDoSetor }</option>
		</c:otherwise>
	</c:choose>
</c:forEach>
</select>
</td></tr>


<tr><td>Função</td><td><input type="text" name="funcionario.funcao" value="${funcionario.funcao }"></td></tr>
<tr><td>Observações</td><td><input type="text" name="funcionario.observacoes" value="${funcionario.observacoes }"></td></tr>
<tr><td><input type="submit" value="Enviar"></td></tr>
</form>
</table>


</body>
</html>