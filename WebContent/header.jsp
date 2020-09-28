<%@page import="interfaces.Fabrica"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@page import="datatypes.DtUsuario"%>
<%@page import="datatypes.DtEstudiante"%>
<%@page import="interfaces.Fabrica"%>
<%@page import="interfaces.IControladorUsuario"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
<body>
<%
	HttpSession sesion = request.getSession();
	//if(sesion.isNew()){
	//	sesion.setAttribute("usuario", "visitante");
	//}*
	
	if(sesion.getAttribute("usuario") == null){%>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
  			<a class="navbar-brand" href="index.jsp">edEXT /Visitante</a>
  			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    			<span class="navbar-toggler-icon"></span>
  			</button>
  			<div class="collapse navbar-collapse" id="navbarNav">
    			<ul class="navbar-nav">
      				<li class="nav-item">
        				<a class="nav-link" href="index.jsp">Home</a>
      				</li>
      				<li class="nav-item">
        				<a class="nav-link" href="Registrarse.jsp">Registrarse</a>
      				</li>
      				<li class="nav-item">
        				<a class="nav-link" href="inicioSesion.jsp">Iniciar Sesion</a>
      				</li>
    			</ul>
  			</div>
		</nav>
<%} 
	else{ 
		Fabrica fab = Fabrica.getInstancia();
		IControladorUsuario iconUsr = fab.getIControladorUsuario();
		DtUsuario usr = (DtUsuario) sesion.getAttribute("usuario");
		if(iconUsr.esEstudiante(usr.getNickname())){  %>
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
  				<a class="navbar-brand" href="index.jsp">edEXT /<%=usr.getNickname()%></a>
  				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    				<span class="navbar-toggler-icon"></span>
  				</button>
  				<div class="collapse navbar-collapse" id="navbarNav">
    				<ul class="navbar-nav">
      					<li class="nav-item">
        					<a class="nav-link" href="index.jsp">Home</a>
      					</li>
     				 	<li class="nav-item">
        					<a class="nav-link" href="CerrarSesion">Cerrar Sesion</a>
      					</li>
    				</ul>
  				</div>
			</nav>
<%	}
		else{ %>
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
  				<a class="navbar-brand" href="index.jsp">edEXT /<%=usr.getNickname()%></a>
  				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
   					 <span class="navbar-toggler-icon"></span>
  				</button>
  				<div class="collapse navbar-collapse" id="navbarNav">
    				<ul class="navbar-nav">
      					<li class="nav-item">
        					<a class="nav-link" href="index.jsp">Home</a>
      					</li>
      					<li class="nav-item">
        					<a class="nav-link" href="altaCurso.jsp">Alta de Curso</a>
      					</li>
      					<li class="nav-item">
        					<a class="nav-link" href="CerrarSesion">Cerrar Sesion</a>
      					</li>
    				</ul>
  				</div>
			</nav>		
  <% 
		}
  }%>
</body>
</html>