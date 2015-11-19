package br.edu.ifpi.dominio.filtro;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import br.edu.ifpi.dominio.dao.UsuarioDAO;
import br.edu.ifpi.dominio.model.Usuario;

/**
 * Servlet Filter implementation class FilterCadastro
 */
public class FilterCadastro implements Filter {

    /**
     * Default constructor. 
     */
    public FilterCadastro() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		String ident = request.getParameter("ident");
		String senha = request.getParameter("senha");
		
		Usuario u = new UsuarioDAO().isCadastrado(ident, senha);
		
		if (u == null) {
			((HttpServletResponse) response).sendRedirect("index.jsp");
		} else {
			request.setAttribute("usuario", u);
			chain.doFilter(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
