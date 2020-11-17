<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="publicadores.ControladorCursoPublish"%>
<%@page import="publicadores.ControladorCursoPublishService"%>
<%@page import="publicadores.ControladorCursoPublishServiceLocator"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="header-mobile.jsp"%>
<title>VerCurso-mobile</title>
</head>
<body>
<br>
<div class = "container mt-4">
<div class="btn-group">
  <button class="btn btn-secondary btn-lg dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Institutos
  </button>
  <div class="dropdown-menu">
    <% 
    	ControladorCursoPublishService cps = new ControladorCursoPublishServiceLocator();
		ControladorCursoPublish port = cps.getControladorCursoPublishPort();
      	String[] nombreInstitutos = port.listarInstitutos();	
      	
    	for(int i = 0; i < nombreInstitutos.length; i++){ %>
    		<a class="dropdown-item" href="VerCurso_mobile?nombreInstituto=<%=nombreInstitutos[i]%>"><%=nombreInstitutos[i]%></a>
    	<%}%>	
  </div>
 </div>
 <div class="btn-group">
  <button class="btn btn-secondary btn-lg dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Categorias
  </button>
  <div class="dropdown-menu">
    <%
    	String[] nombreCategorias = port.listarCategorias();
    	for(int i = 0; i < nombreCategorias.length; i++){ %>
    		<a class="dropdown-item" href="VerCurso_mobile?nombreCategoria=<%=nombreCategorias[i]%>"><%=nombreCategorias[i]%></a>
    	<%i++; 
    	}%>	
  </div>
 </div>
 <%if(request.getAttribute("inst-mobile") != null){ %>
 	<br>
	<div class = "container mt-4">
		<div class="list-group">
		<%
			String nombreInstituto = (String) request.getAttribute("inst-mobile"); 
		  	String[] cursos = port.listarCursos(nombreInstituto);
		  	
		  	for(int i = 0; i < cursos.length; i++){%>
		  		<a href="InfoCurso_mobile.jsp?nombreCurso=<%=cursos[i]%>" class="list-group-item list-group-item-action"><%=cursos[i] %></a>
		  	<%} %>
		</div>	
	</div>
 <%}
 if(request.getAttribute("cate-mobile") != null){ %>
 		<br>
		<div class = "container mt-4">
			<div class="list-group">
			<%
				String nombreCategoria = (String) request.getAttribute("cate-mobile"); 
			  	String[] cursos = port.listarCursosCategoria(nombreCategoria);
			  	
			  	for(int i = 0; i < cursos.length; i++){%>
			  		<a href="InfoCurso_mobile.jsp?nombreCurso=<%=cursos[i]%>" class="list-group-item list-group-item-action"><%=cursos[i] %></a>
			  	<%} %>
			</div>	
		</div>
 <%} %>
 </div>
<%@include file="footer.jsp"%>
</body>
</html>