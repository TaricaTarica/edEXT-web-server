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
	
		System.out.println(seguir);
		System.out.println(seguidor);
	
		Fabrica fab = Fabrica.getInstancia();
		IControladorUsuario iconUsr = fab.getIControladorUsuario();
		
		iconUsr.seguirUsuario(seguidor, seguir);
		
		RequestDispatcher rd;		
		request.setAttribute("mensaje", "Se ha seguido correctamente al estudiante " + seguir );
		rd = request.getRequestDispatcher("/notificacion.jsp");
		rd.forward(request, response);
	}

}
