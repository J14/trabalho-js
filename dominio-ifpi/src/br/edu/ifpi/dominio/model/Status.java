package br.edu.ifpi.dominio.model;

public enum Status {

	PENDENTE("PENDENTE"), 
	APROVADO("APROVADO"), 
	REPROVADO("REPROVADO");
	
	private String s;
	
	private Status(String s) {
		this.s = s;
	}
	
	public String getValor() {
		return s;
	}
	
}
