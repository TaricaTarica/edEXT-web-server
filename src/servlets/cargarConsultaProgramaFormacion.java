package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/cargarConsultaProgramaFormacion")
public class cargarConsultaProgramaFormacion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public cargarConsultaProgramaFormacion() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String selected = request.getParameter("exampleRadios");
		RequestDispatcher rd;
	  	if(selected.equals("programa")){	
		  	request.setAttribute("prog", request.getParameter("cb_Programa"));
		  	rd = request.getRequestDispatcher("/consultaProgramaFormacion.jsp");
			rd.forward(request, response);
	  	}
	}

}
