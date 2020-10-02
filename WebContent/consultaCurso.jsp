<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="interfaces.Fabrica"%>
<%@page import="interfaces.IControladorCurso"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="header.jsp"%>

<title>Consultar Curso</title>
</head>
<body>
<form action="cargarConsultaCurso" method="post">
<div class="card">
  <div class="card-body">
    <h5 class="card-title">Filtro</h5>
	<div class="form-check">
  		  <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="instituto" checked onchange="habilitar(this.value)">
  		<label class="form-check-label" for="rbinstituto">
    	Instituto
  		</label>
	</div>
  <div id = "institutos" class="form-group">
    			<select name ="cb_Instituto" class="form-control" id="cbinstitutos">
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
  <div class="form-check">
  	<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="categoria" onchange="habilitar(this.value)">
  	<label class="form-check-label" for="rbcategoria">
    Categoría
  	</label>
	</div>
  <div id = "categorias" class="form-group">
    			<select name ="cb_Categoria" class="form-control" id="cbcategorias">
      				<%
      					String[] nombreCategorias = iconCur.listarCategorias();	
      				
    					i = 0;
    					while(i < nombreCategorias.length){ %>
    					<option><%= nombreCategorias[i]%></option>
    					<%i++;
    					}%> 		 
     		 	
    			</select>
  	</div>
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
	<%if(request.getAttribute("inst") != null){%>
		<div class="card">
		<div class="card-header">
    		Cursos asociados al instituto <%=(String) request.getAttribute("inst")%>
  		</div>
  		<div class="card-body">
	<% String nombreInstituto = (String) request.getAttribute("inst"); 
	   String[] cursos = iconCur.listarCursos(nombreInstituto);	
		//<input type="hidden" name="instituto" value="instituto">
		for(i = 0; i<cursos.length; i++){%>
			<div class="list-group">
  				<a href="infoCurso.jsp?nombreInstituto=<%=nombreInstituto%>&nombreCurso=<%=cursos[i]%>" class="list-group-item list-group-item-action"><%=cursos[i]%></a>
			</div>	
	<% }
	
	  }%>
	   </div>
	</div> 
	 <%if(request.getAttribute("cate") != null){%>
		<div class="card">
		<div class="card-header">
    		Cursos asociados a la categoría <%=(String) request.getAttribute("cate")%>
  		</div>
  		<div class="card-body">
	<% String nombreCategoria = (String) request.getAttribute("cate"); 
	   String[] cursosCat = iconCur.listarCursosCategoria(nombreCategoria);	
		for(i = 0; i<cursosCat.length; i++){%>
			<div class="list-group">
  				<a href="infoCurso.jsp?nombreCategoria=<%=nombreCategoria%>&nombreCurso=<%=cursosCat[i]%>" class="list-group-item list-group-item-action"><%=cursosCat[i]%></a>
			</div>	
	<% }
	
	  }%>
	   </div>
	</div>
<%@include file="footer.jsp"%>
</body>
</html>