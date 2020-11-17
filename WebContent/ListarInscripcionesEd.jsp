<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="publicadores.ControladorCursoPublish"%>
<%@page import="publicadores.ControladorCursoPublishService"%>
<%@page import="publicadores.ControladorCursoPublishServiceLocator"%>
<%@page import="publicadores.DtInscripcionEd"%>
<%@page import="publicadores.EstadoInscripcion"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="header.jsp"%>
<title>Listar aceptados inscripción a edición</title>
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
<form>
		<div class="card">
			<div class="card-header">
				<h5>Inscripciones aceptadas a la edición: <b><%=nombreEdicion%></b></h5>
			</div>
			<div class="card-body">
			<div class="card">
			<table class="table">
  			<thead class="thead-light">
    			<tr>
      				<th scope="col">Nikcname</th>
      				<th scope="col">Fecha inscripción</th>
    			</tr>
  			</thead>
  			<tbody>
    			<%
    				for(int i = 0; i < inscripciones.length; i++){
    					LocalDate fechaLocalDate = LocalDateTime.ofInstant(inscripciones[i].getFecha().toInstant(), inscripciones[i].getFecha().getTimeZone().toZoneId()).toLocalDate();
    					
    					
    			%>
    			<tr>
      					<%if(inscripciones[i].getEstado().equals(EstadoInscripcion.Aceptado)||inscripciones[i].getEstado().equals(EstadoInscripcion.Inscripto)||inscripciones[i].getEstado().equals(EstadoInscripcion.Rechazado)){ %>
      						<th scope="row"><%=inscripciones[i].getNicknameEstudiante()%></th>
      						<td><%=fechaLocalDate%></td>
      						<td><%=inscripciones[i].getEstado()%></td>
      					<%
      					}
      					%>	
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