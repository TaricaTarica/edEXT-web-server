package servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datatypes.DtProgramaFormacion;
import datatypes.DtUsuario;
import datatypes.DtinfoEdicion;
import excepciones.InscripcionRepetidaPF_Exception;
import interfaces.Fabrica;
import interfaces.IControladorCurso;


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
		DtUsuario usr = (DtUsuario) sesion.getAttribute("usuario");
		String nicknameEstudiante = usr.getNickname();
		LocalDate fechaInscripcion = LocalDate.now();
		
		Fabrica fab = Fabrica.getInstancia();
		IControladorCurso iconCur = fab.getIControladorCurso();
		
		DtProgramaFormacion programa = iconCur.ConsultaProgramaFormacion(nombrePrograma);
		LocalDate fechaI = programa.getFechaInicio();
		LocalDate fechaF = programa.getFechaFin();
		
		RequestDispatcher rd;
		
		
		if(fechaInscripcion.isAfter(fechaI) && fechaInscripcion.isBefore(fechaF)) {
		
					try{
						iconCur.InscripcionaProgramaFormacion(fechaInscripcion, nicknameEstudiante, nombrePrograma);
						request.setAttribute("mensaje", "Felicidades "+nicknameEstudiante+" te has inscrito correctamente a el programa "+nombrePrograma);
						rd = request.getRequestDispatcher("/notificacion.jsp");
						rd.forward(request, response);
					}
					catch(InscripcionRepetidaPF_Exception ex){
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

}
