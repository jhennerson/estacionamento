package model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class Venda {

	private Integer id;
	private Double precoHora;
	private Double valor;
	private String timestamp;

	public Venda(Integer id, Double valor, Double precoHora, String timestamp) {
		super();
		this.id = id;
		this.valor = valor;
		this.precoHora = precoHora;
		this.timestamp = timestamp;
	}
	
	public Venda(Double valor) {
		super();
		this.valor = valor;
	}
	
	public Venda() {
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Double getValor() {
		return valor;
	}

	public void setValor(Double valor) {
		this.valor = valor;
	}

	public Double getPrecoHora() {
		return precoHora;
	}

	public void setPrecoHora(Double precoHora) {
		this.precoHora = precoHora;
	}

	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}

	public String getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(java.sql.Timestamp timestamp) {
		DateFormat df = new SimpleDateFormat("dd/MM/YYYY hh:mm:ss");
		this.timestamp = df.format(timestamp);		
	}

}
