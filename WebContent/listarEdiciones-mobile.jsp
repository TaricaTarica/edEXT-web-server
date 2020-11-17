<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="publicadores.ControladorCursoPublish"%>
<%@page import="publicadores.ControladorCursoPublishService"%>
<%@page import="publicadores.ControladorCursoPublishServiceLocator"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="header-mobile.jsp"%>
<title>ListarEdiciones-mobile</title>
</head>
<body>
<%
	String nombreCurso = request.getParameter("nombreCurso");
	
	ControladorCursoPublishService cps = new ControladorCursoPublishServiceLocator();
	ControladorCursoPublish port = cps.getControladorCursoPublishPort();
	
	String nombreInstituto = port.obtenerInstitutoCurso(nombreCurso);
	
	String[] ediciones = port.listarEdiciones(nombreInstituto, nombreCurso);
%>
<div class = "container mt-4">
	<div class="card">
	  <div class="card-header">
	    Ediciones del curso: <%=nombreCurso%>
	  </div>
	  <div class="card-body">
	   		<div class="list-group">
	   		<%for(int i = 0; i < ediciones.length; i++){ %>
				 <a href="infoEdicion_mobile.jsp?nombreInstituto=<%=nombreInstituto%>&nombreCurso=<%=nombreCurso%>&nombreEdicion=<%=ediciones[i]%>" class="list-group-item list-group-item-action"><%=ediciones[i]%></a>
			<%}%>
			</div>
	  </div>
	</div>
</div>
</body>
</html>