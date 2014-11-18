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
</tr>
<thead>
<tbody>

	<c:forEach items="${setorList}" var="setor">
	<tr>
		<td>${setor.nomeDoSetor }</td>
		<td>${setor.gestorResponsavel }</td>
	</tr>
	</c:forEach>

</tbody>
</table>
</body>
</html>