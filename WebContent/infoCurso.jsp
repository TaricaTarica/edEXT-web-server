<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="interfaces.Fabrica"%>
<%@page import="interfaces.IControladorCurso"%>
<%@page import="datatypes.DtCursoInfo"%>
<%@page import="java.time.format.DateTimeFormatter"%>

<!DOCTYPE html>
<html>
<head>
<%@include file="header.jsp"%>
<title>Información de Curso</title>
</head>
<body>
<br>
<%
if(request.getParameter ("nombreInstituto") != null){ %>
<%
	String nombreInstituto = request.getParameter ("nombreInstituto");
	String nombreCurso = request.getParameter("nombreCurso");
	
	Fabrica fab = Fabrica.getInstancia();
	IControladorCurso iconCur = fab.getIControladorCurso();
	
	DtCursoInfo infoCurso = iconCur.ConsultaCurso(nombreInstituto, nombreCurso);
	
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd LLLL yyyy");
	String fecha = infoCurso.getFechaAlta().format(formatter);
%>
<div class="card mb-3" >
  <div class="row no-gutters">
    <div class="col-md-4">
      <img src="<%=infoCurso.getImg()%>" class="card-img" alt="imgenCurso">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title"><%=infoCurso.getNombre()%></h5>
        <p class="card-text"><%=infoCurso.getDescripcion() %></p>
      </div>
    </div>
  </div>
 </div>
 <div class="card mb-3">
  <div class="row no-gutters">
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title">Información Básica</h5>
      	<p class="card-text"><b>Cantidad de horas: </b><%=infoCurso.getCantHoras()%></p>
      	<p class="card-text"><b>Créditos: </b><%=infoCurso.getCreditos()%></p>
      	<p class="card-text"><b>Fecha Alta: </b><%=fecha%></p>
      	<p class="card-text"><b>URL: </b><%=infoCurso.getUrl()%></p>
      	</div>
    </div>
  </div>
</div>
<%
	String[] programas = iconCur.listarProgramasAux(nombreInstituto, nombreCurso);
%>

 
<div class="card">
  <div class="card-header">
    <h5> Programas de Formación</h5>
  </div>
  <div class="card-body">
  	<%for(int i = 0; i<programas.length; i++){ %>
  		<div class="list-group">
  		<a href="index.jsp" class="list-group-item list-group-item-action"><%=programas[i]%></a>	
		</div>
	<%}%>
  </div>
</div>
<%
	String[] ediciones = iconCur.listarEdiciones(nombreInstituto, nombreCurso);
%>

<div class="card">
  <div class="card-header">
    <h5>Ediciones</h5>
  </div>
  <div class="card-body">
  	<%for(int i = 0; i<ediciones.length; i++){ %>
    <div class="list-group">
  		<a href="#" class="list-group-item list-group-item-action"><%=ediciones[i]%> </a>	
	</div>
	<%}%>
  </div>
</div>
<%
}
if(request.getParameter ("nombreCategoria") != null){%>
	<%
	String nombreCategoria = request.getParameter ("nombreCategoria");
	String nombreCurso = request.getParameter("nombreCurso");
	
	Fabrica fab = Fabrica.getInstancia();
	IControladorCurso iconCur = fab.getIControladorCurso();
	
	DtCursoInfo infoCurso = iconCur.ConsultaCursoCategoria(nombreCategoria, nombreCurso);
	
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd LLLL yyyy");
	String fecha = infoCurso.getFechaAlta().format(formatter);
	
	String nombreInstituto = iconCur.obtenerInstitutoCurso(nombreCurso);
%>
<div class="card mb-3" >
  <div class="row no-gutters">
    <div class="col-md-4">
      <img src="<%=infoCurso.getImg()%>" class="card-img" alt="imgenCurso">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title"><%=infoCurso.getNombre()%></h5>
        <p class="card-text"><%=infoCurso.getDescripcion() %></p>
      </div>
    </div>
  </div>
 </div>
 <div class="card mb-3">
  <div class="row no-gutters">
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title">Información Básica</h5>
      	<p class="card-text"><b>Cantidad de horas: </b><%=infoCurso.getCantHoras()%></p>
      	<p class="card-text"><b>Créditos: </b><%=infoCurso.getCreditos()%></p>
      	<p class="card-text"><b>Fecha Alta: </b><%=fecha%></p>
      	<p class="card-text"><b>URL: </b><%=infoCurso.getUrl()%></p>
      	</div>
    </div>
  </div>
</div>
<%
	String[] programas = iconCur.listarProgramasAux(nombreInstituto, nombreCurso);
%>

 
<div class="card">
  <div class="card-header">
    <h5> Programas de Formación</h5>
  </div>
  <div class="card-body">
  	<%for(int i = 0; i<programas.length; i++){ %>
  		<div class="list-group">
  		<a href="index.jsp" class="list-group-item list-group-item-action"><%=programas[i]%></a>	
		</div>
	<%}%>
  </div>
</div>
<%
	String[] ediciones = iconCur.listarEdiciones(nombreInstituto, nombreCurso);
%>

<div class="card">
  <div class="card-header">
    <h5>Ediciones</h5>
  </div>
  <div class="card-body">
  	<%for(int i = 0; i<ediciones.length; i++){ %>
    <div class="list-group">
  		<a href="#" class="list-group-item list-group-item-action"><%=ediciones[i]%> </a>	
	</div>
	<%}%>
  </div>
</div>



<%} %>
<%@include file="footer.jsp"%>
</body>
</html>