package br.edu.ifpi.dominio.listener;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Application Lifecycle Listener implementation class ListenerContext
 *
 */
public class ListenerContext implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public ListenerContext() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    	EntityManager em = (EntityManager) arg0.getServletContext().getAttribute("em");
    	EntityManagerFactory emf = em.getEntityManagerFactory();
    	
    	em.close();
    	emf.close();
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    	String persistenceUnitName = arg0.getServletContext().getInitParameter("persistenceUnitName");
    	
    	EntityManagerFactory emf = Persistence.createEntityManagerFactory(persistenceUnitName);
    	
    	arg0.getServletContext().setAttribute("em", emf.createEntityManager());
    	
    }
	
}
