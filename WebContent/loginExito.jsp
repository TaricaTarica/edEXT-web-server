<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@page import="datatypes.DtUsuario"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="header.jsp"%>
<title>Login exitoso</title>
</head>
<body>
<br>
<div class = container mt-4>
	<div class="alert alert-success" role="alert">
  		<h4 class="alert-heading">¡Inicio de sesion exitoso!</h4>
  			<%
  			DtUsuario usr = (DtUsuario) sesion.getAttribute("usuario");
  			%>
  			<p>Hola <%=usr.getNombre()%>, bienvenide a edEXT.</p>
	</div>
</div>
<%@include file="footer.jsp"%>
</body>
</html>