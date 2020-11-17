<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="publicadores.ControladorCursoPublish"%>
<%@page import="publicadores.ControladorCursoPublishService"%>
<%@page import="publicadores.ControladorCursoPublishServiceLocator"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Calendar"%>

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
	
	ControladorCursoPublishService cps = new ControladorCursoPublishServiceLocator();
	ControladorCursoPublish port = cps.getControladorCursoPublishPort();

	publicadores.DtCursoInfo infoCurso = port.consultaCurso(nombreInstituto, nombreCurso);
	/*ESTE MAMOTRETO ES PARA QUE LA FECHA SE VEA BIEN*/
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/LL/yyyy");
	Calendar calendar = infoCurso.getFechaAlta();
	LocalDate fechaLocalDate = LocalDateTime.ofInstant(calendar.toInstant(), calendar.getTimeZone().toZoneId()).toLocalDate();
	
	String fecha = fechaLocalDate.format(formatter);
	
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
      	<p class="card-text"><b>Instituto: </b><%=nombreInstituto%></p>
      	<p class="card-text"><b>Duración: </b><%=infoCurso.getDuracion()%></p>
      	<p class="card-text"><b>Cantidad de horas: </b><%=infoCurso.getCantHoras()%></p>
      	<p class="card-text"><b>Créditos: </b><%=infoCurso.getCreditos()%></p>
      	<p class="card-text"><b>Fecha de alta: </b><%=fecha%></p>
      	<p class="card-text"><b>URL: </b><%=infoCurso.getUrl()%></p>
      	</div>
    </div>
  </div>
</div>
<%
	String[] programas = port.listarProgramasAux(nombreInstituto, nombreCurso);
	String[] ediciones = port.listarEdiciones(nombreInstituto, nombreCurso);
	String[] categorias = port.listarCategoriasC(nombreInstituto, nombreCurso);
	String[] previas = port.listarPrevias(nombreInstituto, nombreCurso);

%>

<ul class="nav nav-tabs" id="myTab" role="tablist">
  
  <li class="nav-item">
    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Programas de Formación</a>
  </li>
  
  <li class="nav-item">
    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Ediciones</a>
  </li>
  
  <li class="nav-item">
    <a class="nav-link" id="profile2-tab" data-toggle="tab" href="#profile2" role="tab" aria-controls="profile2" aria-selected="false">Categorías</a>
  </li>
  
  <li class="nav-item">
    <a class="nav-link" id="profile3-tab" data-toggle="tab" href="#profile3" role="tab" aria-controls="profile3" aria-selected="false">Previas</a>
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
  						<a href="ContinuarConsultaProgramaFormacion.jsp?cb_Programa=<%=programas[i]%>" class="btn btn-primary">Ver información</a>	
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
 <div class="tab-pane fade" id="profile2" role="tabpanel" aria-labelledby="profile2-tab">
 	<div class="card">
  		<div class="card-body">
  		<% 
  			if(categorias.length == 0){
  		%>
  			<div class="alert alert-primary" role="alert">
  				El curso no tiene <i>categorias</i> asociadas.
			</div>
  		<%
  			}
  			else{
  				for(int i = 0; i<categorias.length; i++){ %>
  					<li class="list-group-item d-flex justify-content-between"><p class="p-0 m-0 flex-grow-1"><%=categorias[i]%></p>		
					</li>
		<%		}
  			}
		%>
  		</div>
	</div>
</div>
 <div class="tab-pane fade" id="profile3" role="tabpanel" aria-labelledby="profile3-tab">
 	<div class="card">
  		<div class="card-body">
  		<% 
  			if(previas.length == 0){
  		%>
  			<div class="alert alert-primary" role="alert">
  				El curso no tiene <i>Previas</i> asociadas.
			</div>
  		<%
  			}
  			else{
  				for(int i = 0; i<previas.length; i++){ %>
  					<li class="list-group-item d-flex justify-content-between"><p class="p-0 m-0 flex-grow-1"><%=previas[i]%></p>		
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
	
	ControladorCursoPublishService cps = new ControladorCursoPublishServiceLocator();
	ControladorCursoPublish port = cps.getControladorCursoPublishPort();
	
	publicadores.DtCursoInfo infoCurso = port.consultaCursoCategoria(nombreCategoria, nombreCurso);
	
	/*ESTE MAMOTRETO ES PARA QUE LA FECHA SE VEA BIEN*/
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/LL/yyyy");
	Calendar calendar = infoCurso.getFechaAlta();
	LocalDate fechaLocalDate = LocalDateTime.ofInstant(calendar.toInstant(), calendar.getTimeZone().toZoneId()).toLocalDate();
	
	String fecha = fechaLocalDate.format(formatter);
	
	String nombreInstituto = port.obtenerInstitutoCurso(nombreCurso);
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
      	<p class="card-text"><b>Instituto: </b><%=nombreInstituto%></p>
      	<p class="card-text"><b>Duración: </b><%=infoCurso.getDuracion()%></p>
      	<p class="card-text"><b>Cantidad de horas: </b><%=infoCurso.getCantHoras()%></p>
      	<p class="card-text"><b>Créditos: </b><%=infoCurso.getCreditos()%></p>
      	<p class="card-text"><b>Fecha de alta: </b><%=fecha%></p> <!-- aca va la variable fecha -->
      	<p class="card-text"><b>URL: </b><%=infoCurso.getUrl()%></p>
      	</div>
    </div>
  </div>
</div>

<%
	String[] programas = port.listarProgramasAux(nombreInstituto, nombreCurso);
	String[] ediciones = port.listarEdiciones(nombreInstituto, nombreCurso);
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
  						<a href="ContinuarConsultaProgramaFormacion.jsp?cb_Programa=<%=programas[i]%>" class="btn btn-primary">Ver información</a>	
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