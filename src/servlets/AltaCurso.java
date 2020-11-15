package servlets;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.rpc.ServiceException;

import com.toedter.calendar.JDateChooser;



import publicadores.ControladorCursoPublish;
import publicadores.ControladorCursoPublishService;
import publicadores.ControladorCursoPublishServiceLocator;


@WebServlet("/AltaCurso")
public class AltaCurso extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AltaCurso() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String instituto = request.getParameter("instituto");
		String nombre = request.getParameter("nombre");
		String descripcion = request.getParameter("descripcion");
		String duracion = request.getParameter("duracion");
		String cantHoras = request.getParameter("canthoras");
		int h = Integer.parseInt(cantHoras);
		String creditos = request.getParameter("creditos");
		int c = Integer.parseInt(creditos);
		String url = request.getParameter("url");
		String[] previas = request.getParameterValues("previas[]");
		String[] categorias = request.getParameterValues("categorias[]");
		
		String imgCurso = "";
		
		//File origen = null;
		//File destino = null;
		
		LocalDate fechaAlta = LocalDate.now();
		Calendar fechaCalendar = GregorianCalendar.from(fechaAlta.atStartOfDay(ZoneId.systemDefault()));
		
		publicadores.DtCurso curso = new publicadores.DtCurso();
		curso.setNombre(nombre);
		curso.setDescripcion(descripcion);
		curso.setDuracion(duracion);
		curso.setHoras(h);
		curso.setCreditos(c);
		curso.setFechaAlta(fechaCalendar);
		curso.setUrl(url);
		curso.setImg(imgCurso);
		curso.setNombreInst(instituto);
		
		/*if(!imgCurso.isEmpty()) { //si el path no es vac�o -> cargaron imagen.
			origen = new File(imgCurso); //obtengo el archivo a partir de la ruta que recib�
			String imgDestino = "C:\\Users\\tarica\\eclipse-workspace\\edextSW\\WebContent\\imagenes\\imgCursos\\"+curso.getNombre()+".jpg"; //determino ruta destino con el nombredel curso y la extensi�n (por ahora la fuerzo a que sea jpg)
			destino = new File(imgDestino); 
			curso.setImg(imgDestino);
		}*/
		
		
		RequestDispatcher rd;
		
		try {
			/*if(!imgCurso.isEmpty()){
				Files.copy(origen.toPath(), destino.toPath()); //copio la imagen del destino al origen.
			}*/
			crearCurso(curso, instituto);
			if(previas != null){
				for(int i = 0; i<previas.length; i++) {
					agregarPrevia(previas[i], instituto, curso.getNombre());
				}
			}
			if(categorias != null){
				for(int i = 0; i< categorias.length; i++) {
					agregarCategorias(categorias[i], instituto, curso.getNombre());
				}
				
			}
			request.setAttribute("mensaje", "Se ha registrado correctamente el curso " + nombre );
			rd = request.getRequestDispatcher("/notificacion.jsp");
			rd.forward(request, response);
		}
		catch(Exception e) {
			request.setAttribute("error", e.getMessage());
			rd = request.getRequestDispatcher("/altaCurso.jsp");
			rd.forward(request, response);
		}
		
	}
	public void crearCurso(publicadores.DtCurso curso, String instituto) throws Exception {
		ControladorCursoPublishService cps = new ControladorCursoPublishServiceLocator();
		ControladorCursoPublish port = cps.getControladorCursoPublishPort();
		port.altaCurso(curso, instituto);
	}
	public void agregarPrevia(String nombrePrevia, String nombreInstituto, String nombreCurso) throws Exception {
		ControladorCursoPublishService cps = new ControladorCursoPublishServiceLocator();
		ControladorCursoPublish port = cps.getControladorCursoPublishPort();
		port.agregarPrevia(nombrePrevia, nombreInstituto, nombreCurso);
	}
	public void agregarCategorias(String nombreCategoria, String nombreInstituto, String nombreCurso) throws Exception {
		ControladorCursoPublishService cps = new ControladorCursoPublishServiceLocator();
		ControladorCursoPublish port = cps.getControladorCursoPublishPort();
		port.agregarCategorias(nombreCategoria, nombreInstituto, nombreCurso);
	}

}
