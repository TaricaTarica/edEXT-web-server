<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="header.jsp"%>
<title>Aviso</title>
</head>
<body>
<div class="alert alert-success" role="alert">
  <h4 class="alert-heading">¡Operación exitosa!</h4>
  <p>${mensaje}</p>
</div>
<%@include file="footer.jsp"%>
</body>
</html>