<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="persistencia.Conexion"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="logica.Curso"%>
<%@page import="javax.persistence.Query"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="interfaces.Fabrica"%>
<%@page import="interfaces.IControladorCurso"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="header.jsp"%>
<title>Búsqueda</title>
</head>
<body>
<br>
<%
	Fabrica fab = Fabrica.getInstancia();
	IControladorCurso iconCur = fab.getIControladorCurso();
	String nombreInstituto = new String();
	String busqueda = request.getParameter("busqueda");
	List<Curso> listCursos = new ArrayList<>();
	if(!busqueda.isEmpty()){
		Conexion conexion = Conexion.getInstancia();
		EntityManager em = conexion.getEntityManager();
		
		Query query = em.createQuery("select c from Curso c where nombre LIKE '%"+busqueda+"%'");
		listCursos = (List<Curso>) query.getResultList();
	}
	else{
		Conexion conexion = Conexion.getInstancia();
		EntityManager em = conexion.getEntityManager();
		
		Query query = em.createQuery("select c from Curso c");
		listCursos = (List<Curso>) query.getResultList();
	}
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
    				for(Curso dtc: listCursos){
    			%>
    			<tr>
      				<th scope="row"><%=dtc.getNombre()%></th>
      					<td><%=dtc.getDescripcion()%></td>
      					<td><span class="badge badge-pill badge-info">Curso</span></td>
      					<%
      						nombreInstituto = iconCur.obtenerInstitutoCurso(dtc.getNombre());
      					%>
      					<td> <a href="infoCurso.jsp?nombreInstituto=<%=nombreInstituto%>&nombreCurso=<%=dtc.getNombre()%>" class="btn btn-primary">Ver información</a></td>
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