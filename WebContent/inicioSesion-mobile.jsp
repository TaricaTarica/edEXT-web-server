<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

	<!--  jQuery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

	<!-- Isolated Version of Bootstrap, not needed if your site already uses Bootstrap -->
	<link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />

	<!-- Bootstrap Date-Picker Plugin -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>


<title>Iniciar Sesion</title>
</head>
<body>
<br>
<div class = container mt-4>
<form action="InicioSesion_mobile" method="post">
  <div class = "card">	
		<div class = "card-header">
			<h4>Iniciar sesión</h4>
		</div>
  <div class = "card-body">
  <div class="form-group">
    <label for="InputNickname">Nickname</label>
    <input name = "nickname-mobile" type="text" class="form-control" id="InputNickname" aria-describedby="nicknameHelp" required>
  </div>
  <div class="form-group">
    <label for="InputContrasenia">Contraseña</label>
    <input name = "contrasenia-mobile" type="password" class="form-control" id="InputContrasenia" required>
  </div>
  <div class="form-group form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Recordarme</label>
  </div>
  </div>
  <div class = "card-footer">
  	<button type="submit" class="btn btn-primary">Iniciar sesión</button>
  </div>
  <%if(request.getAttribute("error") != null){%>
  <div class="alert alert-danger">${error}</div>
  <%}%>

</div>
</form>
</div>
<%@include file="footer.jsp"%>
</body>
</html>