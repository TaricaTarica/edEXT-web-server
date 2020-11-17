package servlets;

import java.io.IOException;
import java.rmi.RemoteException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import publicadores.ControladorCursoPublish;
import publicadores.ControladorCursoPublishService;
import publicadores.ControladorCursoPublishServiceLocator;
import publicadores.ControladorUsuarioPublish;
import publicadores.ControladorUsuarioPublishService;
import publicadores.ControladorUsuarioPublishServiceLocator;

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

		
		try {
			seleccionarestadoInscripcion(nombreInstituto, nombreCurso, nombreEdicion, nicknameEstudiante, estado);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
	public void seleccionarestadoInscripcion(String nombreInstituto, String nombreCurso, String nombreEdicion, String nicknameEstudiante, String estado) throws Exception {
		ControladorCursoPublishService cps = new ControladorCursoPublishServiceLocator();
		ControladorCursoPublish port = cps.getControladorCursoPublishPort();
		port.seleccionarestadoInscripcion(nombreInstituto, nombreCurso, nombreEdicion, nicknameEstudiante, estado);
	}

}
