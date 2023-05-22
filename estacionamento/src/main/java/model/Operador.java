package model;

public class Operador extends Usuario {

	public Operador(Integer id, String nome, String senha, String bloco) {
		super(id, nome, senha, bloco);
	}

	public Operador(String nome, String senha, String bloco) {
		super(nome, senha,bloco);
	}

	public Operador(String nome, String senha) {
		super(nome, senha);
	}

	public Operador() {
	}

}
