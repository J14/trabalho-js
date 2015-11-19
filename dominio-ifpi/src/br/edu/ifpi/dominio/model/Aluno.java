package br.edu.ifpi.dominio.model;

import java.util.Date;

import javax.persistence.Entity;

@Entity
public class Aluno extends Usuario{
	
	private String matricula;

	public Aluno() {
		super();
	}

	public Aluno(long id, String nome, String campus, String setor, String cpf,
			Date dataAdmissao, String celular, String email, String senha,
			String matricula) {
		super(id, nome, campus, setor, cpf, dataAdmissao, celular, email, senha);
		this.matricula = matricula;
	}

	public String getMatricula() {
		return matricula;
	}

	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}

	@Override
	public Object autenticacao() {
		return getMatricula();
	}

	@Override
	public String toString() {
		return "Aluno [matricula=" + matricula + ", toString()="
				+ super.toString() + "]";
	}
	
	

}
