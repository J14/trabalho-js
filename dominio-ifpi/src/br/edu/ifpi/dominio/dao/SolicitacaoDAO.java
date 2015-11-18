package br.edu.ifpi.dominio.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;

import br.edu.ifpi.dominio.model.Solicitacao;
import br.edu.ifpi.dominio.model.Status;
import br.edu.ifpi.dominio.util.JPAUtil;

public class SolicitacaoDAO implements GenericDAO<Solicitacao>{

	private EntityManager em = JPAUtil.getEntityManager();
	
	public void inserir(Solicitacao e) {
		em.persist(e);
	}

	public void remover(Solicitacao e) {
		em.remove(e);
	}

	public void atualizar(Solicitacao e) {
		// TODO Auto-generated method stub
		em.merge(e);
	}

	public Solicitacao pesquisar(long id) {
		return em.find(Solicitacao.class, id);
	}

	public List<Solicitacao> pesquisar(String jql) {
		return em.createQuery(jql, Solicitacao.class).getResultList();
	}
	
	public List<Solicitacao> pendentes() {
		//FIXME tentar fazer só pelo comando jql;
		
		List<Solicitacao> pendentes, solicitacoes;
		
		solicitacoes = pesquisar("SELECT s FROM Solicitacao s");
		
		Iterator<Solicitacao> i = solicitacoes.iterator();
		
		Solicitacao s;
		pendentes = new ArrayList<Solicitacao>();
		while(i.hasNext()) {
			s = i.next();
			if(s.getStatus() == Status.PENDENTE) pendentes.add(s);
		}
		
		return pendentes;
	}

}
