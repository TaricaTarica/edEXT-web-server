<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="interfaces.Fabrica"%>
<%@page import="interfaces.IControladorCurso"%>
<%@page import="datatypes.DtinfoEdicion"%>
<%@page import="datatypes.DtEdicion"%>
<%@page import="java.time.format.DateTimeFormatter"%>

<!DOCTYPE html>
<html>
<head>
<%@include file="header.jsp"%>
<title>Información de Curso</title>
</head>
<body>
<br>
<div class = container mt-4>
<%
if(request.getParameter ("nombreEdicion") != null){ %>
<%
	String nombreInstituto = request.getParameter ("nombreInstituto");
	String nombreCurso = request.getParameter("nombreCurso");
	String nombreEdicion = request.getParameter("nombreEdicion");
	
	Fabrica fab = Fabrica.getInstancia();
	IControladorCurso iconCur = fab.getIControladorCurso();
	
	DtinfoEdicion infoEdicion = iconCur.ConsultaEdicion(nombreInstituto, nombreCurso, nombreEdicion);
	
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd LLLL yyyy");
	
	
%>
<div class="card mb-3" >
  <div class="row no-gutters">
    <div class="col-md-4">
      <img src="..." class="card-img" alt="...">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title"><%=infoEdicion.getNombre()%></h5>
      </div>
    </div>
  </div>
 </div>
 <div class="card mb-3">
  <div class="row no-gutters">
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title">Información Básica</h5>
      	<p class="card-text"><b>Cupo: </b><%=infoEdicion.getCupo()%></p>
      	<p class="card-text"><b>Fecha de Inicio: </b><%=infoEdicion.getfechaInicio()%></p>
      	<p class="card-text"><b>Fecha de Fin: </b><%=infoEdicion.getfechaFin()%></p>
      	<p class="card-text"><b>Fecha de Pub: </b><%=infoEdicion.getFechaPub()%></p>
      	</div>
    </div>
  </div>
</div>
<%
	String[] docentes = iconCur.listarDocentes(nombreInstituto);
%>
<ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item">
    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Docentes</a>
  </li>
</ul>

<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
  	<div class="card">
  		<% 
  			if(docentes.length == 0){
  		%>
  			<div class="alert alert-primary" role="alert">
  				La edición no tiene <i>Docentes</i> asociados.
			</div>
  		<%
  			}
  			else{
  				for(int i = 0; i<docentes.length; i++){ %>
  					<li class="list-group-item d-flex justify-content-between"><p class="p-0 m-0 flex-grow-1"><%=docentes[i]%></p>
  						<a href="#" class="btn btn-primary">Ver información</a>	
					</li>
		<%		}
  			}
		%>
	</div>
  </div>
</div>
<%
}
if(request.getParameter ("nombreEdicionCat") != null){%>
<%
	String nombreCategoria = request.getParameter ("nombreCategoria");
	String nombreCurso = request.getParameter("nombreCurso");
	String nombreIns = request.getParameter("nombreIns");
	String nombreEdicion = request.getParameter("nombreEdicionCat");
	
	Fabrica fab = Fabrica.getInstancia();
	IControladorCurso iconCur = fab.getIControladorCurso();
	
	DtinfoEdicion infoEdicionCat = iconCur.ConsultaEdicionCategoria(nombreCategoria, nombreCurso, nombreEdicion);
	
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd LLLL yyyy");
	
	
%>
<div class="card mb-3" >
  <div class="row no-gutters">
    <div class="col-md-4">
      <img src="..." class="card-img" alt="...">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title"><%=infoEdicionCat.getNombre()%></h5>
      </div>
    </div>
  </div>
 </div>
 <div class="card mb-3">
  <div class="row no-gutters">
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title">Información Básica</h5>
      	<p class="card-text"><b>Cupo: </b><%=infoEdicionCat.getCupo()%></p>
      	<p class="card-text"><b>Fecha de Inicio: </b><%=infoEdicionCat.getfechaInicio()%></p>
      	<p class="card-text"><b>Fecha de Fin: </b><%=infoEdicionCat.getfechaFin()%></p>
      	<p class="card-text"><b>Fecha de Pub: </b><%=infoEdicionCat.getFechaPub()%></p>
      	</div>
    </div>
  </div>
</div>
<%
	String[] docentes = iconCur.listarDocentes(nombreIns);
%>
<ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item">
    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="false">Docentes</a>
  </li>
</ul>

<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
  	<div class="card">
  		<% 
  			if(docentes.length == 0){
  		%>
  			<div class="alert alert-primary" role="alert">
  				La edición no tiene <i>Docentes</i> asociados.
			</div>
  		<%
  			}
  			else{
  				for(int i = 0; i<docentes.length; i++){ %>
  					<li class="list-group-item d-flex justify-content-between"><p class="p-0 m-0 flex-grow-1"><%=docentes[i]%></p>
  						<a href="#" class="btn btn-primary">Ver información</a>	
					</li>
		<%		}
  			}
		%>
	</div>
  </div>
</div>
<%} %>
</div>
<%@include file="footer.jsp"%>
</body>
</html>