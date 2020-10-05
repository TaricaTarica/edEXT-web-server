package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/cargarInscripcionEd")
public class cargarInscripcionEd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public cargarInscripcionEd() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String selected = request.getParameter("exampleRadios");
		RequestDispatcher rd;
	  	if(selected.equals("instituto")){	
		  	request.setAttribute("inst", request.getParameter("cb_Instituto"));
		  	rd = request.getRequestDispatcher("/inscribirseEdicion.jsp");
			rd.forward(request, response);
	  	}
	  	else if(selected.equals("categoria")){
	  		request.setAttribute("cate", request.getParameter("cb_Categoria"));
		  	rd = request.getRequestDispatcher("/inscribirseEdicion.jsp");
			rd.forward(request, response);
	  	}
	}

}
