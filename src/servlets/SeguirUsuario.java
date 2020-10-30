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
		String accion = request.getParameter("accion");
		if(accion.equals("seguir")){
		
				String seguidor = request.getParameter("usuarioLogueado");
				String seguir = request.getParameter("usuarioEnCuestion");

				System.out.println(seguidor);
				System.out.println(seguir);
			
				Fabrica fab = Fabrica.getInstancia();
				IControladorUsuario iconUsr = fab.getIControladorUsuario();
				
				iconUsr.seguirUsuario(seguidor, seguir);
				
				RequestDispatcher rd;		
				request.setAttribute("mensaje", "Se ha seguido correctamente al estudiante " + seguir );
				rd = request.getRequestDispatcher("/notificacion.jsp");
				rd.forward(request, response);
	
		}
		else if(accion.equals("dejarSeguir")) {
				
				String seguidor = request.getParameter("usuarioLogueado");
				String dejarSeguir = request.getParameter("usuarioEnCuestion");

				System.out.println(seguidor);
				System.out.println(dejarSeguir);
			
				Fabrica fab = Fabrica.getInstancia();
				IControladorUsuario iconUsr = fab.getIControladorUsuario();
				
				iconUsr.dejarSeguir(seguidor, dejarSeguir);
				
				RequestDispatcher rd;		
				request.setAttribute("mensaje", "Se ha dejado de seguir correctamente al estudiante " + dejarSeguir );
				rd = request.getRequestDispatcher("/notificacion.jsp");
				rd.forward(request, response);
			
		}
	}

}
