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
import javax.xml.rpc.ServiceException;

import publicadores.DtProgramaFormacion;
import publicadores.ControladorCursoPublish;
import publicadores.ControladorCursoPublishService;
import publicadores.ControladorCursoPublishServiceLocator;
import publicadores.CrearProgramaFormacionRepetido_Exception;


@WebServlet("/CrearProgramaF")
public class CrearProgramaF extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CrearProgramaF() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String nombre = request.getParameter("nombre");
		String descripcion = request.getParameter("descripcion");
		String fIni = request.getParameter("fini");
		String fFin = request.getParameter("ffin");
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d/MM/yyyy");
		
		//convert String to LocalDate
		LocalDate fi = LocalDate.parse(fIni, formatter);
		LocalDate ff = LocalDate.parse(fFin, formatter);
		LocalDate fa = LocalDate.now();
		
		/*LOCALDATE TO CALENDAR*/
		Calendar fechaCalendarI = GregorianCalendar.from(fi.atStartOfDay(ZoneId.systemDefault()));
		Calendar fechaCalendarF = GregorianCalendar.from(ff.atStartOfDay(ZoneId.systemDefault()));
		Calendar fechaCalendarA = GregorianCalendar.from(fa.atStartOfDay(ZoneId.systemDefault()));
		/*LOCALDATE TO CALENDAR*/
		
		RequestDispatcher rd;
		
		DtProgramaFormacion pf = new DtProgramaFormacion();
		pf.setNombre(nombre);
		pf.setDescripcion(descripcion);
		pf.setFechaInicio(fechaCalendarI);
		pf.setFechaFin(fechaCalendarF);
		pf.setFechaAlta(fechaCalendarA);
		try {
			AltaCrearProgramadeFormacion(pf);
		}
		catch(CrearProgramaFormacionRepetido_Exception e) {
			throw new ServletException(e.getMessage());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("mensaje", "Se ha creado correctamente el programa " + nombre );
		rd = request.getRequestDispatcher("/notificacion.jsp");
		rd.forward(request, response);
		
	}
	public void AltaCrearProgramadeFormacion(DtProgramaFormacion pf) throws Exception {
		ControladorCursoPublishService cps = new ControladorCursoPublishServiceLocator();
		ControladorCursoPublish port = cps.getControladorCursoPublishPort();
		port.altaCrearProgramadeFormacion(pf);
	}

}
