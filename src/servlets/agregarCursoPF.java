package servlets;

import java.io.IOException;
import java.nio.file.Files;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.rpc.ServiceException;

import publicadores.ProgramaCursoRepetido_Exception;
import publicadores.ControladorCursoPublish;
import publicadores.ControladorCursoPublishService;
import publicadores.ControladorCursoPublishServiceLocator;



@WebServlet("/agregarCursoPF")
public class agregarCursoPF extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public agregarCursoPF() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String strPrograma = request.getParameter("cb_Programa");
		String strCurso = request.getParameter("cb_Curso");
		String strInstituto = request.getParameter("instituto");
		
		RequestDispatcher rd;
				
				try {
					
					
					agregarCursoProgFormacion2(strPrograma, strCurso, strInstituto);
					
					request.setAttribute("mensaje", "Se ha agregado correctamente el curso '" + strCurso + "' al Programa de Formacion '" + strPrograma + "'.");
					rd = request.getRequestDispatcher("/notificacion.jsp");
					rd.forward(request, response);
				}
				catch(ProgramaCursoRepetido_Exception e) {
					request.setAttribute("error", e.getMessage());
					rd = request.getRequestDispatcher("/agregarCursoPrograma.jsp");
					rd.forward(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	}
	public void agregarCursoProgFormacion2(String strPrograma, String strCurso, String strInstituto) throws Exception {
		ControladorCursoPublishService cps = new ControladorCursoPublishServiceLocator();
		ControladorCursoPublish port = cps.getControladorCursoPublishPort();
		port.agregarCursoProgFormacion2(strPrograma, strCurso, strInstituto);
	}

}
