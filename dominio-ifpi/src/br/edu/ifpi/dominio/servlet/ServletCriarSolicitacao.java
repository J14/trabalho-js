package br.edu.ifpi.dominio.servlet;

import java.io.IOException;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.edu.ifpi.dominio.dao.SolicitacaoDAO;
import br.edu.ifpi.dominio.model.Solicitacao;
import br.edu.ifpi.dominio.model.Status;
import br.edu.ifpi.dominio.model.Usuario;

/**
 * Servlet implementation class ServletCriarSolicitacao
 */
public class ServletCriarSolicitacao extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCriarSolicitacao() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
    		throws ServletException, IOException {
    	
    	doPost(req, resp);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		EntityManager em = (EntityManager) getServletContext().getAttribute("em");
		
		HttpSession session = request.getSession();
		
		Usuario u = (Usuario) session.getAttribute("usuario");
		
		SolicitacaoDAO dao = new SolicitacaoDAO(em);
		
		Solicitacao s = new Solicitacao();
		
		s.setUsuario(u);
		s.setStatus(Status.PENDENTE);
		//FIXME tipo Calendar
		//s.setContaCriada(null);
		
		/*Calendar c = Calendar.getInstance();
		s.setContaCriada(c.getTime());*/
		
		u.setSolitacao(s);
		
		EntityTransaction et = em.getTransaction();
		
		et.begin();
		dao.inserir(s);
		et.commit();
		
		response.sendRedirect("perfil.jsp");
	}

}
