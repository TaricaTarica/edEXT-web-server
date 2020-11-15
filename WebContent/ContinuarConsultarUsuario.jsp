<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="interfaces.Fabrica"%>
<%@page import="interfaces.IControladorUsuario"%>
<%@page import="datatypes.DtUsuario"%>
<%@page import="logica.Instituto"%>
<%@page import="logica.Curso"%>
<%@page import="logica.Edicion"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>



<!DOCTYPE html>
<html>
<head>
<%@include file="header.jsp"%>
<title>Información de Usuario</title>
</head>
<body>
<br>
<div class="container" mt-4="">
<form action="SeguirUsuario" method="post">
<%
Fabrica fab = Fabrica.getInstancia();
		IControladorUsuario iconUsr = fab.getIControladorUsuario();
		DtUsuario usr = (DtUsuario) sesion.getAttribute("usuario");
%>		
<%
if(sesion.getAttribute("usuario") == null){ %>
<%
	String nombreUsuario = request.getParameter ("cb_Usuario");
	DtUsuario infoUsuarioV = iconUsr.ConsultaUsuario(nombreUsuario);	
	
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/LL/yyyy");
	
	/*CALENDAR TO LOCALDATE*/
	Calendar calendar = infoUsuarioV.getfechaNac();
	LocalDate fechaLocalDate = LocalDateTime.ofInstant(calendar.toInstant(), calendar.getTimeZone().toZoneId()).toLocalDate();
	/*CALENDAR TO LOCALDATE*/
	String fecha = fechaLocalDate.format(formatter);
%>

			
	<%
		if(iconUsr.esEstudiante(nombreUsuario)){%>
			<div class="card mb-3">
			  <div class="row no-gutters">
			    <div class="col-md-8">
			      <div class="card-body">
				        <h5 class="card-title">Información Básica</h5>
				      	<p class="card-text"><b>Nickname: </b><%=infoUsuarioV.getNickname()%></p>
				      	<p class="card-text"><b>Nombre: </b><%=infoUsuarioV.getNombre()%></p>
				      	<p class="card-text"><b>Apellido: </b><%=infoUsuarioV.getApellido()%></p>
						<p class="card-text"><b>Correo: </b><%=infoUsuarioV.getCorreo()%></p>
						<p class="card-text"><b>Fecha de Nacimiento: </b><%=fecha%></p>
			      </div>			      
			    </div>
			  </div>
			</div>
			<%
				String[] edicionesE=iconUsr.listarEdicionesEst(nombreUsuario);
				String[] programasE=iconUsr.listarProgramasE(nombreUsuario);
			%>
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item">
					    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Ediciones</a>
					 </li>
					 <li class="nav-item">
					    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Programas</a>
					  </li>
				</ul>
				<div class="tab-content" id="myTabContent">
					 <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
					  	<div class="card">
					  		<% 
					  			if(edicionesE.length == 0){
					  		%>
					  			<div class="alert alert-primary" role="alert">
					  				El estudiante no tiene inscripciones a <i>ediciones de curso</i>.
								</div>
					  		<%
					  			}
					  			else{
					  				for(int i = 0; i<edicionesE.length; i++){ %>
					  					<li class="list-group-item d-flex justify-content-between"><p class="p-0 m-0 flex-grow-1"><%=edicionesE[i]%></p>
					  						<%
					  							String nombreEdicion=edicionesE[i];
					  							Edicion ed=iconUsr.ObtenerEdicion(nombreEdicion, nombreUsuario);
					  							String Docente=ed.nombresDocente();
					  							Instituto instituto=iconUsr.GetInstituto(Docente);
					  							String nombreInstituto=instituto.getNombre();
					  							List<Curso> cursos=instituto.getCursos();
					  							String nombreCurso=iconUsr.GetCurso(nombreEdicion, cursos);
					  						%>
											 <a href="infoEdicion.jsp?nombreInstituto=<%=nombreInstituto%>&nombreCurso=<%=nombreCurso%>&nombreEdicion=<%=edicionesE[i]%>" class="btn btn-primary">Ver información</a>	
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
					  			if(programasE.length == 0){
					  		%>
					  			<div class="alert alert-primary" role="alert">
					  				El estudiante no tiene inscripciones a <i>programas de formación</i>.
								</div>
					  		<%
					  			}
					  			else{
					  				for(int i = 0; i<programasE.length; i++){ %>
					  					<li class="list-group-item d-flex justify-content-between"><p class="p-0 m-0 flex-grow-1"><%=programasE[i]%></p>		
											<a href="ContinuarConsultaProgramaFormacion.jsp?cb_Programa=<%=programasE[i]%>" class="btn btn-primary">Ver información</a>		
										</li>
							<%		}
					  			}
							%>
					  		</div>
						</div>
					</div>
					</div> 
		<%}else{%>
			<div class="card mb-3">
			  <div class="row no-gutters">
			    <div class="col-md-8">
			      <div class="card-body">
				        <h5 class="card-title">Información Básica</h5>
				      	<p class="card-text"><b>Nickname: </b><%=infoUsuarioV.getNickname()%></p>
				      	<p class="card-text"><b>Nombre: </b><%=infoUsuarioV.getNombre()%></p>
				      	<p class="card-text"><b>Apellido: </b><%=infoUsuarioV.getApellido()%></p>
						<p class="card-text"><b>Correo: </b><%=infoUsuarioV.getCorreo()%></p>
						<p class="card-text"><b>Fecha de Nacimiento: </b><%=fecha%></p>
						<p class="card-text"><b>Instituto: </b><%=iconUsr.GetInstituto(infoUsuarioV.getNickname()).getNombre()%></p>
			      </div>
			    </div>
			  </div>
			</div>
			<%
				String[] edicionesD=iconUsr.listarEdicionesD(nombreUsuario);
			%>
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item">
				    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Ediciones</a>
				 </li>
			</ul>
			<div class="tab-content" id="myTabContent">
					 <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
					  	<div class="card">
					  		<% 
					  			if(edicionesD.length == 0){
					  		%>
					  			<div class="alert alert-primary" role="alert">
					  				El docente no participa en <i>ediciones de curso</i>.
								</div>
					  		<%
					  			}
					  			else{
					  				for(int i = 0; i<edicionesD.length; i++){ %>
					  					<li class="list-group-item d-flex justify-content-between"><p class="p-0 m-0 flex-grow-1"><%=edicionesD[i]%></p>
					  						<%
					  							String nombreEdicion=edicionesD[i];
					  							Instituto instituto=iconUsr.GetInstituto(nombreUsuario);
					  							String nombreInstituto=instituto.getNombre();
					  							List<Curso> cursos=instituto.getCursos();
					  							String nombreCurso=iconUsr.GetCurso(nombreEdicion, cursos);
					  						%>
											 <a href="infoEdicion.jsp?nombreInstituto=<%=nombreInstituto%>&nombreCurso=<%=nombreCurso%>&nombreEdicion=<%=edicionesD[i]%>" class="btn btn-primary">Ver información</a>	
										</li>
							<%		}
					  			}
							%>
						</div>
					  </div>
					</div>
		<%}%>
			
<%}else{
		if(iconUsr.esEstudiante(usr.getNickname())){%>
			<%
				String nombreUsuario = request.getParameter ("cb_Usuario");
				DtUsuario infoUsuarioE = iconUsr.ConsultaUsuario(nombreUsuario);
				
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/LL/yyyy");
				/*CALENDAR TO LOCALDATE*/
				Calendar calendar = infoUsuarioE.getfechaNac();
				LocalDate fechaLocalDate = LocalDateTime.ofInstant(calendar.toInstant(), calendar.getTimeZone().toZoneId()).toLocalDate();
				/*CALENDAR TO LOCALDATE*/
				String fecha = fechaLocalDate.format(formatter);
			%>
			
			<%
				if(iconUsr.esEstudiante(nombreUsuario)){%>
					<div class="card mb-3">
					  <div class="row no-gutters">
					    <div class="col-md-8">
					      <div class="card-body">
						        <h5 class="card-title">Información Básica</h5>
						      	<p class="card-text"><b>Nickname: </b><%=infoUsuarioE.getNickname()%></p>
						      	<p class="card-text"><b>Nombre: </b><%=infoUsuarioE.getNombre()%></p>
						      	<p class="card-text"><b>Apellido: </b><%=infoUsuarioE.getApellido()%></p>
								<p class="card-text"><b>Correo: </b><%=infoUsuarioE.getCorreo()%></p>
								<p class="card-text"><b>Fecha de Nacimiento: </b><%=fecha%></p>
					      		<input type="hidden" name="nickSeguir" value="<%=infoUsuarioE.getNickname()%>">
					      		<input type="hidden" name="nickSeguidor" value="<%=usr.getNickname()%>">
					      		<button type="submit" class="btn btn-success">Seguir</button>
					      </div>
					    </div>
					  </div>
					</div>
					<%
						String[] edicionesE=iconUsr.listarEdicionesEst(nombreUsuario);
						String[] programasE=iconUsr.listarProgramasE(nombreUsuario);
					%>
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item">
							    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Ediciones</a>
							 </li>
							 <li class="nav-item">
							    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Programas</a>
							  </li>
						</ul>
						<div class="tab-content" id="myTabContent">
							 <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
							  	<div class="card">
							  		<% 
							  			if(edicionesE.length == 0){
							  		%>
							  			<div class="alert alert-primary" role="alert">
							  				El estudiante no tiene inscripciones a <i>ediciones de curso</i>.
										</div>
							  		<%
							  			}
							  			else{
							  				for(int i = 0; i<edicionesE.length; i++){ %>
							  					<li class="list-group-item d-flex justify-content-between"><p class="p-0 m-0 flex-grow-1"><%=edicionesE[i]%></p>
							  						<%
							  							String nombreEdicion=edicionesE[i];
							  							Edicion ed=iconUsr.ObtenerEdicion(nombreEdicion, nombreUsuario);
							  							String Docente=ed.nombresDocente();
							  							Instituto instituto=iconUsr.GetInstituto(Docente);
							  							String nombreInstituto=instituto.getNombre();
							  							List<Curso> cursos=instituto.getCursos();
							  							String nombreCurso=iconUsr.GetCurso(nombreEdicion, cursos);
							  						%>
													 <a href="infoEdicion.jsp?nombreInstituto=<%=nombreInstituto%>&nombreCurso=<%=nombreCurso%>&nombreEdicion=<%=edicionesE[i]%>" class="btn btn-primary">Ver información</a>	
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
							  			if(programasE.length == 0){
							  		%>
							  			<div class="alert alert-primary" role="alert">
							  				El estudiante no tiene inscripciones a <i>programas de formación</i>.
										</div>
							  		<%
							  			}
							  			else{
							  				for(int i = 0; i<programasE.length; i++){ %>
							  					<li class="list-group-item d-flex justify-content-between"><p class="p-0 m-0 flex-grow-1"><%=programasE[i]%></p>		
													<a href="ContinuarConsultaProgramaFormacion.jsp?cb_Programa=<%=programasE[i]%>" class="btn btn-primary">Ver información</a>		
												</li>
									<%		}
							  			}
									%>
							  		</div>
								</div>
							</div>
							</div> 
				<%}else{%>
					<div class="card mb-3">
					  <div class="row no-gutters">
					    <div class="col-md-8">
					      <div class="card-body">
						        <h5 class="card-title">Información Básica</h5>
						        <p class="card-text"><b>Nickname: </b><%=infoUsuarioE.getNickname()%></p>
						        <p class="card-text"><b>Nombre: </b><%=infoUsuarioE.getNombre()%></p>
						      	<p class="card-text"><b>Apellido: </b><%=infoUsuarioE.getApellido()%></p>
								<p class="card-text"><b>Correo: </b><%=infoUsuarioE.getCorreo()%></p>
								<p class="card-text"><b>Fecha de Nacimiento: </b><%=fecha%></p>
								<p class="card-text"><b>Instituto: </b><%=iconUsr.GetInstituto(infoUsuarioE.getNickname()).getNombre()%></p>
					      		<input type="hidden" name="nickSeguir" value="<%=infoUsuarioE.getNickname()%>">
					      		<input type="hidden" name="nickSeguidor" value="<%=usr.getNickname()%>">
					      		<button type="submit" class="btn btn-success">Seguir</button>
								
					      </div>
					    </div>
					  </div>
					</div>
					<%
						String[] edicionesD=iconUsr.listarEdicionesD(nombreUsuario);
					%>
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item">
						    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Ediciones</a>
						 </li>
					</ul>
					<div class="tab-content" id="myTabContent">
							 <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
							  	<div class="card">
							  		<% 
							  			if(edicionesD.length == 0){
							  		%>
							  			<div class="alert alert-primary" role="alert">
					  						El docente no participa en <i>ediciones de curso</i>.
										</div>
							  		<%}
							  			else{
							  				for(int i = 0; i<edicionesD.length; i++){ %>
							  					<li class="list-group-item d-flex justify-content-between"><p class="p-0 m-0 flex-grow-1"><%=edicionesD[i]%></p>
							  						<%
							  							String nombreEdicion=edicionesD[i];
							  							Instituto instituto=iconUsr.GetInstituto(nombreUsuario);
							  							String nombreInstituto=instituto.getNombre();
							  							List<Curso> cursos=instituto.getCursos();
							  							String nombreCurso=iconUsr.GetCurso(nombreEdicion, cursos);
							  						%>
													 <a href="infoEdicion.jsp?nombreInstituto=<%=nombreInstituto%>&nombreCurso=<%=nombreCurso%>&nombreEdicion=<%=edicionesD[i]%>" class="btn btn-primary">Ver información</a>	
												</li>
									<%		}
							  			}
									%>
								</div>
							  </div>
							</div>
				<%}			

		}else{%>
			<%
			String nombreUsuario = request.getParameter ("cb_Usuario");
			DtUsuario infoUsuarioD = iconUsr.ConsultaUsuario(nombreUsuario);
			
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/LL/yyyy");
			/*CALENDAR TO LOCALDATE*/
			Calendar calendar = infoUsuarioD.getfechaNac();
			LocalDate fechaLocalDate = LocalDateTime.ofInstant(calendar.toInstant(), calendar.getTimeZone().toZoneId()).toLocalDate();
			/*CALENDAR TO LOCALDATE*/
			String fecha = fechaLocalDate.format(formatter);
			%>
			
			<%
				if(iconUsr.esEstudiante(nombreUsuario)){%>
					<div class="card mb-3">
					  <div class="row no-gutters">
					    <div class="col-md-8">
					      <div class="card-body">
						        <h5 class="card-title">Información Básica</h5>
						      	<p class="card-text"><b>Nickname: </b><%=infoUsuarioD.getNickname()%></p>
						      	<p class="card-text"><b>Nombre: </b><%=infoUsuarioD.getNombre()%></p>
						      	<p class="card-text"><b>Apellido: </b><%=infoUsuarioD.getApellido()%></p>
								<p class="card-text"><b>Correo: </b><%=infoUsuarioD.getCorreo()%></p>
								<p class="card-text"><b>Fecha de Nacimiento: </b><%=fecha%></p>
					      		<input type="hidden" name="nickSeguir" value="<%=infoUsuarioD.getNickname()%>">
					      		<input type="hidden" name="nickSeguidor" value="<%=usr.getNickname()%>">
					      		<button type="submit" class="btn btn-success">Seguir</button>
					      </div>
					    </div>
					  </div>
					</div>
					<%
						String[] edicionesE=iconUsr.listarEdicionesEst(nombreUsuario);
						String[] programasE=iconUsr.listarProgramasE(nombreUsuario);
					%>
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item">
							    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Ediciones</a>
							 </li>
							 <li class="nav-item">
							    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Programas</a>
							  </li>
						</ul>
						<div class="tab-content" id="myTabContent">
							 <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
							  	<div class="card">
							  		<% 
							  			if(edicionesE.length == 0){
							  		%>
							  			<div class="alert alert-primary" role="alert">
							  				El estudiante no tiene inscripciones a <i>ediciones de curso</i>.
										</div>
							  		<%
							  			}
							  			else{
							  				for(int i = 0; i<edicionesE.length; i++){ %>
							  					<li class="list-group-item d-flex justify-content-between"><p class="p-0 m-0 flex-grow-1"><%=edicionesE[i]%></p>
							  						<%
							  							String nombreEdicion=edicionesE[i];
							  							Edicion ed=iconUsr.ObtenerEdicion(nombreEdicion, nombreUsuario);
							  							String Docente=ed.nombresDocente();
							  							Instituto instituto=iconUsr.GetInstituto(Docente);
							  							String nombreInstituto=instituto.getNombre();
							  							List<Curso> cursos=instituto.getCursos();
							  							String nombreCurso=iconUsr.GetCurso(nombreEdicion, cursos);
							  						%>
													 <a href="infoEdicion.jsp?nombreInstituto=<%=nombreInstituto%>&nombreCurso=<%=nombreCurso%>&nombreEdicion=<%=edicionesE[i]%>" class="btn btn-primary">Ver información</a>	
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
							  			if(programasE.length == 0){
							  		%>
							  			<div class="alert alert-primary" role="alert">
							  				El estudiante no tiene inscripciones a <i>programas de formación</i>.
										</div>
							  		<%
							  			}
							  			else{
							  				for(int i = 0; i<programasE.length; i++){ %>
							  					<li class="list-group-item d-flex justify-content-between"><p class="p-0 m-0 flex-grow-1"><%=programasE[i]%></p>		
													<a href="ContinuarConsultaProgramaFormacion.jsp?cb_Programa=<%=programasE[i]%>" class="btn btn-primary">Ver información</a>		
												</li>
									<%		}
							  			}
									%>
							  		</div>
								</div>
							</div>
							</div> 
				<%}else{%>
					<div class="card mb-3">
					  <div class="row no-gutters">
					    <div class="col-md-8">
					      <div class="card-body">
						        <h5 class="card-title">Información Básica</h5>
						      	<p class="card-text"><b>Nickname: </b><%=infoUsuarioD.getNickname()%></p>
						      	<p class="card-text"><b>Nombre: </b><%=infoUsuarioD.getNombre()%></p>
						      	<p class="card-text"><b>Apellido: </b><%=infoUsuarioD.getApellido()%></p>
								<p class="card-text"><b>Correo: </b><%=infoUsuarioD.getCorreo()%></p>
								<p class="card-text"><b>Fecha de Nacimiento: </b><%=fecha%></p>
								<p class="card-text"><b>Instituto: </b><%=iconUsr.GetInstituto(infoUsuarioD.getNickname()).getNombre()%></p>
					      		<input type="hidden" name="nickSeguir" value="<%=infoUsuarioD.getNickname()%>">
					      		<input type="hidden" name="nickSeguidor" value="<%=usr.getNickname()%>">
					      		<button type="submit" class="btn btn-success">Seguir</button>
					      </div>
					    </div>
					  </div>
					</div>
					<%
						String[] edicionesD=iconUsr.listarEdicionesD(nombreUsuario);
					%>
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item">
						    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Ediciones</a>
						 </li>
					</ul>
					<div class="tab-content" id="myTabContent">
							 <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
							  	<div class="card">
							  		<% 
							  			if(edicionesD.length == 0){
							  		%>
							  			<div class="alert alert-primary" role="alert">
					  						El docente no participa en <i>ediciones de curso</i>.
										</div>
							  		<%
							  			}
							  			else{
							  				for(int i = 0; i<edicionesD.length; i++){ %>
							  					<li class="list-group-item d-flex justify-content-between"><p class="p-0 m-0 flex-grow-1"><%=edicionesD[i]%></p>
							  						<%
							  							String nombreEdicion=edicionesD[i];
							  							Instituto instituto=iconUsr.GetInstituto(nombreUsuario);
							  							String nombreInstituto=instituto.getNombre();
							  							List<Curso> cursos=instituto.getCursos();
							  							String nombreCurso=iconUsr.GetCurso(nombreEdicion, cursos);
							  						%>
													 <a href="infoEdicion.jsp?nombreInstituto=<%=nombreInstituto%>&nombreCurso=<%=nombreCurso%>&nombreEdicion=<%=edicionesD[i]%>" class="btn btn-primary">Ver información</a>	
												</li>
									<%		}
							  			}
									%>
								</div>
							  </div>
							</div>
				<%}%>
			</form>
			</div>
			
		<%}
}%>
<%@include file="footer.jsp"%>
</body>
</html>