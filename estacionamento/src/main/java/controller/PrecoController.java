package controller;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import database.DBConnection;
import model.Preco;

public class PrecoController {
private Statement statement;
	
	public PrecoController() {
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
	
	//salva o preco no banco de dados
	public void create(Preco preco) {
		Double valor = preco.getValor();
		
		String sql = "INSERT INTO precos (valor) "
				   + "VALUES ('" + valor + "')";
		
		try {
			if(valor > 0) this.execute(sql);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//recupera informações do preco pelo id
	public ResultSet read(Preco preco) {		
		Integer id = preco.getId();
		
		String sql = "SELECT * FROM precos WHERE id = '" + id + "'";
		
		return query(sql);
	}
	
	//altera os dados do preco com id igual ao passado como parâmetro
	public void update(Preco preco) {
		Integer id = preco.getId();
		Double valor = preco.getValor();

		String sql = "UPDATE precos SET valor = '" + valor + "' WHERE id = '" + id + "'";
		
		try {
			this.execute(sql);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//apaga o preco pelo ID
	public void delete(Integer id) {		
		String sql = "DELETE FROM precos WHERE id = '" + id + "'";
		
		try {
			this.execute(sql);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//retorna uma lista de todas os precos
	public List<Preco> getList() {		
		List<Preco> precos = new ArrayList<Preco>();
		ResultSet rset = null;		
		String sql = "SELECT * FROM precos ORDER BY id";
		
		try {					
			rset = query(sql);
			
			while(rset.next()) {
				Preco preco = new Preco();
				
				preco.setId(rset.getInt("id"));
				preco.setValor(rset.getDouble("valor"));
				preco.setTimestamp(String.valueOf(rset.getTimestamp("timestamp")));
				
				precos.add(preco);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return precos;
	}
}
