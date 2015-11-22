package br.edu.ifpi.dominio.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.ifpi.dominio.dao.UsuarioDAO;
import br.edu.ifpi.dominio.model.Aluno;
import br.edu.ifpi.dominio.model.Aposentado;
import br.edu.ifpi.dominio.model.Docente;
import br.edu.ifpi.dominio.model.PrestadorServicoTerceirizado;
import br.edu.ifpi.dominio.model.TecnicoAdministrativo;
import br.edu.ifpi.dominio.model.Usuario;
import br.edu.ifpi.dominio.util.JPAUtil;

/**
 * Servlet implementation class ServletCadastraUsuario
 */
public class ServletCadastraUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCadastraUsuario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		EntityManager em = (EntityManager) getServletContext().getAttribute("em");
		
		String nome, campus, setor, segmento, cpf, dataAdmissao, celular, email, senha, matriculaSiape;
		Usuario u = null;
		UsuarioDAO dao = new UsuarioDAO(em);
		
		nome = request.getParameter("nome");
		campus = request.getParameter("campus");
		setor = request.getParameter("setor");
		segmento = request.getParameter("segmento");
		cpf = request.getParameter("cpf");
		matriculaSiape = request.getParameter("matriculaSiape");
		dataAdmissao = request.getParameter("dataAdmissao");
		celular = request.getParameter("celular");
		email = request.getParameter("email");
		senha = request.getParameter("senha");
		
		switch (segmento) {
			case "aluno":
				u = new Aluno();
				((Aluno) u).setMatricula(matriculaSiape);
				request.getSession().setAttribute("segmento", "Aluno");
				break;
			case "aposentado":
				u = new Aposentado();
				request.getSession().setAttribute("segmento", "Aposentado");
				break;
			case "presServTerc":
				u = new PrestadorServicoTerceirizado();
				request.getSession().setAttribute("segmento", "Prestador de Serviço-Terceirizado");
				break;
			case "docente":
				u = new Docente();
				((Docente) u).setSiape(matriculaSiape);
				request.getSession().setAttribute("segmento", "Docente");
				break;
			case "TecAdmin":
				u = new TecnicoAdministrativo();
				((TecnicoAdministrativo) u).setSiape(matriculaSiape);
				request.getSession().setAttribute("segmento", "Tecnico Administrativo");
				break;
			default:
				break;
		}
		
		try {
			u.setNome(nome);
			u.setCampus(campus);
			u.setSetor(setor);
			u.setCpf(cpf);
			//FIXME tipo Calendar
			//u.setDataAdmissao(null);
			
			SimpleDateFormat formataData = new SimpleDateFormat("dd/MM/yyyy");
			try {
				u.setDataAdmissao(formataData.parse(dataAdmissao));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			u.setCelular(celular);
			u.setEmail(email);
			u.setSenha(senha);
			
			EntityTransaction et = em.getTransaction();
			
			et.begin();
			dao.inserir(u);
			et.commit();
			
			request.getSession().setAttribute("cadastrado", true);
			request.getSession().setAttribute("usuario", u);
			response.sendRedirect("ServletCriarSolicitacao");
			
			
		} catch (Exception e) {
			request.getSession().setAttribute("msg-cadastro", true);
			response.sendRedirect("index.jsp#down");
			//request.getRequestDispatcher("index.jsp#down").forward(request, response);
		}
		
		
		
	}

}
