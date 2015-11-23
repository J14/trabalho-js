package br.edu.ifpi.dominio.dao;

import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;

import br.edu.ifpi.dominio.model.Usuario;

public class UsuarioDAO implements GenericDAO<Usuario>{
	
	//private EntityManager em = JPAUtil.getEntityManager();
	private EntityManager em;
	
	public UsuarioDAO(EntityManager em) {
		this.em = em;
	}

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
	
	public Usuario autenticacaoCadastrado(String ident, String senha) {
		
		List<Usuario> usuarios = pesquisar("SELECT u FROM Usuario u");
		
		Iterator<Usuario> i = usuarios.iterator();
		
		Usuario u;
		
		while(i.hasNext()) {
			u = i.next();
			if(u.autenticacao().equals(ident) && u.getSenha().equals(senha)) return u;
		}
		
		return null;
		
	}

}
