package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.rpc.ServiceException;

import publicadores.ControladorUsuarioPublish;
import publicadores.ControladorUsuarioPublishService;
import publicadores.ControladorUsuarioPublishServiceLocator;


@WebServlet("/SeguirUsuario")
public class SeguirUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SeguirUsuario() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String seguir = request.getParameter("nickSeguir");
		String seguidor = request.getParameter("nickSeguidor");
	
	
		try {
			seguirUsuario(seguidor, seguir);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher rd;		
		request.setAttribute("mensaje", "Se ha seguido correctamente al estudiante " + seguir );
		rd = request.getRequestDispatcher("/notificacion.jsp");
		rd.forward(request, response);
	}
	public void seguirUsuario(String seguidor, String seguir) throws Exception {
		ControladorUsuarioPublishService cps = new ControladorUsuarioPublishServiceLocator();
		ControladorUsuarioPublish port = cps.getControladorUsuarioPublishPort();
		port.seguirUsuario(seguidor, seguir);
	}

}
