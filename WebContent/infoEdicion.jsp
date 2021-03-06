<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="publicadores.ControladorCursoPublish"%>
<%@page import="publicadores.ControladorCursoPublishService"%>
<%@page import="publicadores.ControladorCursoPublishServiceLocator"%>
<%@page import="publicadores.ControladorUsuarioPublish"%>
<%@page import="publicadores.ControladorUsuarioPublishService"%>
<%@page import="publicadores.ControladorUsuarioPublishServiceLocator"%>
<%@page import="publicadores.DtinfoEdicion"%>
<%@page import="publicadores.DtEdicion"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Calendar"%>


<!DOCTYPE html>
<html>
<head>
<%@include file="header.jsp"%>
<title>Información de Edición de Curso</title>
</head>
<body>
<br>
<div class = container mt-4>
<%
if(request.getParameter ("nombreEdicion") != null){ %>
<%
	String nombreInstituto = request.getParameter ("nombreInstituto");
	String nombreCurso = request.getParameter("nombreCurso");
	String nombreEdicion = request.getParameter("nombreEdicion");
	
	ControladorCursoPublishService cps = new ControladorCursoPublishServiceLocator();
	ControladorCursoPublish port = cps.getControladorCursoPublishPort();
	
	ControladorUsuarioPublishService cpus = new ControladorUsuarioPublishServiceLocator();
	ControladorUsuarioPublish port2 = cpus.getControladorUsuarioPublishPort();
	
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
      	<%
      	if(sesion.getAttribute("usuario") != null){
      		publicadores.DtUsuario usr = (publicadores.DtUsuario) sesion.getAttribute("usuario");
      		if(!port2.esEstudiante(usr.getNickname())){ %>
			<a href="seleccionarEstudianteEd.jsp?nombreInstituto=<%=nombreInstituto%>&nombreCurso=<%=nombreCurso%>&nombreEdicion=<%=nombreEdicion%>" class="btn btn-primary" role="button">Gestionar inscripciones</a>
			<a href="listarAceptadosEd.jsp?nombreInstituto=<%=nombreInstituto%>&nombreCurso=<%=nombreCurso%>&nombreEdicion=<%=nombreEdicion%>" class="btn btn-primary" role="button">Ver inscripciones aceptadas</a>
			<a href="ListarInscripcionesEd.jsp?nombreInstituto=<%=nombreInstituto%>&nombreCurso=<%=nombreCurso%>&nombreEdicion=<%=nombreEdicion%>" class="btn btn-primary" role="button">Ver inscripciones</a>								
		<%}
			} %>
		</div>
    </div>
  </div>
</div>
<%
	String[] docentes = port.listarDocentes(nombreInstituto);
%>
<ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item">
    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Docentes</a>
  </li>
</ul>

<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
  	<div class="card">
  		<% 
  			if(docentes.length == 0){
  		%>
  			<div class="alert alert-primary" role="alert">
  				La edición no tiene <i>Docentes</i> asociados.
			</div>
  		<%
  			}
  			else{
  				for(int i = 0; i<docentes.length; i++){ %>
  					<li class="list-group-item d-flex justify-content-between"><p class="p-0 m-0 flex-grow-1"><%=docentes[i]%></p>
					</li>
		<%		}
  			}
		%>
	</div>
  </div>
</div>
<%
}
if(request.getParameter ("nombreEdicionCat") != null){%>
<%
	String nombreCategoria = request.getParameter ("nombreCategoria");
	String nombreCurso = request.getParameter("nombreCurso");
	String nombreIns = request.getParameter("nombreIns");
	String nombreEdicion = request.getParameter("nombreEdicionCat");
	
	ControladorCursoPublishService cps = new ControladorCursoPublishServiceLocator();
	ControladorCursoPublish port = cps.getControladorCursoPublishPort();
	
	ControladorUsuarioPublishService cpus = new ControladorUsuarioPublishServiceLocator();
	ControladorUsuarioPublish port2 = cpus.getControladorUsuarioPublishPort();
	
	publicadores.DtinfoEdicion infoEdicionCat = port.consultaEdicionCategoria(nombreCategoria, nombreCurso, nombreEdicion);
	
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/LL/yyyy");
	/*CALENDAR TO LOCALDATE*/
	Calendar calendarInicio = infoEdicionCat.getFechaInicio();
	LocalDate fechaLocalDateInicio = LocalDateTime.ofInstant(calendarInicio.toInstant(), calendarInicio.getTimeZone().toZoneId()).toLocalDate();
	Calendar calendarFin = infoEdicionCat.getFechaFin();
	LocalDate fechaLocalDateFin = LocalDateTime.ofInstant(calendarFin.toInstant(), calendarFin.getTimeZone().toZoneId()).toLocalDate();
	Calendar calendarPub= infoEdicionCat.getFechaPub();
	LocalDate fechaLocalDatePub = LocalDateTime.ofInstant(calendarPub.toInstant(), calendarPub.getTimeZone().toZoneId()).toLocalDate();
	/*CALENDAR TO LOCALDATE*/
	String fechaI = fechaLocalDateInicio.format(formatter);
	String fechaF = fechaLocalDateFin.format(formatter);
	String fechaP = fechaLocalDatePub.format(formatter);
	
%>
<div class="card mb-3" >
  <div class="row no-gutters">
    <div class="col-md-4">
      <img src="..." class="card-img" alt="...">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title"><%=infoEdicionCat.getNombre()%></h5>
      </div>
    </div>
  </div>
 </div>
 <div class="card mb-3">
  <div class="row no-gutters">
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title">Información Básica</h5>
      	<p class="card-text"><b>Cupo: </b><%=infoEdicionCat.getCupo()%></p>
      	<p class="card-text"><b>Fecha de inicio: </b><%=fechaI%></p>
      	<p class="card-text"><b>Fecha de fin: </b><%=fechaF%></p>
      	<p class="card-text"><b>Fecha de publicación: </b><%=fechaP%></p>
      	<%
      	if(sesion.getAttribute("usuario") != null){
    		publicadores.DtUsuario usr = (publicadores.DtUsuario) sesion.getAttribute("usuario");
      		if(!port2.esEstudiante(usr.getNickname())){ %>
			<a href="seleccionarEstudianteEd.jsp?nombreInstituto=<%=nombreIns%>&nombreCurso=<%=nombreCurso%>&nombreEdicion=<%=nombreEdicion%>" class="btn btn-primary" role="button">Gestionar inscripciones</a>				
		<%}
			} %>
      	</div>
    </div>
  </div>
</div>
<%
	String[] docentes = port.listarDocentes(nombreIns);
%>
<ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item">
    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="false">Docentes</a>
  </li>
</ul>

<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
  	<div class="card">
  		<% 
  			if(docentes.length == 0){
  		%>
  			<div class="alert alert-primary" role="alert">
  				La edición no tiene <i>Docentes</i> asociados.
			</div>
  		<%
  			}
  			else{
  				for(int i = 0; i<docentes.length; i++){ %>
  					<li class="list-group-item d-flex justify-content-between"><p class="p-0 m-0 flex-grow-1"><%=docentes[i]%></p>
					</li>
		<%		}
  			}
		%>
	</div>
  </div>
</div>
<%} %>
</div>
<%@include file="footer.jsp"%>
</body>
</html>