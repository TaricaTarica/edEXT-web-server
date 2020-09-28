package servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import interfaces.Fabrica;
import interfaces.IControladorUsuario;
import datatypes.DtDocente;
import datatypes.DtEstudiante;
import datatypes.DtUsuario;
import excepciones.UsuarioRepetido_Exception;

@WebServlet("/RegistrarUsuario")
public class RegistrarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegistrarUsuario() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickname = request.getParameter("nickname");
		String correo = request.getParameter("correo");
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		String fnac = request.getParameter("fnac");
		String contrasenia = request.getParameter("contrasenia");
		String ccontrasenia = request.getParameter("ccontrasenia");
		
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d/MM/yyyy");
	
		//convert String to LocalDate
		LocalDate fn = LocalDate.parse(fnac, formatter);
		
		Fabrica fab = Fabrica.getInstancia();
		IControladorUsuario iconUsr = fab.getIControladorUsuario();
		RequestDispatcher rd;
		
		DtUsuario usr = null;
	
		if(request.getParameter("cb_Docente") == null) {
			
			usr = new DtEstudiante(nickname, nombre, apellido, correo, fn, contrasenia);
			try {
				iconUsr.confirmarAlta(usr);
			}
			catch(UsuarioRepetido_Exception e) {
				throw new ServletException(e.getMessage());
			}
			
			request.setAttribute("mensaje", "Se ha registrado correctamente al estudiante " + nombre );
			rd = request.getRequestDispatcher("/notificacion.jsp");
			rd.forward(request, response);
		}
		else {
			usr = new DtDocente(nickname, nombre, apellido, correo, fn, contrasenia);
			iconUsr.ingresarInstitutoDocente(request.getParameter("cb_Instituto"));
			try {
				iconUsr.confirmarAlta(usr);
			}
			catch(UsuarioRepetido_Exception e) {
				throw new ServletException(e.getMessage());
			}
			request.setAttribute("mensaje", "Se ha registrado correctamente al docente " + nombre );
			rd = request.getRequestDispatcher("/notificacion.jsp");
			rd.forward(request, response);
		}
		
	}

}
