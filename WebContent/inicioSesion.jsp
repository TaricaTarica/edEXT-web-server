<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="header.jsp"%>
<title>Iniciar sesión</title>
</head>
<body>
<br>
<div class = container mt-4>
<form action="InicioSesion" method="post">
  <div class = "card">	
		<div class = "card-header">
			<h4>Iniciar sesión</h4>
		</div>
  <div class = "card-body">
  <div class="form-group">
    <label for="InputNickname">Nickname</label>
    <input name = "nickname" type="text" class="form-control" id="InputNickname" aria-describedby="nicknameHelp" required>
  </div>
  <div class="form-group">
    <label for="InputContrasenia">Contraseña</label>
    <input name = "contrasenia" type="password" class="form-control" id="InputContrasenia" required>
  </div>
  </div>
  <div class = "card-footer">
  	<button type="submit" class="btn btn-primary">Iniciar sesión</button>
  	  <small id="registrarseHelp" class="form-text text-muted">¿No tienes cuenta? <a href= Registrarse.jsp>Regístrate</a></small>
  </div>
  <%if(request.getAttribute("error") != null){%>
  <div class="alert alert-danger">${error}</div>
  <%}%>

</div>
</form>
</div>
<br>
<%@include file="footer.jsp"%>
</body>
</html>