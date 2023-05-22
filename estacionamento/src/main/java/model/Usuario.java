package model;

public abstract class Usuario {
	private Integer id;
	private String nome;
	private String senha;
	private String bloco;
	
	public Usuario(Integer id, String nome, String senha, String bloco) {
		super();
		this.id = id;
		this.nome = nome;
		this.senha = senha;
		this.bloco = bloco;
	}
	
	public Usuario(String nome, String senha, String bloco) {
		super();
		this.nome = nome;
		this.senha = senha;
		this.bloco = bloco;
	}
	
	public Usuario(String nome, String senha) {
		super();
		this.nome = nome;
		this.senha = senha;
	}	
	
	public Usuario() {
	}
	
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getNome() {
		return nome;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public String getSenha() {
		return senha;
	}
	
	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getBloco() {
		return bloco;
	}

	public void setBloco(String bloco) {
		this.bloco = bloco;
	}
}
