<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="interfaces.Fabrica"%>
<%@page import="interfaces.IControladorCurso"%>
<%@page import="datatypes.DtInscripcionEd"%>
<%@page import="datatypes.EstadoInscripcion"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="header.jsp"%>
<title>Listar aceptados inscripción a edición</title>
</head>
<body>
<br>
<div class = container mt-4>
<%	Fabrica fab = Fabrica.getInstancia();
	IControladorCurso iconCur = fab.getIControladorCurso();
	String nombreCurso = request.getParameter("nombreCurso");
	String nombreInstituto = request.getParameter("nombreInstituto");
	String nombreEdicion = request.getParameter("nombreEdicion");
	List<DtInscripcionEd> inscripciones = iconCur.obtenerInscripcionesEd(nombreInstituto, nombreCurso, nombreEdicion);
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
    				for(DtInscripcionEd dtied: inscripciones){
    			%>
    			<tr>
      					<%if(dtied.getEstado().equals(EstadoInscripcion.Aceptado)){ %>
      						<th scope="row"><%=dtied.getNicknameEstudiante()%></th>
      						<td><%=dtied.getFecha()%></td>
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