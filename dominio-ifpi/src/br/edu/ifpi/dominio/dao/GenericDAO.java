package br.edu.ifpi.dominio.dao;

import java.util.List;

public interface GenericDAO<Entity> {

	public void inserir(Entity e);
	public void	remover(Entity e);
	public void atualizar(Entity e);
	public Entity pesquisar(long id);
	public List<Entity> pesquisar(String jql);
	
}
