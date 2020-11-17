<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="publicadores.ControladorCursoPublish"%>
<%@page import="publicadores.ControladorCursoPublishService"%>
<%@page import="publicadores.ControladorCursoPublishServiceLocator"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="header-mobile.jsp"%>
<title>Insert title here</title>
</head>
<body>
<%
   
   if(sesionMobile.getAttribute("usuarioMobile") != null){ 
	   	ControladorUsuarioPublishService cps = new ControladorUsuarioPublishServiceLocator();
		ControladorUsuarioPublish port = cps.getControladorUsuarioPublishPort();
		publicadores.DtUsuario usr = (publicadores.DtUsuario) sesionMobile.getAttribute("usuarioMobile");
	   
%>
		<div class="card mb-3">
		  <img src="imagenes/edextBANER.png" class="card-img-top" alt="banneredEXT">
		  <div class="card-body">
		    <h5 class="card-title">edEXT</h5>
		    <p class="card-text"><%=usr.getNombre()%>, bienvenide a la plataforma mobile!</p>
		  </div>
		</div>
<%}else{ %>
	
<%} %>
<%@include file="footer.jsp"%>
</body>
</html>