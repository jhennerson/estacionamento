package controller;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import database.DBConnection;
import model.Operador;
import model.Usuario;

public class OperadorController {
	
	private Statement statement;
	
	public OperadorController() {
		try {
			this.statement = new DBConnection().getConnection().createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//QUERY COM RESULTSET
	public ResultSet query(String sql) {
		try {
			ResultSet rs = statement.executeQuery(sql);
			return (rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//CREATE / READ / UPDATE / DELETE
	public int execute(String sql) {
		try {
			int rs = statement.executeUpdate(sql);
			return (rs);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	//salva o usuário no banco de dados
	public void create(Operador operador) {		
		String nome = operador.getNome();
		String senha = operador.getSenha();
		String bloco = operador.getBloco();
		String senhaCriptografada = Cripto.criptografar(senha);
		
		if(nome == null || nome.isBlank() || senha == null || senha.isBlank()){
			throw new IllegalArgumentException("Digite todos os campos.");
		}
		if(nome.length() < 5 || nome.length() > 16){
			throw new IllegalArgumentException("O nome deve possuir entre 5 e 16 caracteres.");
		}
		if(senha.length() < 5 || senha.length() > 32){
			throw new IllegalArgumentException("A senha deve possuir entre 5 e 32 caracteres.");
		}
		
		String sql = "INSERT INTO usuarios (nome, senha, bloco) VALUES ('" + nome + "', '" + senhaCriptografada + "', '" + bloco + "')";
		
		try {
			this.execute(sql);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//recupera usuario e senha do usuário passado como parâmetro (mais usual em caso de confirmação de login
	public ResultSet read(Operador operador) {		
		String nome = operador.getNome();
		String senha = operador.getSenha();
		String senhaCriptografada = Cripto.criptografar(senha);
		
		if(nome == null || nome.isBlank() || senha == null || senha.isBlank()){
			throw new IllegalArgumentException("Digite todos os campos.");
		}
		if(nome.length() < 5 || nome.length() > 16){
			throw new IllegalArgumentException("O nome deve possuir entre 5 e 16 caracteres.");
		}
		if(senha.length() < 5 || senha.length() > 32){
			throw new IllegalArgumentException("A senha deve possuir entre 5 e 32 caracteres.");
		}
		
		String sql = "SELECT nome, senha FROM usuarios WHERE nome = '" + nome + "' AND senha = '" + senhaCriptografada + "'";
		
		return query(sql);
	}
	
	//altera os dados do usuário com id igual ao passado como parâmetro e usa o nome e senha do mesmo como novos dados
	public void update(Operador operador) {
		Integer id = operador.getId();
		String nome = operador.getNome();
		String senha = operador.getSenha().toString();
		String bloco = operador.getBloco();
		String senhaCriptografada = Cripto.criptografar(senha);
		
		if(nome == null || nome.isBlank() || senha == null || senha.isBlank() || bloco == null || bloco.isBlank()){
			throw new IllegalArgumentException("Digite todos os campos.");
		}
		if(nome.length() < 5 || nome.length() > 16){
			throw new IllegalArgumentException("O nome deve possuir entre 5 e 16 caracteres.");
		}
		if(senha.length() < 5 || senha.length() > 32){
			throw new IllegalArgumentException("A senha deve possuir entre 5 e 32 caracteres.");
		}
		
		String sql = "UPDATE usuarios SET nome = '" + nome + "', senha = '" + senhaCriptografada + "', bloco = '" + bloco + "' WHERE id = '" + id + "'";
		
		try {
			this.execute(sql);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//apaga o usuário pelo ID
	public void delete(Integer id) {
		
		String sql = "DELETE FROM usuarios WHERE id = '" + id + "'";
		
		try {
			if(id != 1)	this.execute(sql);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//retorna uma lista de todos os usuários cadastrados no banco de dados
	public List<Usuario> getList() {		
		List<Usuario> operadores = new ArrayList<Usuario>();
		ResultSet rset = null;		
		String sql = "SELECT * FROM usuarios ORDER BY id";

		try {					
			rset = query(sql);
			
			while(rset.next()) {
				Operador operador = new Operador();
				
				operador.setId(rset.getInt("id"));
				operador.setNome(rset.getString("nome"));
				operador.setSenha(rset.getString("senha"));
				operador.setBloco(rset.getString("bloco"));
				
				operadores.add(operador);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return operadores;
	}
	
	//retorna uma lista de nomes sem repetição ordenados pelo nome
	public List<String> distinctList() {
		List<String> nomes = new ArrayList<String>();
		ResultSet rset = null;

		String sql = "SELECT DISTINCT nome FROM usuarios ORDER BY nome ASC";
		
		try {			
			rset = query(sql);
			while(rset.next()) {
				if(!rset.getString("nome").equalsIgnoreCase("admin")) nomes.add(rset.getString("nome"));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return nomes;
	}
}
