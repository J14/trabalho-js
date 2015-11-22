package br.edu.ifpi.dominio.filtro;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.ifpi.dominio.model.Usuario;

/**
 * Servlet Filter implementation class FilterLogado
 */
public class FilterLogado implements Filter {

    /**
     * Default constructor. 
     */
    public FilterLogado() {
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
		
		
		
		Usuario u =  (Usuario)((HttpServletRequest) request).getSession().getAttribute("usuario");
		
		if(u != null)
			chain.doFilter(request, response);
		else
			((HttpServletResponse) response).sendRedirect("danadinho.jsp");
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

	

}
