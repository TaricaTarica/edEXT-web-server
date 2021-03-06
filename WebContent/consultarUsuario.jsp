<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="publicadores.ControladorUsuarioPublish"%>
<%@page import="publicadores.ControladorUsuarioPublishService"%>
<%@page import="publicadores.ControladorUsuarioPublishServiceLocator"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="header.jsp"%>

<title>Consultar Usuario</title>
</head>
<body>
<br>
<div class = container mt-4>
	<form action="ContinuarConsultarUsuario.jsp" method="post">
		<div class="card">
			<div class = "card-header">
				<h4>Consultar  Usuario</h4>
			</div>
	  		<div class="card-body">
		  		<div id = "usuarios" class="form-group">
		  		<label for="exampleFormControlSelect1">Usuarios</label>
	    			<select name ="cb_Usuario" class="form-control" id="cbusuarios">
	      				<%
	      				ControladorUsuarioPublishService cpus = new ControladorUsuarioPublishServiceLocator();
	      				ControladorUsuarioPublish port = cpus.getControladorUsuarioPublishPort();
  						String[] nombreUsuarios = port.listarUsuarios();	
      				
    					int i = 0;
    					while(i < nombreUsuarios.length){ %>
    					<option><%= nombreUsuarios[i]%></option>
    					<%i++;
    					}%> 		 	 	
	    			</select>
		  		</div>
	  		</div> 
	  		<div class = "card-footer">
	  			<button type="submit" class="btn btn-primary">Confirmar</button>
	  		</div>
  		</div>
	</form>
</div>
	
<%@include file="footer.jsp"%>
</body>
</html>