package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class VerEdicion_mobile
 */
@WebServlet("/VerEdicion_mobile")
public class VerEdicion_mobile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerEdicion_mobile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd;
		if(request.getParameter("nombreInstituto") != null) {
			request.setAttribute("inst-mobile", request.getParameter("nombreInstituto"));
		  	rd = request.getRequestDispatcher("/VerEdicion-mobile.jsp");
			rd.forward(request, response);
		}
		else if(request.getParameter("nombreCategoria") != null) {
			request.setAttribute("cate-mobile", request.getParameter("nombreCategoria"));
		  	rd = request.getRequestDispatcher("/VerEdicion-mobile.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd;
		if(request.getParameter("nombreInstituto") != null) {
			request.setAttribute("inst-mobile", request.getParameter("nombreInstituto"));
		  	rd = request.getRequestDispatcher("/VerEdicion-mobile.jsp");
			rd.forward(request, response);
		}
		else if(request.getParameter("nombreCategoria") != null) {
			request.setAttribute("cate-mobile", request.getParameter("nombreCategoria"));
		  	rd = request.getRequestDispatcher("/VerEdicion-mobile.jsp");
			rd.forward(request, response);
		}
	}

}
