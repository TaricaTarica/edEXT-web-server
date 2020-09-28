<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="header.jsp"%>
<title>Iniciar Sesion</title>
</head>
<body>
<h1 align=center>Iniciar Sesion</h1>
<form action="InicioSesion" method="post">
  <div class="form-group">
    <label for="InputNickname">Nickname</label>
    <input name = "nickname" type="text" class="form-control" id="InputNickname" aria-describedby="nicknameHelp">
  </div>
  <div class="form-group">
    <label for="InputContrasenia">Contraseña</label>
    <input name = "contrasenia" type="password" class="form-control" id="InputContrasenia">
  </div>
  <button type="submit" class="btn btn-primary">Iniciar Sesion</button>
  <%if(request.getAttribute("error") != null){%>
  <div class="alert alert-danger">${error}</div>
  <%}%>
  <small id="registrarseHelp" class="form-text text-muted">¿No tienes cuenta? <a href= Registrarse.jsp>Regístrate</a></small>
</form>
<%@include file="footer.jsp"%>
</body>
</html>