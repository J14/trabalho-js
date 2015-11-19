package br.edu.ifpi.dominio.servlet;

import java.io.IOException;

import javax.persistence.EntityTransaction;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.edu.ifpi.dominio.dao.SolicitacaoDAO;
import br.edu.ifpi.dominio.model.Aluno;
import br.edu.ifpi.dominio.model.Aposentado;
import br.edu.ifpi.dominio.model.Docente;
import br.edu.ifpi.dominio.model.PrestadorServicoTerceirizado;
import br.edu.ifpi.dominio.model.Solicitacao;
import br.edu.ifpi.dominio.model.Status;
import br.edu.ifpi.dominio.model.TecnicoAdministrativo;
import br.edu.ifpi.dominio.model.Usuario;
import br.edu.ifpi.dominio.util.JPAUtil;

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
		
		HttpSession session = request.getSession();
		
		Usuario u = (Usuario) session.getAttribute("usuario");
		
		SolicitacaoDAO dao = new SolicitacaoDAO();
		
		Solicitacao s = new Solicitacao();
		
		s.setUsuario(u);
		s.setStatus(Status.PENDENTE);
		//FIXME tipo Calendar
		s.setContaCriada(null);
		
		u.setSolitacao(s);
		
		EntityTransaction et = JPAUtil.getTransaction();
		
		et.begin();
		dao.inserir(s);
		et.commit();
		
		response.sendRedirect("solicitacao.jsp");
	}

}
