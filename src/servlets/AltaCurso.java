package servlets;

import java.io.IOException;
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
		
		
		
		LocalDate fechaAlta = LocalDate.now();
		
		DtCurso curso = new DtCurso(nombre, descripcion, duracion, h, c, fechaAlta, url);
		
		Fabrica fab = Fabrica.getInstancia();
		IControladorCurso iconCur = fab.getIControladorCurso();
		
		RequestDispatcher rd;
		
		try {
			iconCur.AltaCurso(curso, instituto);
			for(int i = 0; i<previas.length; i++) {
				iconCur.agregarPrevia(previas[i], instituto, curso.getNombre());
			}
			for(int i =0; i< categorias.length; i++) {
				iconCur.agregarCategorias(categorias[i], instituto, curso.getNombre());
			}
			request.setAttribute("mensaje", "Se ha registrado correctamente el curso " + nombre );
			rd = request.getRequestDispatcher("/notificacion.jsp");
			rd.forward(request, response);
		}
		catch(CursoRepetido_Exception e) {
			throw new ServletException(e.getMessage());
		}
		
	}

}
