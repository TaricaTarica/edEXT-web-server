package servlets;

import java.io.IOException;
import java.rmi.RemoteException;
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

import publicadores.ControladorUsuarioPublish;
import publicadores.ControladorUsuarioPublishService;
import publicadores.ControladorUsuarioPublishServiceLocator;

import publicadores.DtDocente;
import publicadores.DtEstudiante;



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
	
		/*convert String to LocalDate*/
		LocalDate fn =  LocalDate.parse(fnac, formatter);
		Calendar fechaCalendar = GregorianCalendar.from(fn.atStartOfDay(ZoneId.systemDefault()));
		
		RequestDispatcher rd;
		
		
		if(contrasenia.equals(ccontrasenia)) {
			//ESTUDIANTE
			if(request.getParameter("cb_Docente") == null) {
				
				publicadores.DtEstudiante est = new publicadores.DtEstudiante();
				est.setNickname(nickname);
				est.setNombre(nombre);
				est.setApellido(apellido);
				est.setCorreo(correo);
				est.setFechaNac(fechaCalendar);
				est.setContrasenia(contrasenia);
				try {
					confirmarAltaEstudiante(est);
				}
				catch(Exception e) {
					throw new ServletException(e.getMessage());
				}
				
				request.setAttribute("mensaje", "Se ha registrado correctamente al estudiante " + nombre );
				rd = request.getRequestDispatcher("/notificacion.jsp");
				rd.forward(request, response);
			}
			
			//DOCENTE
			else {
				publicadores.DtDocente doc = new publicadores.DtDocente();
				doc.setNickname(nickname);
				doc.setNombre(nombre);
				doc.setApellido(apellido);
				doc.setCorreo(correo);
				doc.setFechaNac(fechaCalendar);
				doc.setContrasenia(contrasenia);
				try {
					ingresarInstitutoDocente(request.getParameter("cb_Instituto"));
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				try {
					confirmarAltaDocente(doc);
				}
				catch(Exception e) {
					throw new ServletException(e.getMessage());
				}
				request.setAttribute("mensaje", "Se ha registrado correctamente al docente " + nombre );
				rd = request.getRequestDispatcher("/notificacion.jsp");
				rd.forward(request, response);
			}
		}
		else{
			request.setAttribute("error", "Las contraseñas no coinciden, MANCO");
			rd = request.getRequestDispatcher("/Registrarse.jsp");
			rd.forward(request, response);
		}

	}
	public void confirmarAltaEstudiante(DtEstudiante usr) throws Exception {
		ControladorUsuarioPublishService cps = new ControladorUsuarioPublishServiceLocator();
		ControladorUsuarioPublish port = cps.getControladorUsuarioPublishPort();
		port.confirmarAltaEstudiante(usr);
	}
	public void confirmarAltaDocente(DtDocente usr) throws Exception {
		ControladorUsuarioPublishService cps = new ControladorUsuarioPublishServiceLocator();
		ControladorUsuarioPublish port = cps.getControladorUsuarioPublishPort();
		port.confirmarAltaDocente(usr);
	}
	public void ingresarInstitutoDocente(String nombreInstituto) throws Exception {
		ControladorUsuarioPublishService cps = new ControladorUsuarioPublishServiceLocator();
		ControladorUsuarioPublish port = cps.getControladorUsuarioPublishPort();
		port.ingresarInstitutoDocente(nombreInstituto);
	}

}
