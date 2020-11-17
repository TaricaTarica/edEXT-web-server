<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="publicadores.DtUsuario"%>
<%@page import="publicadores.ControladorCursoPublish"%>
<%@page import="publicadores.ControladorCursoPublishService"%>
<%@page import="publicadores.ControladorCursoPublishServiceLocator"%>
<!DOCTYPE html>
<html>

<head>
<%@include file="header.jsp"%>
<title>Agregar Curso a Programa de Formación</title>
</head>

<body>

<br>
<div class = container mt-4>

<%
DtUsuario usr = (DtUsuario) sesion.getAttribute("usuario");
String nickname = usr.getNickname();
String instituto;

ControladorCursoPublishService cps = new ControladorCursoPublishServiceLocator();
ControladorCursoPublish port = cps.getControladorCursoPublishPort();
	
%>


<form action="agregarCursoPF" method="post">
	<div class = "card">	
		<div class = "card-header">
			<h4>Agregar Curso a Prog. de Formación</h4>
		</div>
		<div class = "card-body">
			<div id = "programas" class="form-group">
	    		<label for="exampleFormControlSelect1">Prog. de Formación</label>
	    			<select name="cb_Programa" class="form-control" id="programa">
	      				<%      				
      					String[] nombreProgramas = port.listarProgFormacion();
    					int i = 0;
    					while(i < nombreProgramas.length){ %>
    					<option><%=nombreProgramas[i]%></option>
    					<%i++;
    					}%> 		 
	    			</select>
	   		</div>
	   		
	   		<div id = "cursos" class="form-group">
	    		<label for="exampleFormControlSelect1">Cursos</label>
	    			<select name="cb_Curso" class="form-control" id="curso">
	      				<%      		
	      				instituto = port.getInstitutoDocente(nickname);
      					String[] nombreCursos = port.listarCursos(instituto);
    					int j = 0;
    					while(j < nombreCursos.length){ %>
    					<option><%=nombreCursos[j]%></option>
    					<%j++;
    					}%> 		 
	    			</select>
	   		</div>
		</div>
		<input type="hidden" name="instituto" value="<%=instituto%>">
		<div class = "card-footer">
			<button type="submit" class="btn btn-primary">Confirmar</button>
		</div> 
 	</div>
</form>
<%if(request.getAttribute("error") != null){%>
  		<div class="alert alert-danger">${error}</div>
<%}%>
</div>
<%@include file="footer.jsp"%>
</body>
</html>