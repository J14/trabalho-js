package br.edu.ifpi.dominio.dao;

import java.util.List;

import javax.persistence.EntityManager;

import br.edu.ifpi.dominio.model.Usuario;
import br.edu.ifpi.dominio.util.JPAUtil;

public class UsuarioDAO implements GenericDAO<Usuario>{
	
	private EntityManager em = JPAUtil.getEntityManager();

	public void inserir(Usuario e) {
		em.persist(e);
	}

	public void remover(Usuario e) {
		em.remove(e);
	}

	public void atualizar(Usuario e) {
		em.merge(e);
	}

	public Usuario pesquisar(long id) {
		return em.find(Usuario.class, id);
	}

	public List<Usuario> pesquisar(String jql) {
		return em.createQuery(jql, Usuario.class).getResultList();
	}

}
