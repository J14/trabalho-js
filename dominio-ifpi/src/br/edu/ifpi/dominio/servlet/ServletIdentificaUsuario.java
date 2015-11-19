package br.edu.ifpi.dominio.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.edu.ifpi.dominio.model.Admin;
import br.edu.ifpi.dominio.model.Usuario;

/**
 * Servlet implementation class ServletIdentificaUsuario
 */
public class ServletIdentificaUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletIdentificaUsuario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Usuario u = (Usuario) request.getAttribute("usuario");
		
		HttpSession session = request.getSession();
		session.setAttribute("usuario", u);
		
		if (u instanceof Admin) {
			//FIXME mudar url
			response.sendRedirect("admin.jsp");
		} else {
			//FIXME mudar url
			response.sendRedirect("solicitacao.jsp");
		}
		
	}

}
