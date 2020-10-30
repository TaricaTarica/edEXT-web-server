<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="interfaces.Fabrica"%>
<%@page import="interfaces.IControladorCurso"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="header.jsp"%>

<title>Consultar Programa de Formación</title>
</head>
<body>
<br>
<div class = container mt-4>
	<form action="ContinuarConsultaProgramaFormacion.jsp" method="post">
		<div class="card">
			<div class = "card-header">
				<h4>Consultar Programa de Formación</h4>
			</div>
  		<div class="card-body">

  		<div id = "programas" class="form-group">
  		  	<label class="form-check-label" for="rbinstituto">Programas de Formación</label>
    			<select name ="cb_Programa" class="form-control" id="cbprogramas">
      				<%
      					Fabrica fab = Fabrica.getInstancia();
      					IControladorCurso iconCur = fab.getIControladorCurso();
      					String[] nombreProgramas = iconCur.listarProgFormacion();
      				
    					int i = 0;
    					while(i < nombreProgramas.length){ %>
    					<option><%= nombreProgramas[i]%></option>
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