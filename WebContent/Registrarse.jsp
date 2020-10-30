<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="interfaces.Fabrica"%>
<%@page import="interfaces.IControladorCurso"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="header.jsp"%>
<title>Registrarse</title>
</head>
<body>

<script type="text/javascript">
    function showContent() {
        element = document.getElementById("institutos");
        check = document.getElementById("cb_Docente");
        if (check.checked) {
            element.style.display='block';
        }
        else {
            element.style.display='none';
        }
    }
</script>


<br>
<div class = container mt-4>
<!-- FORMULARIO DE REGISTRO -->
 <form action="RegistrarUsuario" method="post">
	<div class = "card">	
		<div class = "card-header">
			<h4>Registrar Usuario</h4>
		</div>
		<div class = "card-body">
		<div class="form-group">
			<label for="InputNickname">Nickname</label> <input type="text" name="nickname"
				class="form-control" id="InputNickname"
				aria-describedby="nicknameHelp" placeholder="ingresar nickname" required>

		</div>
		<div class="form-group">
			<label for="InputCorreo">Correo electrónico</label> <input type="text" name="correo"
				class="form-control" id="InputCorreo"
				aria-describedby="correolHelp" placeholder="ingresar correo electrónico" required>
		</div>
		<div class="form-group">
			<label for="InputNombre">Nombre</label> <input type="text" name="nombre"
				class="form-control" id="InputNombre"
				placeholder="ingresar nombre" required>
		</div>
		<div class="form-group">
			<label for="InputApellido">Apellido</label> <input type="text" name="apellido"
				class="form-control" id="InputApellido"
				placeholder="ingresar apellido" required>
		</div>
		<div class="form-group">
			<label for="InputNacimiento">Fecha de Nacimiento</label> <input type="text" name="fnac"
				class="form-control" id="InputNacimiento"
				placeholder="ingresar fecha de nacimiento" required>
		</div>
		<div class="form-group">
			<label for="InputContrasenia">Contraseña</label> <input type="password" name="contrasenia"
				class="form-control" id="InputContrasenia"
				placeholder="ingresar contraseña" required>
		</div>
		<div class="form-group">
			<label for="InputCContrasenia">Confirmar Contraseña</label> <input type="password" name="ccontrasenia"
				class="form-control" id="CContrasenia"
				placeholder="ingresar contraseña" required>
		</div>
		<div class="form-group form-check">
    		<input type="checkbox" name="cb_Docente" class="form-check-input" id="cb_Docente" onchange="javascript:showContent()" checked>
    		<label class="form-check-label" for="exampleCheck1">es Docente</label>
  		</div>
  		<div id = "institutos" class="form-group">
    		<label for="exampleFormControlSelect1">Instituto</label>
    			<select name ="cb_Instituto" class="form-control" id="instituto">
      				<%
      					Fabrica fab = Fabrica.getInstancia();
      					IControladorCurso iconCur = fab.getIControladorCurso();
      				
      				
      					String[] nombreInstitutos = iconCur.listarInstitutos();	
      				
    					int i = 0;
    					while(i < nombreInstitutos.length){ %>
    					<option><%= nombreInstitutos[i]%></option>
    					<%i++;
    					}%> 		 
     		 	
    			</select>
  		</div>
  		</div>
  		<div class = "card-footer">
			<button type="submit" class="btn btn-primary">Registrarse</button>
		</div>
		
  <%if(request.getAttribute("error") != null){%>
  <div class="alert alert-danger">${error}</div>
  <%}%>		
		
</div>
</form>
</div>
</body>
<br> 
<%@include file="footer.jsp"%>
</html>