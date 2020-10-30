package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import interfaces.Fabrica;
import interfaces.IControladorUsuario;
import datatypes.DtUsuario;

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
		
		Fabrica fab = Fabrica.getInstancia();
		IControladorUsuario iconUsr = fab.getIControladorUsuario();
		
		if(iconUsr.existeUsuario(nickname)) {
			DtUsuario usr = iconUsr.ConsultaUsuario(nickname);
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
		
	}

}
