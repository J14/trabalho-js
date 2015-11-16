package br.edu.ifpi.dominio.model;

import java.util.Calendar;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Solicitacao {
	
	@Id 
	@GeneratedValue
	private long id;
	private Calendar contaCriada;
	@OneToOne
	private Usuario usuario;
	
	public Solicitacao() {
		super();
	}

	public Solicitacao(long id, Usuario usuario, Calendar contaCriada) {
		super();
		this.id = id;
		this.usuario = usuario;
		this.contaCriada = contaCriada;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Calendar getContaCriada() {
		return contaCriada;
	}

	public void setContaCriada(Calendar contaCriada) {
		this.contaCriada = contaCriada;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (id ^ (id >>> 32));
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Solicitacao other = (Solicitacao) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Solicitacao [id=" + id + ", usuario=" + usuario
				+ ", contaCriada=" + contaCriada + "]";
	}
	
}
