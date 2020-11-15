<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Calendar"%>
<%@page import="publicadores.ControladorCursoPublish"%>
<%@page import="publicadores.ControladorCursoPublishService"%>
<%@page import="publicadores.ControladorCursoPublishServiceLocator"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="publicadores.EstadoInscripcion"%>
<%@page import="publicadores.DtInscripcionEd"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="header.jsp"%>
<title>Seleccionar Estudiantes</title>
</head>
<body>
<br>
<div class = container mt-4>
<%
	ControladorCursoPublishService cps = new ControladorCursoPublishServiceLocator();
	ControladorCursoPublish port = cps.getControladorCursoPublishPort();
	String nombreCurso = request.getParameter("nombreCurso");
	String nombreInstituto = request.getParameter("nombreInstituto");
	String nombreEdicion = request.getParameter("nombreEdicion");
	
	DtInscripcionEd[] inscripciones = port.obtenerInscripcionesEd(nombreInstituto, nombreCurso, nombreEdicion);
%>
<%if(request.getAttribute("exito") != null){%>
  <div class="alert alert-info">${exito}</div>
<%}%>
	<form>
		<div class="card">
			<div class="card-header">
				<h5>Inscripciones pendientes a la edición: <b><%=nombreEdicion%></b></h5>
			</div>
			<div class="card-body">
			<div class="card">
			<table class="table">
  			<thead class="thead-light">
    			<tr>
      				<th scope="col">Nikcname</th>
      				<th scope="col">Fecha inscripción</th>
      				<th scope="col">Estado</th>
      				<th scope="col">Acciones</th>
    			</tr>
  			</thead>
  			<tbody>
    			<%
    				for(int i = 0; i < inscripciones.length; i++){
    			%>
    			<tr>
      				<th scope="row"><%=inscripciones[i].getNicknameEstudiante()%></th>
      					
      					<%
      					DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/LL/yyyy");
      					/*CALENDAR TO LOCALDATE*/
      					Calendar calendar = inscripciones[i].getFecha();
      					LocalDate fechaLocalDate = LocalDateTime.ofInstant(calendar.toInstant(), calendar.getTimeZone().toZoneId()).toLocalDate();
      					/*CALENDAR TO LOCALDATE*/
      					String fecha = fechaLocalDate.format(formatter);
						%>
      					
      					<td><%=fecha%></td>
      					<%if(inscripciones[i].getEstado().equals(EstadoInscripcion.Aceptado)){ %>
      						<td><span class="badge badge-pill badge-success">Aceptado</span></td>
      					<%
      					}
      					else if(inscripciones[i].getEstado().equals(EstadoInscripcion.Rechazado)){%>
      						<td><span class="badge badge-pill badge-danger">Rechazado</span></td>
      					<%} 
      					else
      					{%>
      						<td><span class="badge badge-pill badge-warning">Pendiente</span></td>
      					<%}
      					%>
      					<td>
      					 	<a href="seleccionarEstudianteEd?nombreInstituto=<%=nombreInstituto%>&nombreCurso=<%=nombreCurso%>&nombreEdicion=<%=nombreEdicion%>&nicknameEstudiante=<%=inscripciones[i].getNicknameEstudiante()%>&estado=<%="aceptar"%>" class="btn btn-info" role="button">Aceptar</a>
      						<a href="seleccionarEstudianteEd?nombreInstituto=<%=nombreInstituto%>&nombreCurso=<%=nombreCurso%>&nombreEdicion=<%=nombreEdicion%>&nicknameEstudiante=<%=inscripciones[i].getNicknameEstudiante()%>&estado=<%="rechazar"%>" class="btn btn-danger" role="button">Rechazar</a>
      					</td>
    			</tr>
    			<%
    				}
    			%>
    			
  			</tbody>
		</table>
		</div>
			</div>
		</div>
	</form>
</div>
<%@include file="footer.jsp"%>
</body>
</html>