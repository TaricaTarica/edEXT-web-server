<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="interfaces.Fabrica"%>
<%@page import="interfaces.IControladorCurso"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="header.jsp"%>
<title>Alta de Curso</title>
</head>
<body>
<br>
<div class = container mt-4>
<form action="continuarAltaCurso.jsp" method="post">
  <div class = "card">	
		<div class = "card-header">
			<h4>Alta de Curso</h4>
		</div>
  <div class = "card-body">
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
  <div class="form-group">
    <label for="InputNombre">Nombre</label>
    <input name="nombre" type="text" class="form-control" id="InputNombre" aria-describedby="nombreHelp">
    <small id="emailHelp" class="form-text text-muted">Identificará al curso y debe ser único.</small>
  </div>
  <div class="form-group">
    <label for="InputDescripcion">Descripción</label>
    <textarea name="descripcion" class="form-control" id="InputDescripcion" rows="2"></textarea>
  </div>
  <div class="form-group">
    <label for="InputDuracion">Duración</label>
    <input name="duracion" type="text" class="form-control" id="InputDuracion">
  </div>
  <div class="form-group">
    <label for="InputCantidadHoras">Cantidad de horas</label>
    <input name="canthoras" type="text" class="form-control" id="InputCantidadHoras">
  </div>
  <div class="form-group">
    <label for="InputCreditos">Créditos</label>
    <input name="creditos" type="text" class="form-control" id="InputCreditos">
  </div>
  <div class="form-group">
    <label for="InputURL">URL</label>
    <input name="url" type="text" class="form-control" id="InputURL">
  </div>
  </div>
  <div class = "card-footer">
  	<button type="submit" class="btn btn-primary">Continuar</button>
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