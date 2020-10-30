<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<%@include file="header.jsp"%>
<title>Crear Programa de Formacion</title>
</head>

<body>

<br>
<div class = container mt-4>
<!-- FORMULARIO DE REGISTRO -->
 <form action="CrearProgramaF" method="post">
	<div class = "card">
		
		<div class = "card-header">
			<h4>Crear Programa de Formación</h4>
		</div>
		
		<div class = "card-body">
		
			<div class="form-group">
				<label for="InputNickname">Nombre</label> <input type="text" name="nombre"
					class="form-control" id="InputNombre"
					aria-describedby="nombreHelp" placeholder="Ingresar nombre">
			</div>
			
			<div class="form-group">
				<label for="InputCorreo">Descripción</label> <input type="text" name="descripcion"
					class="form-control" id="InputDescripcion"
					placeholder="Ingresar descripción">
			</div>
			
			<div class="form-group">
				<label for="InputInicio">Fecha de Inicio</label> <input type="text" name="fini"
					class="form-control" id="InputInicio"
					placeholder="Ingresar fecha de inicio">
			</div>
			
			<div class="form-group">
				<label for="InputFin">Fecha de Fin</label> <input type="text" name="ffin"
					class="form-control" id="InputFin"
					placeholder="Ingresar fecha de finalización">
			</div>
			
			<!-- AGREGAR IMAGEN OPCIONAL -->
		

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