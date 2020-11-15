
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="javax.persistence.EntityManager"%>
<%@page import="publicadores.ControladorCursoPublish"%>
<%@page import="publicadores.ControladorCursoPublishService"%>
<%@page import="publicadores.ControladorCursoPublishServiceLocator"%>
<%@page import="javax.persistence.Query"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="publicadores.DtCurso"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="header.jsp"%>
<title>Búsqueda</title>
</head>
<body>
<br>
<%
	ControladorCursoPublishService cps = new ControladorCursoPublishServiceLocator();
	ControladorCursoPublish port = cps.getControladorCursoPublishPort();
	String nombreInstituto = new String();
	String busqueda = request.getParameter("busqueda");
	System.out.println(busqueda);
	DtCurso[] listCursos = port.busquedaCurso(busqueda);
	
%>
<div class = container mt-4>
	<div class="card">
		<table class="table">
  			<thead class="thead-light">
    			<tr>
      				<th scope="col">Nombre</th>
      				<th scope="col">Descripción</th>
      				<th scope="col">Tipo</th>
      				<th scope="col">Acciones</th>
    			</tr>
  			</thead>
  			<tbody>
    			<%
    				for(int i = 0; i < listCursos.length; i++){
    			%>
    			<tr>
      				<th scope="row"><%=listCursos[i].getNombre()%></th>
      					<td><%=listCursos[i].getDescripcion()%></td>
      					<td><span class="badge badge-pill badge-info">Curso</span></td>
      					<%
      						nombreInstituto = port.obtenerInstitutoCurso(listCursos[i].getNombre());
      					%>
      					<td> <a href="infoCurso.jsp?nombreInstituto=<%=nombreInstituto%>&nombreCurso=<%=listCursos[i].getNombre()%>" class="btn btn-primary">Ver información</a></td>
    			</tr>
    			<%
    				}
    			%>
    			
  			</tbody>
		</table>
	</div>
</div>
</body>
</html>