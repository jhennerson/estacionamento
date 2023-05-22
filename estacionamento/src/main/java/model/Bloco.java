package model;

public class Bloco {
	
	private Integer id;
	private String descricao;
	private String operador;	
	private Integer vagasCarros = 0;
	private Integer vagasMotos = 0;
	private Integer vagasDeficientes = 0;
	
	public Bloco(Integer id, String descricao, String operador, Integer vagasCarro,
			Integer vagasMoto, Integer vagasDeficiente) {
		super();
		this.id = id;
		this.descricao = descricao;
		this.operador = operador;
		this.vagasCarros = vagasCarro;
		this.vagasMotos = vagasMoto;
		this.vagasDeficientes = vagasDeficiente;
	}
	
	public Bloco(String descricao, String operador, Integer vagasCarro,
			Integer vagasMoto, Integer vagasDeficiente) {
		super();
		this.descricao = descricao;
		this.operador = operador;
		this.vagasCarros = vagasCarro;
		this.vagasMotos = vagasMoto;
		this.vagasDeficientes = vagasDeficiente;
	}
	
	public Bloco(String descricao, String operador) {
		super();
		this.descricao = descricao;
		this.operador = operador;
	}

	public Bloco() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getOperador() {
		return operador;
	}

	public void setOperador(String operador) {
		this.operador = operador;
	}

	public Integer getVagasCarros() {
		return vagasCarros;
	}

	public void setVagasCarros(Integer vagasCarros) {
		this.vagasCarros = vagasCarros;
	}

	public Integer getVagasMotos() {
		return vagasMotos;
	}

	public void setVagasMotos(Integer vagasMotos) {
		this.vagasMotos = vagasMotos;
	}

	public Integer getVagasDeficientes() {
		return vagasDeficientes;
	}

	public void setVagasDeficientes(Integer vagasDeficientes) {
		this.vagasDeficientes = vagasDeficientes;
	}

}
