<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="publicadores.ControladorCursoPublish"%>
<%@page import="publicadores.ControladorCursoPublishService"%>
<%@page import="publicadores.ControladorCursoPublishServiceLocator"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="header.jsp"%>
<title>Inscribirse a Programa de Formación</title>
</head>
<body>
<br>

<div class = container mt-4>
	<form action="inscripcionPF" method="post">
		<div class="card">
				<div class = "card-header">
					<h4>Inscribirse a Programa de Formación</h4>
				</div>
	  		<div class="card-body">
	    		<h5 class="card-title">Programas de Formacion</h5>
		  		<div id = "programas" class="form-group">
		    			<select name ="cb_Programa" class="form-control" id="cbprogramas">
		      				<%
			      				ControladorCursoPublishService cps = new ControladorCursoPublishServiceLocator();
			      				ControladorCursoPublish port = cps.getControladorCursoPublishPort();
		      					String[] nombreProgramas = port.listarProgFormacion();	
		      				
		    					int i = 0;
		    					while(i < nombreProgramas.length){ %>
		    					<option><%= nombreProgramas[i]%></option>
		    					<%i++;
		    					}%> 		 	 	
		    			</select>
		  		</div>
			</div>
			<div class="card-footer">
			  	<button type="submit" class="btn btn-primary">Confirmar</button>
			</div>
		</div>
</form>

<%if(request.getAttribute("error") != null){%>
  <div class="alert alert-danger">${error}</div>
<%}%>

</div>
<%@include file="footer.jsp"%>
</body>
</html>