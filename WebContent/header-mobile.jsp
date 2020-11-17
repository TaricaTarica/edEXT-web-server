<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="publicadores.ControladorUsuarioPublish"%>
<%@page import="publicadores.ControladorUsuarioPublishService"%>
<%@page import="publicadores.ControladorUsuarioPublishServiceLocator"%>
<%@page import="publicadores.DtUsuario"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

	<!--  jQuery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

	<!-- Isolated Version of Bootstrap, not needed if your site already uses Bootstrap -->
	<link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />

	<!-- Bootstrap Date-Picker Plugin -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

</head>
<body>
<%
	HttpSession sesionMobile = request.getSession();
	if(sesionMobile.getAttribute("usuarioMobile") == null){ 
		response.sendRedirect("http://localhost:8080/edextSW/inicioSesion-mobile.jsp");
	
	}else{
		ControladorUsuarioPublishService cps = new ControladorUsuarioPublishServiceLocator();
		ControladorUsuarioPublish port = cps.getControladorUsuarioPublishPort();
		
		publicadores.DtUsuario usr = (publicadores.DtUsuario) sesionMobile.getAttribute("usuarioMobile");
		if(!port.esEstudiante(usr.getNickname())){
			response.sendRedirect("http://localhost:8080/edextSW/inicioSesion-mobile.jsp");
		}
		else{%>
			<nav class="navbar navbar-expand-sm navbar-light bg-light">
		  		<a class="navbar-brand" href="index-mobile.jsp">edEXT /<%=usr.getNombre()%></a>
		  		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		    		<span class="navbar-toggler-icon"></span>
		  		</button>
		  		<div class="collapse navbar-collapse" id="navbarNav">
		    		<ul class="navbar-nav mr-auto">
		    			<li class="nav-item">
		       				<a class="nav-link" href="VerCurso-mobile.jsp">Ver Cursos</a>
		    			</li>
		    			<li class="nav-item">
		       				<a class="nav-link" href="VerEdicion-mobile.jsp">Ver Ediciones</a>
		    			</li>
		    			<li class="nav-item">
		       				<a class="nav-link" href="CerrarSesion_mobile">Salir</a>
		    			</li>
		    			</ul>
		  		</div>
		</nav>
		<%}
	
	}%>
</body>
</html>