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
import javax.servlet.http.HttpSession;


import publicadores.ControladorUsuarioPublish;
import publicadores.ControladorUsuarioPublishService;
import publicadores.ControladorUsuarioPublishServiceLocator;
//import publicadores.DtUsuario;


@WebServlet("/ModificarUsuario")
public class ModificarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ModificarUsuario() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		String fnac = request.getParameter("fnac");
		String contrasenia = request.getParameter("contrasenia");
		String ccontrasenia = request.getParameter("ccontrasenia");
		HttpSession sesion = request.getSession();
		publicadores.DtUsuario usr = (publicadores.DtUsuario) sesion.getAttribute("usuario");
		String nickname = usr.getNickname();
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d/MM/yyyy");
	
		//convert String to LocalDate
		LocalDate fn = LocalDate.parse(fnac, formatter);
		Calendar fechaCalendarInscripcion = GregorianCalendar.from(fn.atStartOfDay(ZoneId.systemDefault()));

		RequestDispatcher rd;
		
		try {
			modificarUsuario(nickname, nombre, apellido, fechaCalendarInscripcion, contrasenia);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("mensaje", "Se ha modificado correctamente al usuario " + nickname );
		rd = request.getRequestDispatcher("/notificacion.jsp");
		rd.forward(request, response);
		
	}
	//OPERACIÓN CONSUMIDA
		public void modificarUsuario(String nickname, String nombre,String apellido,Calendar fn, String contrasenia)throws Exception {
			ControladorUsuarioPublishService cups = new ControladorUsuarioPublishServiceLocator();
			ControladorUsuarioPublish port = cups.getControladorUsuarioPublishPort();
			port.modificarUsuario(nickname, nombre, apellido, fn, contrasenia);
		}
	
}
