package servlets;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.toedter.calendar.JDateChooser;

import datatypes.DtCurso;
import excepciones.CursoRepetido_Exception;
import excepciones.UsuarioRepetido_Exception;
import interfaces.Fabrica;
import interfaces.IControladorCurso;


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
		
		//String imgCurso =  request.getParameter("img_curso"); //recibo string con el path de la imagen
		
		//File origen = null;
		//File destino = null;
		
		LocalDate fechaAlta = LocalDate.now();
		
		DtCurso curso = new DtCurso(nombre, descripcion, duracion, h, c, fechaAlta, url, instituto);
		
		/*if(!imgCurso.isEmpty()) { //si el path no es vac�o -> cargaron imagen.
			origen = new File(imgCurso); //obtengo el archivo a partir de la ruta que recib�
			String imgDestino = "C:\\Users\\tarica\\eclipse-workspace\\edextSW\\WebContent\\imagenes\\imgCursos\\"+curso.getNombre()+".jpg"; //determino ruta destino con el nombredel curso y la extensi�n (por ahora la fuerzo a que sea jpg)
			destino = new File(imgDestino); 
			curso.setImg(imgDestino);
		}*/
		
		Fabrica fab = Fabrica.getInstancia();
		IControladorCurso iconCur = fab.getIControladorCurso();
		
		RequestDispatcher rd;
		
		try {
			/*if(!imgCurso.isEmpty()){
				Files.copy(origen.toPath(), destino.toPath()); //copio la imagen del destino al origen.
			}*/
			iconCur.AltaCurso(curso, instituto);
			if(previas != null){
				for(int i = 0; i<previas.length; i++) {
					iconCur.agregarPrevia(previas[i], instituto, curso.getNombre());
				}
			}
			if(categorias != null){
				for(int i = 0; i< categorias.length; i++) {
					iconCur.agregarCategorias(categorias[i], instituto, curso.getNombre());
				}
				
			}
			request.setAttribute("mensaje", "Se ha registrado correctamente el curso " + nombre );
			rd = request.getRequestDispatcher("/notificacion.jsp");
			rd.forward(request, response);
		}
		catch(CursoRepetido_Exception e) {
			request.setAttribute("error", e.getMessage());
			rd = request.getRequestDispatcher("/altaCurso.jsp");
			rd.forward(request, response);
		}
		
	}

}
