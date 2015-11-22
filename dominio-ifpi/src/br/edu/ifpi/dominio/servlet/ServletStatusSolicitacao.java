package br.edu.ifpi.dominio.servlet;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.ifpi.dominio.dao.SolicitacaoDAO;
import br.edu.ifpi.dominio.model.Solicitacao;
import br.edu.ifpi.dominio.model.Status;
import br.edu.ifpi.dominio.util.JPAUtil;

/**
 * Servlet implementation class ServletStatusSolicitacao
 */
public class ServletStatusSolicitacao extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletStatusSolicitacao() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		EntityManager em = (EntityManager) getServletContext().getAttribute("em");
		
		String botao = request.getParameter("botao");
		
		SolicitacaoDAO dao = new SolicitacaoDAO(em);
		
		Long id = Long.parseLong(request.getParameter("id"));
		
		Solicitacao s;
		
		EntityTransaction et = em.getTransaction();
		
		et.begin();
		s = dao.pesquisar(id);
		et.commit();
		
		if(botao.equals("btn-aceitar")) {
			s.setStatus(Status.APROVADO);
		} else {
			s.setStatus(Status.REPROVADO);
		}
		
		et.begin();
		dao.atualizar(s);
		et.commit();
		
		response.sendRedirect("administrador.jsp");
		
	}

}
