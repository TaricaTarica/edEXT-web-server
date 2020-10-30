<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@page import="interfaces.Fabrica"%>
<%@page import="interfaces.IControladorCurso"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="header.jsp"%>
<title>edext</title>
<style>
 .relative2 {
  position: relative;
  top: -20px;
  left: 20px;
  background-color: white;
  width: 15rem;
}
</style>
</head>
<body>
<div class="card mb-3">
  <img src="imagenes/edextBANER.png" class="card-img-top" alt="banneredEXT">
  <div class="card-body">
    <h5 class="card-title">edEXT</h5>
    <p class="card-text">Aprende y enseña desde la comodidad de tu hogar.</p>
    <%if(sesion.getAttribute("usuario") == null){ %>
    	<a href="inicioSesion.jsp" class="card-link">Iniciar Sesión</a>
    	<a href="Registrarse.jsp" class="card-link">Registrarse</a>
    <%} %>
  </div>
</div>
<br>
<div class = relative2>
<div class="card mb-4">
<div class="card" style="width: 15rem;">
  <div algin="center" class="card-header">
    Institutos
  </div>
  <ul class="list-group list-group-flush">
  	<%Fabrica fab = Fabrica.getInstancia();
  	  IControladorCurso iconCur = fab.getIControladorCurso();
  	  String[] nombreInstitutos = iconCur.listarInstitutos();	
      				
      int i = 0;
      while(i < nombreInstitutos.length){%>
    		<a href="cargarConsultaCurso?exampleRadios=<%="instituto"%>&cb_Instituto=<%=nombreInstitutos[i]%>" class="list-group-item"><%=nombreInstitutos[i]%></a>
    		<%i++;
      }%>
  </ul>
</div>
<br>
<div class="card" style="width: 15rem;">
  <div algin="center" class="card-header">
    Categorías
  </div>
  <ul class="list-group list-group-flush">
  	<%
  	  String[] nombreCategorias = iconCur.listarCategorias();	
      				
      i = 0;
      while(i < nombreCategorias.length){%>
    		<a href="cargarConsultaCurso?exampleRadios=<%="categoria"%>&cb_Categoria=<%=nombreCategorias[i]%>" class="list-group-item"><%=nombreCategorias[i]%></a>
    		<%i++;
      }%>
  </ul>
</div>
</div>
</div>

<%@include file="footer.jsp"%>
</body>
</html>