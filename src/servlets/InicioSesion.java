package servlets;

import java.io.IOException;

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


@WebServlet("/InicioSesion")
public class InicioSesion extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InicioSesion() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) { 
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickname = request.getParameter("nickname");
		String contra = request.getParameter("contrasenia");
	
		try {
			if(existeUsuario(nickname)) {
				publicadores.DtUsuario usr = ConsultaUsuario(nickname);
				HttpSession sesion = request.getSession();
				RequestDispatcher rd;


					if(usr.getContrasenia().equals(contra) && sesion.getAttribute("usuario") == null) {
						sesion.setAttribute("usuario", usr);
						rd = request.getRequestDispatcher("/loginExito.jsp");
						rd.forward(request, response);
					}
					else {
						request.setAttribute("error", "Contrasenia invalida");
						rd = request.getRequestDispatcher("/inicioSesion.jsp");
						rd.forward(request, response);
					}
			}
			else {
				RequestDispatcher rd;
				request.setAttribute("error", "Nickname invalido");
				rd = request.getRequestDispatcher("/inicioSesion.jsp");
				rd.forward(request, response);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public boolean existeUsuario(String nickname) throws Exception {
		ControladorUsuarioPublishService cps = new ControladorUsuarioPublishServiceLocator();
		ControladorUsuarioPublish port = cps.getControladorUsuarioPublishPort();
		return port.existeUsuario(nickname);
	}
	public publicadores.DtUsuario ConsultaUsuario(String nickname) throws Exception {
		ControladorUsuarioPublishService cps = new ControladorUsuarioPublishServiceLocator();
		ControladorUsuarioPublish port = cps.getControladorUsuarioPublishPort();
		return (publicadores.DtUsuario) port.consultaUsuario(nickname);
	}

}
