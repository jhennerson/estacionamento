package model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class Vaga {
	
	private Integer id;
	private Integer categoria;
	private String bloco;
	private Integer estado = 0;
	private String timestamp;
	
	public Vaga(Integer id, Integer categoria, String bloco, Integer estado) {
		super();
		this.id = id;
		this.categoria = categoria;
		this.bloco = bloco;
		this.estado = estado;
	}
	
	public Vaga(Integer categoria, String bloco) {
		super();
		this.categoria = categoria;
		this.bloco = bloco;
	}
	
	public Vaga(Integer id, Integer categoria, String bloco) {
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

	public Integer getCategoria() {
		return categoria;
	}

	public void setCategoria(Integer categoria) {
		this.categoria = categoria;
	}

	public String getBloco() {
		return bloco;
	}

	public void setBloco(String bloco) {
		this.bloco = bloco;
	}

	public Integer getEstado() {
		return estado;
	}

	public void setEstado(Integer estado) {
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
