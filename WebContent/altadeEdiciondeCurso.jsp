<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="interfaces.Fabrica"%>
<%@page import="interfaces.IControladorCurso"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="header.jsp"%>
<title>Alta de Edicion de Curso</title>
</head>
<br>
<div class = container mt-4>
<%if(request.getAttribute("error") != null){%>
  		<div class="alert alert-danger">${error}</div>
<%}%>
<form action="ContinuarAltadeEdiciondeCurso.jsp" method="post">
 	 <div class = "card">	
 	 <div class = "card-header">
			<h4>Alta de Edición</h4>
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
		<label for="InputNombre">Nombre</label> <input type="text" name="nombre"
		class="form-control" id="InputNombre"
		placeholder="ingresar nombre">
  </div>
  <div class="form-group">
    <label for="InputCupo">Cupo</label>
    <input name="cupo" type="text" class="form-control" id="InputCupo">
  </div>
  </div>
  </div>
  <div class = "card-footer">			
  	<button type="submit" class="btn btn-primary">Continuar</button>
  </div>
 </div>
</form>

<%@include file="footer.jsp"%>
</body>
</html>