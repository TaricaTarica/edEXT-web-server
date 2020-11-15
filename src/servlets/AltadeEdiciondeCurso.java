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


import datatypes.DtEdicion;
import excepciones.EdicionRepatida_Exception;
import interfaces.Fabrica;
import interfaces.IControladorCurso;


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
		LocalDate inicio =LocalDate.parse(fini, formatter);
		LocalDate fin = LocalDate.parse(ffin, formatter);
		
		
		/*LOCALDATE TO CALENDAR*/
		Calendar fechaCalendarP = GregorianCalendar.from(fechaPub.atStartOfDay(ZoneId.systemDefault()));
		Calendar fechaCalendarI = GregorianCalendar.from(inicio.atStartOfDay(ZoneId.systemDefault()));
		Calendar fechaCalendarF = GregorianCalendar.from(fin.atStartOfDay(ZoneId.systemDefault()));
		/*LOCALDATE TO CALENDAR*/
		
		
		DtEdicion edicion = new DtEdicion(nombre,fechaCalendarI,fechaCalendarF,c,fechaCalendarP);
		
		Fabrica fab = Fabrica.getInstancia();
		IControladorCurso iconCur = fab.getIControladorCurso();
		
		RequestDispatcher rd;
		
		try {
			iconCur.AltadeEdiciondeCurso(edicion, instituto, curso);
			if(docentes != null){
				for(int i = 0; i<docentes.length; i++) {
					iconCur.asociarEdicion(docentes[i], edicion, instituto, curso);
				}
			}
			request.setAttribute("mensaje", "Se ha registrado correctamente la edicion " + nombre );
			rd = request.getRequestDispatcher("/notificacion.jsp");
			rd.forward(request, response);
		}
		catch(EdicionRepatida_Exception e) {
			request.setAttribute("error", e.getMessage());
			rd = request.getRequestDispatcher("/altadeEdiciondeCurso.jsp");
			rd.forward(request, response);
		}
		
	}

}