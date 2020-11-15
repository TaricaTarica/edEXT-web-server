<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="interfaces.Fabrica"%>
<%@page import="interfaces.IControladorCurso"%>
<%@page import="datatypes.DtProgramaFormacion"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Calendar"%>

<!DOCTYPE html>
<html>
<head>
<%@include file="header.jsp"%>
<title>Información de Programa de Formación</title>
</head>
<body>
<br>
<div class = container mt-4>
<%
if(request.getParameter ("cb_Programa") != null){ %>
<%
	String nombrePrograma = request.getParameter ("cb_Programa");

	Fabrica fab = Fabrica.getInstancia();
	IControladorCurso iconCur = fab.getIControladorCurso();
	
	DtProgramaFormacion infoPrograma = iconCur.ConsultaProgramaFormacion(nombrePrograma);
	
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/LL/yyyy");
	
	/*CALENDAR TO LOCALDATE*/
	Calendar calendarInicio = infoPrograma.getFechaInicio();
	LocalDate fechaLocalDateInicio = LocalDateTime.ofInstant(calendarInicio.toInstant(), calendarInicio.getTimeZone().toZoneId()).toLocalDate();
	Calendar calendarFin = infoPrograma.getFechaFin();
	LocalDate fechaLocalDateFin = LocalDateTime.ofInstant(calendarFin.toInstant(), calendarFin.getTimeZone().toZoneId()).toLocalDate();
	Calendar calendarAlta= infoPrograma.getFechaAlta();
	LocalDate fechaLocalDateAlta = LocalDateTime.ofInstant(calendarAlta.toInstant(), calendarAlta.getTimeZone().toZoneId()).toLocalDate();
	/*CALENDAR TO LOCALDATE*/
	
	String fechaI = fechaLocalDateInicio.format(formatter);
	String fechaF = fechaLocalDateFin.format(formatter);
	String fechaA = fechaLocalDateAlta.format(formatter);
	
%>
<div class="card mb-3" >
  <div class="row no-gutters">
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title"><%=infoPrograma.getNombre()%></h5>
        <p class="card-text"><%=infoPrograma.getDescripcion() %></p>
      </div>
    </div>
  </div>
 </div>
 <div class="card mb-3">
  <div class="row no-gutters">
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title">Información Básica</h5>
      	<p class="card-text"><b>Fecha de inicio: </b><%=fechaI%></p>
      	<p class="card-text"><b>Fecha de fin: </b><%=fechaF%></p>
      	<p class="card-text"><b>Fecha de alta: </b><%=fechaA%></p>
      	</div>
    </div>
  </div>
</div>
<%
	String[] cursos = iconCur.listarCursosP(nombrePrograma);
	String[] categorias = iconCur.listarCursosCategoriasP(nombrePrograma);
%>

<ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item">
    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Cursos</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Categorias</a>
  </li>
</ul>

<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
  	<div class="card">
  		<% 
  			if(cursos.length == 0){
  		%>
  			<div class="alert alert-primary" role="alert">
  				El curso no tiene <i>Cursos</i> asociados.
			</div>
  		<%
  			}
  			else{
  				for(int i = 0; i<cursos.length; i++){ %>
  					<li class="list-group-item d-flex justify-content-between"><p class="p-0 m-0 flex-grow-1"><%=cursos[i]%></p>
  						<%
  						String nombreCurso=cursos[i];
  						String nombreInstituto = iconCur.obtenerInstitutoCursoPrograma(nombrePrograma, nombreCurso);
  						%>
  						<a href="infoCurso.jsp?nombreInstituto=<%=nombreInstituto%>&nombreCurso=<%=nombreCurso%>" class="btn btn-primary">Ver información</a>	
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
</div> 

<%
}%>
</div>
<%@include file="footer.jsp"%>
</body>
</html>