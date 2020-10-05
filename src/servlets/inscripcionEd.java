package servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import datatypes.DtUsuario;
import excepciones.InscripcionRepetida_Exception;
import interfaces.Fabrica;
import interfaces.IControladorCurso;


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
		DtUsuario usr = (DtUsuario) sesion.getAttribute("usuario");
		String nicknameEstudiante = usr.getNickname();
		Date fechaInscripcion = new Date();
		
		
		
		Fabrica fab = Fabrica.getInstancia();
		IControladorCurso iconCur = fab.getIControladorCurso();
		RequestDispatcher rd;
		try{
			iconCur.InscripcionaEdiciondeCurso(nombreInstituto,fechaInscripcion,nicknameEstudiante,nombreCurso,nombreEdicion);
			request.setAttribute("mensaje", "Felicidades "+nicknameEstudiante+" te has inscrito correctamente a la edición "+nombreEdicion);
			rd = request.getRequestDispatcher("/notificacion.jsp");
			rd.forward(request, response);
		}
		catch(InscripcionRepetida_Exception ex){
			request.setAttribute("error", ex.getMessage());
			rd = request.getRequestDispatcher("/continuarInscripcionEd.jsp");
			rd.forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
