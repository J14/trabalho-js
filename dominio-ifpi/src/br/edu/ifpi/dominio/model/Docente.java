package br.edu.ifpi.dominio.model;

import java.util.Calendar;

public class Docente extends Usuario{
	
	private String siape;

	public Docente() {
		super();
	}

	public Docente(long id, String nome, String campus, String setor,
			String cpf, Calendar dataAdmissao, String celular, String email,
			String senha, String siape) {
		super(id, nome, campus, setor, cpf, dataAdmissao, celular, email, senha);
		this.siape = siape;
	}
	
	public String getSiape() {
		return siape;
	}
	
	public void setSiape(String siape) {
		this.siape = siape;
	}

	@Override
	public Object autenticacao() {
		return getSiape();
	}

	@Override
	public String toString() {
		return "Docente [siape=" + siape + ", toString()=" + super.toString()
				+ "]";
	}
	
	

}
