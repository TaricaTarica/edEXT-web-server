package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import interfaces.Fabrica;
import interfaces.IControladorCurso;

@WebServlet("/seleccionarEstudianteEd")
public class seleccionarEstudianteEd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public seleccionarEstudianteEd() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nombreInstituto = request.getParameter("nombreInstituto");
		String nombreCurso = request.getParameter("nombreCurso");
		String nombreEdicion = request.getParameter("nombreEdicion");
		String nicknameEstudiante = request.getParameter("nicknameEstudiante");
		String estado = request.getParameter("estado");
		
		RequestDispatcher rd;
		Fabrica fab = Fabrica.getInstancia();
		IControladorCurso iconCur = fab.getIControladorCurso();
		
		iconCur.seleccionarestadoInscripcion(nombreInstituto, nombreCurso, nombreEdicion, nicknameEstudiante, estado);
		if(estado.equals("aceptar")) {
			request.setAttribute("exito", "Se ha aceptado la solicitud del Estudiante "+nicknameEstudiante+" en la edición "+nombreEdicion);
					rd = request.getRequestDispatcher("/seleccionarEstudianteEd.jsp");
					rd.forward(request, response);
		}
		else if(estado.equals("rechazar")) {
			request.setAttribute("exito", "Se ha rechazado la solicitud del Estudiante "+nicknameEstudiante+" en la edición "+nombreEdicion);
			rd = request.getRequestDispatcher("/seleccionarEstudianteEd.jsp");
			rd.forward(request, response);
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
