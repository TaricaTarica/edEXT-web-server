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
<body>
<%
	String instituto = request.getParameter("cb_Instituto");
	String nombre = request.getParameter("nombre");
	String cupo = request.getParameter("cupo");
%>
<br>
<div class = container mt-4>
<form action="AltadeEdiciondeCurso" method="post">
	<input type="hidden" name="instituto" value="<%=instituto%>">
	<input type="hidden" name="nombre" value="<%=nombre%>">
	<input type="hidden" name="cupo" value="<%=cupo%>">
	<div class = "card">	
		<div class = "card-header">
			<h4>Alta de Edición</h4>
		</div>
  	<div class = "card-body">
	<div class="form-group">
    	<label for="exampleFormControlSelect2">Cursos</label>
    	<select name="curso" multiple class="form-control" id="exampleFormControlSelect2">
      		<%	Fabrica fab = Fabrica.getInstancia();
				IControladorCurso iconCur = fab.getIControladorCurso();
    			String[] cursos = iconCur.listarCursos(instituto);
    			int i = 0;
    			while(i<cursos.length){%>
      				<option><%= cursos[i]%></option>
      			<%i++;
      			}%>
    	</select>
  	</div>
  	<div class="form-group">
    	<label for="docentesControlSelect2">Docentes</label>
    	<select name="docentes[]" multiple class="form-control" id="exampleFormControlSelect2">
      		<%
    			String[] docentes = iconCur.listarDocentes(instituto);
    			i = 0;
    			while(i<docentes.length){%>
      				<option><%= docentes[i]%></option>
      			<%i++;
      			}%>
    	</select>
  	</div>
  	 <div class="form-group">
	<label for="InputInicio">Fecha de Inicio</label> <input type="text" name="fini"
		class="form-control" id="InputInicio"
		placeholder="ingresar fecha de Inicio">
  </div>
  <div class="form-group">
	<label for="InputFin">Fecha de Fin</label> <input type="text" name="ffin"
		class="form-control" id="InputFin"
		placeholder="ingresar fecha de Fin">
  </div>
  </div>
  </div>
  	<div class = "card-footer">
 		 <button type="submit" class="btn btn-primary">Confirmar</button>
	</div>
</form>
</div>
<%@include file="footer.jsp"%>
</body>
</html>