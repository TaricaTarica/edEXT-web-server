package servlets;

import java.io.IOException;
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

import publicadores.ControladorCursoPublish;
import publicadores.ControladorCursoPublishService;
import publicadores.ControladorCursoPublishServiceLocator;


@WebServlet("/AltadeEdiciondeCurso")
public class AltadeEdiciondeCurso extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AltadeEdiciondeCurso() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String instituto = request.getParameter("instituto");
		String nombre = request.getParameter("nombre");
		String cupo = request.getParameter("cupo");
		String fini = request.getParameter("fini");
		String ffin = request.getParameter("ffin");
		int c = Integer.parseInt(cupo);
		String curso = request.getParameter("curso");
		String[] docentes = request.getParameterValues("docentes[]");

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d/MM/yyyy");
		
		
		LocalDate fechaPub = LocalDate.now();
		Calendar fechaPubCalendar = GregorianCalendar.from(fechaPub.atStartOfDay(ZoneId.systemDefault()));
		LocalDate inicio =LocalDate.parse(fini, formatter);
		Calendar fechaIniCalendar = GregorianCalendar.from(fechaPub.atStartOfDay(ZoneId.systemDefault()));
		LocalDate fin = LocalDate.parse(ffin, formatter);
		Calendar fechaFinCalendar = GregorianCalendar.from(fechaPub.atStartOfDay(ZoneId.systemDefault()));
		
		publicadores.DtEdicion edicion = new publicadores.DtEdicion();
		edicion.setNombre(nombre);
		edicion.setFechaInicio(fechaIniCalendar);
		edicion.setFechaFin(fechaFinCalendar);
		edicion.setFechaPub(fechaPubCalendar);
		edicion.setCupo(c);
		
		RequestDispatcher rd;
		
		try {
			altadeEdiciondeCurso(edicion, instituto, curso);
			if(docentes != null){
				for(int i = 0; i<docentes.length; i++) {
					asociarEdicion(docentes[i], edicion, instituto, curso);
				}
			}
			request.setAttribute("mensaje", "Se ha registrado correctamente la edicion " + nombre );
			rd = request.getRequestDispatcher("/notificacion.jsp");
			rd.forward(request, response);
		}
		catch(Exception e) {
			request.setAttribute("error", e.getMessage());
			rd = request.getRequestDispatcher("/altadeEdiciondeCurso.jsp");
			rd.forward(request, response);
		}
		
	}
	public void altadeEdiciondeCurso(publicadores.DtEdicion edicion,String instituto,String curso ) throws Exception {
		ControladorCursoPublishService cps = new ControladorCursoPublishServiceLocator();
		ControladorCursoPublish port = cps.getControladorCursoPublishPort();
		port.altadeEdiciondeCurso(edicion,instituto,curso);
	}
	public void asociarEdicion(String nombreDocentes,publicadores.DtEdicion edicion ,String instituto,String nombreCurso) throws Exception {
		ControladorCursoPublishService cps = new ControladorCursoPublishServiceLocator();
		ControladorCursoPublish port = cps.getControladorCursoPublishPort();
		port.asociarEdicion(nombreDocentes,edicion, instituto, nombreCurso);
	}
}