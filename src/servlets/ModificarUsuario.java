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
import javax.servlet.http.HttpSession;

import interfaces.Fabrica;
import interfaces.IControladorUsuario;
import datatypes.DtUsuario;


@WebServlet("/ModificarUsuario")
public class ModificarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ModificarUsuario() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		String fnac = request.getParameter("fnac");
		String contrasenia = request.getParameter("contrasenia");
		String ccontrasenia = request.getParameter("ccontrasenia");
		HttpSession sesion = request.getSession();
		DtUsuario usr = (DtUsuario) sesion.getAttribute("usuario");
		String nickname = usr.getNickname();
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d/MM/yyyy");
	
		//convert String to LocalDate
		LocalDate fn = LocalDate.parse(fnac, formatter);
		
		Fabrica fab = Fabrica.getInstancia();
		IControladorUsuario iconUsr = fab.getIControladorUsuario();
		RequestDispatcher rd;
		iconUsr.modificarUsuario(nickname, nombre, apellido, fn, contrasenia);
		request.setAttribute("mensaje", "Se ha modificado correctamente al usuario " + nickname );
		rd = request.getRequestDispatcher("/notificacion.jsp");
		rd.forward(request, response);
		
	}
}
