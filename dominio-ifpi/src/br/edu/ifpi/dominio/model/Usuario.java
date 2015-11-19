package br.edu.ifpi.dominio.model;

import java.util.Date;

import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name="segmento", discriminatorType=DiscriminatorType.STRING)
public abstract class Usuario {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	private String nome;
	private String campus;
	private String setor;
	private String cpf;
	@Temporal(TemporalType.DATE)
	private Date dataAdmissao;
	private String celular;
	private String email;
	private String senha;
	
	@OneToOne(mappedBy="usuario")
	private Solicitacao solitacao;
	
	protected Usuario() {
		super();
	}

	protected Usuario(long id, String nome, String campus, String setor,
			String cpf, Date dataAdmissao, String celular, String email,
			String senha) {
		super();
		this.id = id;
		this.nome = nome;
		this.campus = campus;
		this.setor = setor;
		this.cpf = cpf;
		this.dataAdmissao = dataAdmissao;
		this.celular = celular;
		this.email = email;
		this.senha = senha;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCampus() {
		return campus;
	}

	public void setCampus(String campus) {
		this.campus = campus;
	}

	public String getSetor() {
		return setor;
	}

	public void setSetor(String setor) {
		this.setor = setor;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public Date getDataAdmissao() {
		return dataAdmissao;
	}

	public void setDataAdmissao(Date dataAdmissao) {
		this.dataAdmissao = dataAdmissao;
	}

	public String getCelular() {
		return celular;
	}

	public void setCelular(String celular) {
		this.celular = celular;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	public Solicitacao getSolitacao() {
		return solitacao;
	}

	public void setSolitacao(Solicitacao solitacao) {
		this.solitacao = solitacao;
	}

	public abstract Object autenticacao();

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
		Usuario other = (Usuario) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Usuario [id=" + id + ", nome=" + nome + ", campus=" + campus
				+ ", setor=" + setor + ", cpf=" + cpf + ", dataAdmissao="
				+ dataAdmissao + ", celular=" + celular + ", email=" + email
				+ ", senha=" + senha + "]";
	}
	
}
