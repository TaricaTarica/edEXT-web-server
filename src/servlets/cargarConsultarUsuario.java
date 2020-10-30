package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/cargarConsultarUsuario")
public class cargarConsultarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public cargarConsultarUsuario() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd;	
		request.setAttribute("usr", request.getParameter("cb_Usuario"));
		rd = request.getRequestDispatcher("/consultarUsuario.jsp");
		rd.forward(request, response);
	}

}
















