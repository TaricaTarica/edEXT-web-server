package servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datatypes.DtProgramaFormacion;
import excepciones.CrearProgramaFormacionRepetido_Exception;
import interfaces.Fabrica;
import interfaces.IControladorCurso;


@WebServlet("/CrearProgramaF")
public class CrearProgramaF extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CrearProgramaF() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String nombre = request.getParameter("nombre");
		String descripcion = request.getParameter("descripcion");
		String fIni = request.getParameter("fini");
		String fFin = request.getParameter("ffin");
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d/MM/yyyy");
		
		//convert String to LocalDate
		LocalDate fi = LocalDate.parse(fIni, formatter);
		LocalDate ff = LocalDate.parse(fFin, formatter);
		
		LocalDate fa = LocalDate.now();
		
		Fabrica fab = Fabrica.getInstancia();
		IControladorCurso iconCur = fab.getIControladorCurso();
		RequestDispatcher rd;
		
		DtProgramaFormacion pf = new DtProgramaFormacion(nombre, descripcion, fi, ff, fa);
		
		try {
			iconCur.AltaCrearProgramadeFormacion(pf);
		}
		catch(CrearProgramaFormacionRepetido_Exception e) {
			throw new ServletException(e.getMessage());
		}
		
		request.setAttribute("mensaje", "Se ha creado correctamente el programa " + nombre );
		rd = request.getRequestDispatcher("/notificacion.jsp");
		rd.forward(request, response);
		
	}

}
