<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="publicadores.ControladorCursoPublish"%>
<%@page import="publicadores.ControladorCursoPublishService"%>
<%@page import="publicadores.ControladorCursoPublishServiceLocator"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="header.jsp"%>
<title>Inscribirse a Edición de Curso</title>
</head>
<body>
<br>
<div class = container mt-4>
<form action="cargarInscripcionEd" method="post">
	<div class="card">
			<div class = "card-header">
				<h4>Inscribirse a Edición de Curso</h4>
			</div>
  		<div class="card-body">
				<div class="form-check">
		  		  <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="instituto" checked onchange="habilitar(this.value)">
		  			<label class="form-check-label" for="rbinstituto">Instituto</label>
				</div>
  			<div id = "institutos" class="form-group">
    			<select name ="cb_Instituto" class="form-control" id="cbinstitutos">
      				<%
	      				ControladorCursoPublishService cps = new ControladorCursoPublishServiceLocator();
						ControladorCursoPublish port = cps.getControladorCursoPublishPort();
      					String[] nombreInstitutos = port.listarInstitutos();	
      				
    					int i = 0;
    					while(i < nombreInstitutos.length){ %>
    					<option><%= nombreInstitutos[i]%></option>
    					<%i++;
    					}%> 		 	 	
    			</select>
  			</div>
	  		<div class="form-check">
	  			<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="categoria" onchange="habilitar(this.value)">
	  				<label class="form-check-label" for="rbcategoria">
	    				Categoría
	  				</label>
			</div>
	  		<div id = "categorias" class="form-group">
	    			<select name ="cb_Categoria" class="form-control" id="cbcategorias">
	      				<%
      					String[] nombreCategorias = port.listarCategorias();				
    					i = 0;
    					while(i < nombreCategorias.length){ %>
    					<option><%= nombreCategorias[i]%></option>
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


<script type="text/javascript">
	function habilitar(value)
	{
		elementIns = document.getElementById("institutos");
		elementCat = document.getElementById("categorias");
		
		if(value=="instituto")
		{
			// habilitamos
			document.getElementById("cbinstitutos").disabled=false;
			elementIns.style.display='block';
			elementCat.style.display='none';
			document.getElementById("cbcategorias").disabled=true;
		}else{
			// deshabilitamos
			document.getElementById("cbinstitutos").disabled=true;
			document.getElementById("cbcategorias").disabled=false;
			elementIns.style.display='none';
			elementCat.style.display='block';
		}
	}
</script>

<br>
<%if(request.getAttribute("inst") != null){%>
	<div class="card">
		<div class="card-header">
   			Cursos asociados al instituto <b><%=(String) request.getAttribute("inst")%></b>
 		</div>
 		<div class="card-body">
			<% String nombreInstituto = (String) request.getAttribute("inst"); 
			   String[] cursos = port.listarCursos(nombreInstituto);	
				//<input type="hidden" name="instituto" value="instituto">
				for(i = 0; i<cursos.length; i++){%>
					<li class="list-group-item d-flex justify-content-between"><p class="p-0 m-0 flex-grow-1"><%=cursos[i]%></p> 
		 					<a href="continuarInscripcionEd.jsp?nombreInstituto=<%=nombreInstituto%>&nombreCurso=<%=cursos[i]%>" class="btn btn-primary">Ver ediciones</a>
					</li>	
			<%}%>
		</div>
	</div> 
  <%}
  if(request.getAttribute("cate") != null){%>
	<div class="card">
		<div class="card-header">
   			Cursos asociados a la categoría <b><%=(String) request.getAttribute("cate")%></b>
		</div>
		<div class="card-body">
			<% String nombreCategoria = (String) request.getAttribute("cate"); 
			   String[] cursosCat = port.listarCursosCategoria(nombreCategoria);	
				for(i = 0; i<cursosCat.length; i++){%>
						<li class="list-group-item d-flex justify-content-between"><p class="p-0 m-0 flex-grow-1"><%=cursosCat[i]%></p> 
			 					<a href="continuarInscripcionEd.jsp?nombreCategoria=<%=nombreCategoria%>&nombreCurso=<%=cursosCat[i]%>" class="btn btn-primary">Ver ediciones</a>
						</li>	
			<%}%>
		</div>
	</div>
  <%}%>
	   
</div>
<%@include file="footer.jsp"%>
</body>
</html>