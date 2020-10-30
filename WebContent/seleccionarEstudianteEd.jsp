<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="interfaces.Fabrica"%>
<%@page import="interfaces.IControladorCurso"%>
<%@page import="datatypes.DtInscripcionEd"%>
<%@page import="datatypes.EstadoInscripcion"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>

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
	Fabrica fab = Fabrica.getInstancia();
	IControladorCurso iconCur = fab.getIControladorCurso();
	String nombreCurso = request.getParameter("nombreCurso");
	String nombreInstituto = request.getParameter("nombreInstituto");
	String nombreEdicion = request.getParameter("nombreEdicion");
	
	List<DtInscripcionEd> inscripciones = iconCur.obtenerInscripcionesEd(nombreInstituto, nombreCurso, nombreEdicion);
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
    				for(DtInscripcionEd dtied: inscripciones){
    			%>
    			<tr>
      				<th scope="row"><%=dtied.getNicknameEstudiante()%></th>
      					
      					<%
      					DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/LL/yyyy");
						String fecha = dtied.getFecha().format(formatter);
						%>
      					
      					<td><%=fecha%></td>
      					<%if(dtied.getEstado().equals(EstadoInscripcion.Aceptado)){ %>
      						<td><span class="badge badge-pill badge-success">Aceptado</span></td>
      					<%
      					}
      					else if(dtied.getEstado().equals(EstadoInscripcion.Rechazado)){%>
      						<td><span class="badge badge-pill badge-danger">Rechazado</span></td>
      					<%} 
      					else
      					{%>
      						<td><span class="badge badge-pill badge-warning">Pendiente</span></td>
      					<%}
      					%>
      					<td>
      					 	<a href="seleccionarEstudianteEd?nombreInstituto=<%=nombreInstituto%>&nombreCurso=<%=nombreCurso%>&nombreEdicion=<%=nombreEdicion%>&nicknameEstudiante=<%=dtied.getNicknameEstudiante()%>&estado=<%="aceptar"%>" class="btn btn-info" role="button">Aceptar</a>
      						<a href="seleccionarEstudianteEd?nombreInstituto=<%=nombreInstituto%>&nombreCurso=<%=nombreCurso%>&nombreEdicion=<%=nombreEdicion%>&nicknameEstudiante=<%=dtied.getNicknameEstudiante()%>&estado=<%="rechazar"%>" class="btn btn-danger" role="button">Rechazar</a>
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