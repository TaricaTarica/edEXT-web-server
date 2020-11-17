package servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.rpc.ServiceException;

import publicadores.ControladorCursoPublish;
import publicadores.ControladorCursoPublishService;
import publicadores.ControladorCursoPublishServiceLocator;
import publicadores.DtProgramaFormacion;
import publicadores.DtUsuario;
import publicadores.DtinfoEdicion;
import publicadores.InscripcionRepetidaPF_Exception;



@WebServlet("/inscripcionPF")
public class inscripcionPF extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public inscripcionPF() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
	}
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nombrePrograma = request.getParameter ("cb_Programa");
		HttpSession sesion = request.getSession();
		publicadores.DtUsuario usr = (DtUsuario) sesion.getAttribute("usuario");
		String nicknameEstudiante = usr.getNickname();
		LocalDate fechaInscripcion = LocalDate.now();
		LocalDate fechaLocalDateI = null, fechaLocalDateF = null;
		
		
		DtProgramaFormacion programa;
		try {
			programa = ConsultaProgramaFormacion(nombrePrograma);
			Calendar fechaI = programa.getFechaInicio();
			Calendar fechaF = programa.getFechaFin();
			/*CALENDAR TO LOCALDATE*/
			Calendar calendarI = fechaI;
			fechaLocalDateI = LocalDateTime.ofInstant(calendarI.toInstant(), calendarI.getTimeZone().toZoneId()).toLocalDate();
			Calendar calendarF = fechaF;
			fechaLocalDateF = LocalDateTime.ofInstant(calendarF.toInstant(), calendarF.getTimeZone().toZoneId()).toLocalDate();
			/*CALENDAR TO LOCALDATE*/
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher rd;
		if(fechaInscripcion.isAfter(fechaLocalDateI) && fechaInscripcion.isBefore(fechaLocalDateF)) {
		
					try{
						Calendar fechaCalendar = GregorianCalendar.from(fechaInscripcion.atStartOfDay(ZoneId.systemDefault()));
						InscripcionaProgramaFormacion(fechaCalendar, nicknameEstudiante, nombrePrograma);
						request.setAttribute("mensaje", "Felicidades "+nicknameEstudiante+" te has inscrito correctamente a el programa "+nombrePrograma);
						rd = request.getRequestDispatcher("/notificacion.jsp");
						rd.forward(request, response);
					}
					catch(Exception ex){
						request.setAttribute("error", ex.getMessage());
						rd = request.getRequestDispatcher("/InscribirseProgramaFormacion.jsp");
						rd.forward(request, response);
					}
		
		
		}
		else {
			request.setAttribute("error", "El programa de formación no es vigente");
			rd = request.getRequestDispatcher("/InscribirseProgramaFormacion.jsp");
			rd.forward(request, response);
		}
		
	}
	public DtProgramaFormacion ConsultaProgramaFormacion(String nombrePrograma) throws Exception {
		ControladorCursoPublishService cps = new ControladorCursoPublishServiceLocator();
		ControladorCursoPublish port = cps.getControladorCursoPublishPort();
		return port.consultaProgramaFormacion(nombrePrograma);
	}
	public void InscripcionaProgramaFormacion(Calendar fechaInscripcion, String nicknameEstudiante, String nombrePrograma) throws Exception {
		ControladorCursoPublishService cps = new ControladorCursoPublishServiceLocator();
		ControladorCursoPublish port = cps.getControladorCursoPublishPort();
		port.inscripcionaProgramaFormacion(fechaInscripcion, nicknameEstudiante, nombrePrograma);
	}

}
