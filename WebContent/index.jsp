<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@page import="interfaces.Fabrica"%>
<%@page import="interfaces.IControladorCurso"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="header.jsp"%>
<title>edext</title>
</head>
<body>
<div class="card mb-3">
  <img src="imagenes/edextBANER.png" class="card-img-top" alt="banneredEXT">
  <div class="card-body">
    <h5 class="card-title">edEXT</h5>
    <p class="card-text">Aprende y enseña desde la comodidad de tu hogar.</p>
    <%if(sesion.getAttribute("usuario") == null){ %>
    	<a href="inicioSesion.jsp" class="card-link">Inicia Sesion</a>
    	<a href="Registrarse.jsp" class="card-link">Registrarse</a>
    <%} %>
  </div>
</div>
<div class="card mb-4">
<div class="card border-secondary" style="width: 15rem;">
  <div algin="center" class="card-header">
    Institutos
  </div>
  <ul class="list-group list-group-flush text-info">
  	<%Fabrica fab = Fabrica.getInstancia();
  	  IControladorCurso iconCur = fab.getIControladorCurso();
  	  String[] nombreInstitutos = iconCur.listarInstitutos();	
      				
      int i = 0;
      while(i < nombreInstitutos.length){%>
    		<li class="list-group-item"><%=nombreInstitutos[i]%></li>
    		<%i++;
      }%>
  </ul>
</div>
<br>
<div class="card border-secondary" style="width: 15rem;">
  <div algin="center" class="card-header">
    Categorias
  </div>
  <ul class="list-group list-group-flush text-info">
  	<%
  	  String[] nombreCategorias = iconCur.listarCategorias();	
      				
      i = 0;
      while(i < nombreCategorias.length){%>
    		<li class="list-group-item"><%=nombreCategorias[i]%></li>
    		<%i++;
      }%>
  </ul>
</div>
</div>

<%@include file="footer.jsp"%>
</body>
</html>