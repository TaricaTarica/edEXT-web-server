package servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import javax.xml.rpc.ServiceException;

import publicadores.ControladorCursoPublish;
import publicadores.ControladorCursoPublishService;
import publicadores.ControladorCursoPublishServiceLocator;



@WebServlet("/inscripcionEd")
public class inscripcionEd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public inscripcionEd() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nombreInstituto = request.getParameter ("nombreInstituto");
		String nombreCurso = request.getParameter ("nombreCurso");
		String nombreEdicion = request.getParameter ("nombreEdicion");
		HttpSession sesion = request.getSession();
		publicadores.DtUsuario usr = (publicadores.DtUsuario) sesion.getAttribute("usuario");
		String nicknameEstudiante = usr.getNickname();
		String estadoInscripcion = "Inscripto";
		LocalDate fechaInscripcion = LocalDate.now();
		Calendar fechaCalendarInscripcion = GregorianCalendar.from(fechaInscripcion.atStartOfDay(ZoneId.systemDefault()));
		
		
		ControladorCursoPublishService cps = new ControladorCursoPublishServiceLocator();
		ControladorCursoPublish port = null;
		try {
			port = cps.getControladorCursoPublishPort();
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		publicadores.DtinfoEdicion edicion = port.consultaEdicion(nombreInstituto, nombreCurso, nombreEdicion);
		Calendar fechaI = edicion.getFechaInicio();
		Calendar fechaF = edicion.getFechaFin();
		
		LocalDate fechaLocalDateI = LocalDateTime.ofInstant(fechaI.toInstant(), fechaI.getTimeZone().toZoneId()).toLocalDate();
		LocalDate fechaLocalDateF = LocalDateTime.ofInstant(fechaF.toInstant(), fechaF.getTimeZone().toZoneId()).toLocalDate();
		RequestDispatcher rd;
		
		if(fechaInscripcion.isAfter(fechaLocalDateI) && fechaInscripcion.isBefore(fechaLocalDateF)) {
		
						try{
							port.inscripcionaEdiciondeCurso(nombreInstituto, fechaCalendarInscripcion, nicknameEstudiante, nombreCurso, nombreEdicion, estadoInscripcion);
							request.setAttribute("mensaje", "Felicidades "+nicknameEstudiante+" te has inscripto correctamente a la edición "+nombreEdicion+".");
							rd = request.getRequestDispatcher("/notificacion.jsp");
							rd.forward(request, response);
						}
						catch(publicadores.InscripcionRepetida_Exception ex){
							request.setAttribute("error", ex.getMessage());
							rd = request.getRequestDispatcher("/continuarInscripcionEd.jsp");
							rd.forward(request, response);
						}		
						
		}
		else {
			request.setAttribute("error", "La edicion de curso no es vigente");
			rd = request.getRequestDispatcher("/continuarInscripcionEd.jsp");
			rd.forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
