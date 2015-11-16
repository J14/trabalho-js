package br.edu.ifpi.dominio.model;

import java.util.Calendar;

import javax.persistence.Entity;

@Entity
public class Aposentado extends Usuario{

	public Aposentado() {
		super();
	}

	public Aposentado(long id, String nome, String campus, String setor,
			String cpf, Calendar dataAdmissao, String celular, String email,
			String senha) {
		super(id, nome, campus, setor, cpf, dataAdmissao, celular, email, senha);
	}

	@Override
	public Object autenticacao() {
		return super.getCpf();
	}
	
}
