package controller;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import database.DBConnection;
import model.Bloco;


public class BlocoController {

	private Statement statement;
	
	public BlocoController() {
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
	
	//salva o bloco no banco de dados
	public void create(Bloco bloco) {
		String descricao = bloco.getDescricao();
		String operador = bloco.getOperador();
		Integer vagasCarros = bloco.getVagasCarros();
		Integer vagasMotos = bloco.getVagasMotos();
		Integer vagasDeficientes = bloco.getVagasDeficientes();
		
		if(descricao == null || descricao.isBlank() || vagasCarros == null || vagasMotos == null || vagasDeficientes == null){
			throw new IllegalArgumentException("Digite todos os campos.");
		}
		if(vagasCarros < 0 || vagasMotos < 0 || vagasDeficientes < 0){
			throw new IllegalArgumentException("Digite um número de vagas válido.");
		}
		
		String sql = "INSERT INTO blocos (descricao, operador, vagas_carros, vagas_motos, vagas_deficientes) "
				   + "VALUES ('" + descricao + "', '" + operador + "', '" + vagasCarros + "', '" + vagasMotos + "', '" + vagasDeficientes + "')";
		
		try {
			this.execute(sql);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//recupera informações do bloco pelo id
	public ResultSet read(Bloco bloco) {		
		Integer id = bloco.getId();

		String sql = "SELECT * FROM blocos WHERE id = '" + id + "'";
		
		return query(sql);
	}
	
	//altera os dados do bloco com id igual ao passado como parâmetro
	public void update(Bloco bloco) {		
		Integer id = bloco.getId();
		String descricao = bloco.getDescricao();
		String operador = bloco.getOperador();
		Integer vagasCarros = bloco.getVagasCarros();
		Integer vagasMotos = bloco.getVagasMotos();
		Integer vagasDeficientes = bloco.getVagasDeficientes();
		
		if(descricao == null || descricao.isBlank() || operador == null || operador.isBlank() || vagasCarros == null || vagasMotos == null || vagasDeficientes == null){
			throw new IllegalArgumentException("Digite todos os campos.");
		}
		if(vagasCarros < 0 || vagasMotos < 0 || vagasDeficientes < 0){
			throw new IllegalArgumentException("Digite um número de vagas válido.");
		}
		
		String sql = "UPDATE blocos SET descricao = '" + descricao + "', operador = '" + operador + "', vagas_carros = '" + vagasCarros + "', vagas_motos = '"
				+ vagasMotos + "', vagas_deficientes = '" + vagasDeficientes + "' WHERE id = '" + id + "'";
		
		try {
			this.execute(sql);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public Bloco find(Integer id) {
		 String sql = "SELECT * FROM blocos WHERE id = '" + id + "'";
		    ResultSet rset = null;
		    Bloco bloco = new Bloco();

		    try {
		        rset = query(sql);

		        if (rset.next()) {
		            bloco.setId(rset.getInt("id"));
		            bloco.setDescricao(rset.getString("descricao"));
		            bloco.setOperador(rset.getString("operador"));
		            bloco.setVagasCarros(rset.getInt("vagas_carros"));
		            bloco.setVagasMotos(rset.getInt("vagas_motos"));
		            bloco.setVagasDeficientes(rset.getInt("vagas_deficientes"));
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		    }

		    return bloco;
	}
	
	//apaga o bloco pelo ID
	public void delete(Integer id) {
		
		String sql = "DELETE FROM blocos WHERE id = '" + id + "'";
		
		try {
			this.execute(sql);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//retorna uma lista de todos os blocos do estacionamento
	public List<Bloco> getList() {		
		List<Bloco> blocos = new ArrayList<Bloco>();
		ResultSet rset = null;
			
		String sql = "SELECT * FROM blocos ORDER BY descricao";
		
		try {					
			rset = query(sql);
			
			while(rset.next()) {
				Bloco bloco = new Bloco();
				
				bloco.setId(rset.getInt("id"));
				bloco.setDescricao(rset.getString("descricao"));
				bloco.setOperador(rset.getString("operador"));
				bloco.setVagasCarros(rset.getInt("vagas_carros"));
				bloco.setVagasMotos(rset.getInt("vagas_motos"));
				bloco.setVagasDeficientes(rset.getInt("vagas_deficientes"));
				
				blocos.add(bloco);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return blocos;
	}
	
	//retorna uma lista de descrições de cada bloco sem repetição ordenados pela descricao do bloco
	public List<String> distinctList() {
		List<String> descricoes = new ArrayList<String>();
		ResultSet rset = null;
		
		String sql = "SELECT DISTINCT descricao FROM blocos ORDER BY descricao ASC";
		
		try {			
			rset = query(sql);
			
			while(rset.next()) {
				descricoes.add(rset.getString("descricao"));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return descricoes;
	}

}