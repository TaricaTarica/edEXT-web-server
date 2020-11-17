<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="publicadores.ControladorCursoPublish"%>
<%@page import="publicadores.ControladorCursoPublishService"%>
<%@page import="publicadores.ControladorCursoPublishServiceLocator"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="header-mobile.jsp"%>
<title>InfoCurso-mobile</title>
</head>
<body>
<br>
<div class = "container mt-4">
	 <%
	 	String nombreCurso = request.getParameter("nombreCurso");
		
		ControladorCursoPublishService cps = new ControladorCursoPublishServiceLocator();
		ControladorCursoPublish port = cps.getControladorCursoPublishPort();
		
		String nombreInstituto = port.obtenerInstitutoCurso(nombreCurso);
		
		publicadores.DtCursoInfo infoCurso = port.consultaCurso(nombreInstituto, nombreCurso);
		/*ESTE MAMOTRETO ES PARA QUE LA FECHA SE VEA BIEN*/
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/LL/yyyy");
		Calendar calendar = infoCurso.getFechaAlta();
		LocalDate fechaLocalDate = LocalDateTime.ofInstant(calendar.toInstant(), calendar.getTimeZone().toZoneId()).toLocalDate();
		
		String fecha = fechaLocalDate.format(formatter); 
		
		String[] programas = port.listarProgramasAux(nombreInstituto, nombreCurso);
		String[] ediciones = port.listarEdiciones(nombreInstituto, nombreCurso);
		String[] categorias = port.listarCategoriasC(nombreInstituto, nombreCurso);
		String[] previas = port.listarPrevias(nombreInstituto, nombreCurso);
	
		%>
		<div class="card mb-3" >
		  <div class="row no-gutters">
		    <div class="col-md-4">
		      <img src="imagenes/imgCursos/<%=infoCurso.getNombre()%>.jpg" class="card-img" alt="imgenCurso">
		    </div>
		    <div class="col-md-8">
		      <div class="card-body">
		        <h5 class="card-title"><%=infoCurso.getNombre()%></h5>
		        <p class="card-text"><%=infoCurso.getDescripcion() %></p>
		      </div>
		    </div>
		  </div>
		 </div>
		 <div class="card mb-3">
		  <div class="row no-gutters">
		    <div class="col-md-8">
		      <div class="card-body">
		        <h5 class="card-title">Información Básica</h5>
		      	<p class="card-text"><b>Instituto: </b><%=nombreInstituto%></p>
		      	<p class="card-text"><b>Duración: </b><%=infoCurso.getDuracion()%></p>
		      	<p class="card-text"><b>Cantidad de horas: </b><%=infoCurso.getCantHoras()%></p>
		      	<p class="card-text"><b>Créditos: </b><%=infoCurso.getCreditos()%></p>
		      	<p class="card-text"><b>Fecha de alta: </b><%=fecha%></p>
		      	<p class="card-text"><b>URL: </b><%=infoCurso.getUrl()%></p>
		      	</div>
		      	<div class="card-body">
		        <h5 class="card-title">Ediciones</h5>
		      		<div class="list-group">
		      			<%for(int i = 0; i < ediciones.length; i++){ %>
						  <a href="infoEdicion_mobile.jsp?nombreInstituto=<%=nombreInstituto%>&nombreCurso=<%=nombreCurso%>&nombreEdicion=<%=ediciones[i]%>" class="list-group-item list-group-item-action"><%=ediciones[i]%></a>
						<%}%>
					</div>
		      	</div>
		      	<div class="card-body">
		        <h5 class="card-title">Programas</h5>
		      		<ul class="list-group list-group-flush">
		      			<%for(int i = 0; i < programas.length; i++){ %>
						  <li class="list-group-item"><%=programas[i]%></li> 
						<%}%>
					</ul>
		      	</div>
		      	<div class="card-body">
		        <h5 class="card-title">Previas</h5>
		      		<ul class="list-group list-group-flush">
		      			<%for(int i = 0; i < previas.length; i++){ %>
						  <li class="list-group-item"><%=previas[i]%></li> 
						<%}%>
					</ul>
		      	</div>
		      	<div class="card-body">
		        <h5 class="card-title">Categorias</h5>
		      		<ul class="list-group list-group-flush">
		      			<%for(int i = 0; i < categorias.length; i++){ %>
						  <li class="list-group-item"><%=categorias[i]%></li> 
						<%}%>
					</ul>
		      	</div>
		    </div>
		  </div>
		</div>
</div>
<%@include file="footer.jsp"%>
</body>
</html>