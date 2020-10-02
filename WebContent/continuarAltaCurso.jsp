<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@page import="interfaces.Fabrica"%>
<%@page import="interfaces.IControladorCurso"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="header.jsp"%>
<title>Alta Curso</title>
</head>
<body>
<%
	String instituto = request.getParameter("cb_Instituto");
	String nombre = request.getParameter("nombre");
	String descripcion = request.getParameter("descripcion");
	String duracion = request.getParameter("duracion");
	String cantHoras = request.getParameter("canthoras");
	String creditos = request.getParameter("creditos");
	String url = request.getParameter("url"); 
%>

<h1 align=center>Alta de Curso</h1>
<form action="AltaCurso" method="post">
	<input type="hidden" name="instituto" value="<%=instituto%>">
	<input type="hidden" name="nombre" value="<%=nombre%>">
	<input type="hidden" name="descripcion" value="<%=descripcion%>">
	<input type="hidden" name="duracion" value="<%=duracion%>">
	<input type="hidden" name="canthoras" value="<%=cantHoras%>">
	<input type="hidden" name="creditos" value="<%=creditos%>">
	<input type="hidden" name="url" value="<%=url%>">
	<div class="form-group">
    	<label for="exampleFormControlSelect2">Previas</label>
    	<select name="previas[]" multiple class="form-control" id="exampleFormControlSelect2">
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
    	<label for="categoriaControlSelect2">Categorias</label>
    	<select name="categorias[]" multiple class="form-control" id="exampleFormControlSelect2">
      		<%
    			String[] categorias = iconCur.listarCategorias();
    			i = 0;
    			while(i<categorias.length){%>
      				<option><%= categorias[i]%></option>
      			<%i++;
      			}%>
    	</select>
  	</div>
	<button type="submit" class="btn btn-primary">Confirmar</button>
	
</form>
<%@include file="footer.jsp"%>
</body>
</html>