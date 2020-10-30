<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="interfaces.Fabrica"%>
<%@page import="interfaces.IControladorCurso"%>

<!DOCTYPE html>
<html>
<head>
<%@include file="header.jsp"%>
<title>Inscribirse a Edición</title>
</head>
<body>
<br>
<div class = container mt-4>
<%
	Fabrica fab = Fabrica.getInstancia();
	IControladorCurso iconCur = fab.getIControladorCurso();
	String nombreCurso = request.getParameter ("nombreCurso");
	String nombreInstituto = iconCur.obtenerInstitutoCurso(nombreCurso);
	String[] ediciones = iconCur.listarEdiciones(nombreInstituto, nombreCurso);
	DtUsuario usr = (DtUsuario) sesion.getAttribute("usuario");
	String nicknameEstudiante = usr.getNickname();
%>

<%if(ediciones.length == 0){%>
	<div class="alert alert-primary" role="alert">
  		El curso no posee ediciones vigentes. <a href="index.jsp" class="alert-link">Volver a inicio</a>.
	</div>	
<%}%>
	<form>
		<div class="card">
			<div class="card-header">
				<h5>Ediciones vigentes del curso: <b><%=nombreCurso%></b></h5>
			</div>
			<div class="card-body">
				<div class="list-group">
				<%
					for(int i = 0; i<ediciones.length; i++){
				%>
					<li class="list-group-item d-flex justify-content-between"><p class="p-0 m-0 flex-grow-1"><%=ediciones[i]%></p> 
                   		<a href="inscripcionEd?nombreInstituto=<%=nombreInstituto%>&nombreCurso=<%=nombreCurso%>&nombreEdicion=<%=ediciones[i]%>" class="btn btn-success">Inscribirse</a>
                	</li>
				<% 
					}
				%>
				</div>
			</div>
		</div>
	</form>
	
  <%if(request.getAttribute("error") != null){%>
  <div class="alert alert-danger">${error}</div>
  <%}%>	
	
</div>
<%@include file="footer.jsp"%>
</body>
</html>