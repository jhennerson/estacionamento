package model;

public class Preco {	

	private Integer id;
	private Double valor;
	private String timestamp;
	
	public Preco() {
	}
	
	public Preco(Integer id, Double preco, String timestamp) {
		this.id = id;
		this.valor = preco;
		this.timestamp = timestamp;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public Integer getId() {
		return id;
	}

	public Double getValor() {
		return valor;
	}
	
	public void setValor(Double preco) {
		this.valor = preco;
	}

	public String getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}
}
