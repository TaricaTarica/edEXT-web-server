<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="interfaces.Fabrica"%>
<%@page import="interfaces.IControladorCurso"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Calendar"%>

<!DOCTYPE html>
<html>
<head>
<%@include file="header.jsp"%>
<title>Modificar Usuario</title>
</head>
<body>

<br>
<div class = container mt-4>

<%
DtUsuario usr = (DtUsuario) sesion.getAttribute("usuario");
String nombre = usr.getNombre();
String apellido = usr.getApellido();
DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");

/*CALENDAR TO LOCALDATE*/
Calendar calendar = usr.getfechaNac();
LocalDate fechaLocalDate = LocalDateTime.ofInstant(calendar.toInstant(), calendar.getTimeZone().toZoneId()).toLocalDate();
/*CALENDAR TO LOCALDATE*/
String fnac = fechaLocalDate.format(formatter);
String contrasenia = usr.getContrasenia();

%>

 <form action="ModificarUsuario" method="post">
	
	<div class = "card">	
		<div class = "card-header">
			<h4>Modificar Usuario</h4>
		</div>
		<div class = "card-body">
			<div class="form-group">
				<label>Nombre</label> <input class="form-control" type="text" name="nombre"
					value="<%=nombre%>" required>
			</div>
			<div class="form-group">
				<label>Apellido</label> <input class="form-control" type="text" name="apellido"
					value="<%=apellido%>" required>
			</div>
			<div class="form-group">
				<label>Fecha de Nacimiento</label> <input class="form-control" type="text" name="fnac"
					value="<%=fnac%>" required>
			</div>
			
			<div id="InputContrasenia" class="form-group">
				<label for="InputContrasenia">Contraseña</label>
				<input class="form-control" type="password" name="contrasenia"
					placeholder="Ingrese su actual o nueva contraseña" required>
			</div>
			
			
			<div id="CContrasenia" class="form-group">
				<label for="CContrasenia">Confirmar contraseña</label>
				<input class="form-control" type="password" name="ccontrasenia"
					placeholder="Confirmación de contraseña" required>
					
			</div>
  		</div>
  		<div class = "card-footer">
			<button type="submit" class="btn btn-primary">Modificar</button>
		</div>
	</div>
</form>
</div>
 
<%@include file="footer.jsp"%>
</body>
</html>