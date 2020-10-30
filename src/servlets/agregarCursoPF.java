package servlets;

import java.io.IOException;
import java.nio.file.Files;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import excepciones.ProgramaCursoRepetido_Exception;
import interfaces.Fabrica;
import interfaces.IControladorCurso;


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
		
		Fabrica fab = Fabrica.getInstancia();
		IControladorCurso iconCur = fab.getIControladorCurso();
		RequestDispatcher rd;
				
				try {
					
					
					iconCur.agregarCursoProgFormacion2(strPrograma, strCurso, strInstituto);
					
					request.setAttribute("mensaje", "Se ha agregado correctamente el curso '" + strCurso + "' al Programa de Formacion '" + strPrograma + "'.");
					rd = request.getRequestDispatcher("/notificacion.jsp");
					rd.forward(request, response);
				}
				catch(ProgramaCursoRepetido_Exception e) {
					request.setAttribute("error", e.getMessage());
					rd = request.getRequestDispatcher("/agregarCursoPrograma.jsp");
					rd.forward(request, response);
				}
	}

}
