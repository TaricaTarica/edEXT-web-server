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
<div class = container mt-4>
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
      <img src="imagenes/imgCursos/<%=infoCurso.getNombre()%>.jpg" class="card-img" alt="imgenCurso">
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
	String[] ediciones = iconCur.listarEdiciones(nombreInstituto, nombreCurso);
%>

<ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item">
    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Programas de Formación</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Ediciones</a>
  </li>
</ul>

<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
  	<div class="card">
  		<% 
  			if(programas.length == 0){
  		%>
  			<div class="alert alert-primary" role="alert">
  				El curso no tiene <i>Programas de Formación</i> asociados.
			</div>
  		<%
  			}
  			else{
  				for(int i = 0; i<programas.length; i++){ %>
  					<li class="list-group-item d-flex justify-content-between"><p class="p-0 m-0 flex-grow-1"><%=programas[i]%></p>
  						<a href="#" class="btn btn-primary">Ver información</a>	
					</li>
		<%		}
  			}
		%>
	</div>
  </div>
 <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
 	<div class="card">
  		<div class="card-body">
  		<% 
  			if(ediciones.length == 0){
  		%>
  			<div class="alert alert-primary" role="alert">
  				El curso no tiene <i>Ediciones</i> asociadas.
			</div>
  		<%
  			}
  			else{
  				for(int i = 0; i<ediciones.length; i++){ %>
  					<li class="list-group-item d-flex justify-content-between"><p class="p-0 m-0 flex-grow-1"><%=ediciones[i]%></p>
  						<a href="infoEdicion.jsp?nombreInstituto=<%=nombreInstituto%>&nombreCurso=<%=nombreCurso%>&nombreEdicion=<%=ediciones[i]%>" class="btn btn-primary">Ver información</a>	
					</li>
		<%		}
  			}
		%>
  		</div>
	</div>
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
      <img src="imagenes/imgCursos/<%=infoCurso.getNombre()%>.jpg" class="card-img" alt="imgenCurso">
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
	String[] ediciones = iconCur.listarEdiciones(nombreInstituto, nombreCurso);
%> 

<!--  PRUEBA VENTANAS  -->
<ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item">
    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Programas de Formación</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Ediciones</a>
  </li>
</ul>

<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
  	<div class="card">
  		<div class="card-body">
  		<% 
  			if(programas.length == 0){
  		%>
  			<div class="alert alert-primary" role="alert">
  				El curso no tiene <i>Programas de Formación</i> asociados.
			</div>
  		<%
  			}
  			else{
  				for(int i = 0; i<programas.length; i++){ %>
  					<li class="list-group-item d-flex justify-content-between"><p class="p-0 m-0 flex-grow-1"><%=programas[i]%></p>
  						<a href="#" class="btn btn-primary">Ver información</a>	
					</li>
		<%		}
  			}
		%>
  		</div>
	</div>
  </div>
 <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
 	<div class="card">
  		<div class="card-body">
  		<% 
  			if(ediciones.length == 0){
  		%>
  			<div class="alert alert-primary" role="alert">
  				El curso no tiene <i>Ediciones</i> asociadas.
			</div>
  		<%
  			}
  			else{
  				for(int i = 0; i<ediciones.length; i++){ %>
    				<li class="list-group-item d-flex justify-content-between"><p class="p-0 m-0 flex-grow-1"><%=ediciones[i]%></p>
  						<a href="infoEdicion.jsp?nombreInstituto=<%=nombreInstituto%>&nombreCurso=<%=nombreCurso%>&nombreEdicion=<%=ediciones[i]%>" class="btn btn-primary">Ver información</a>	
					</li>
		<%		}
  			}
		%>
  		</div>
	</div>
</div>
</div>

<!-- FIN PRUEBA -->
<%} %>
</div>
<%@include file="footer.jsp"%>
</body>
</html>