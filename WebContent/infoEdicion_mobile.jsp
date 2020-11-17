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
<title>InfoEdicion_mobile</title>
</head>
<body>
<br>
<div class = "container mt-4">
	 <%
	 	String nombreInstituto = request.getParameter ("nombreInstituto");
		String nombreCurso = request.getParameter("nombreCurso");
		String nombreEdicion = request.getParameter("nombreEdicion");
		
		ControladorCursoPublishService cps = new ControladorCursoPublishServiceLocator();
		ControladorCursoPublish port = cps.getControladorCursoPublishPort();
		
		publicadores.DtinfoEdicion infoEdicion = port.consultaEdicion(nombreInstituto, nombreCurso, nombreEdicion);
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/LL/yyyy");
		/*CALENDAR TO LOCALDATE*/
		Calendar calendarInicio = infoEdicion.getFechaInicio();
		LocalDate fechaLocalDateInicio = LocalDateTime.ofInstant(calendarInicio.toInstant(), calendarInicio.getTimeZone().toZoneId()).toLocalDate();
		Calendar calendarFin = infoEdicion.getFechaFin();
		LocalDate fechaLocalDateFin = LocalDateTime.ofInstant(calendarFin.toInstant(), calendarFin.getTimeZone().toZoneId()).toLocalDate();
		Calendar calendarPub= infoEdicion.getFechaPub();
		LocalDate fechaLocalDatePub = LocalDateTime.ofInstant(calendarPub.toInstant(), calendarPub.getTimeZone().toZoneId()).toLocalDate();
		/*CALENDAR TO LOCALDATE*/
		String fechaI = fechaLocalDateInicio.format(formatter);
		String fechaF = fechaLocalDateFin.format(formatter);
		String fechaP = fechaLocalDatePub.format(formatter);
		
		String[] docentes = port.listarDocentes(nombreInstituto);
	
		%>
		<div class="card mb-3" >
		  <div class="row no-gutters">
		    <div class="col-md-4">
		      <img src="..." class="card-img" alt="...">
		    </div>
		    <div class="col-md-8">
		      <div class="card-body">
		        <h5 class="card-title"><%=infoEdicion.getNombre()%></h5>
		      </div>
		    </div>
		  </div>
		 </div>
		 <div class="card mb-3">
		  <div class="row no-gutters">
		    <div class="col-md-8">
		      <div class="card-body">
		        <h5 class="card-title">Información Básica</h5>
      			<p class="card-text"><b>Cupo: </b><%=infoEdicion.getCupo()%></p>
      			<p class="card-text"><b>Fecha de inicio: </b><%=fechaI%></p>
      			<p class="card-text"><b>Fecha de fin: </b><%=fechaF%></p>
      			<p class="card-text"><b>Fecha de publicación: </b><%=fechaP%></p>
		      </div>
		      	<div class="card-body">
		        <h5 class="card-title">Docentes</h5>
		      		<ul class="list-group list-group-flush">
		      			<%for(int i = 0; i < docentes.length; i++){ %>
						  <li class="list-group-item"><%=docentes[i]%></li> 
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