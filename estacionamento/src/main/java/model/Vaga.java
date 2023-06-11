package model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class Vaga {
	
	private Integer id;
	private Categoria categoria;
	private String bloco;
	private Estado estado = Estado.LIVRE;
	private String timestamp;
	
	public Vaga(Integer id, Categoria categoria, String bloco, Estado estado) {
		super();
		this.id = id;
		this.categoria = categoria;
		this.bloco = bloco;
		this.estado = estado;
	}
	
	public Vaga(Categoria categoria, String bloco) {
		super();
		this.categoria = categoria;
		this.bloco = bloco;
	}
	
	public Vaga(Integer id, Categoria categoria, String bloco) {
		super();
		this.id = id;
		this.categoria = categoria;
		this.bloco = bloco;
	}

	public Vaga() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}

	public String getBloco() {
		return bloco;
	}

	public void setBloco(String bloco) {
		this.bloco = bloco;
	}

	public Estado getEstado() {
		return estado;
	}

	public void setEstado(Estado estado) {
		this.estado = estado;
	}

	public String getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(java.sql.Timestamp timestamp) {
		DateFormat df = new SimpleDateFormat("dd/MM/YYYY hh:mm:ss");
		this.timestamp = df.format(timestamp);		
	}

}
