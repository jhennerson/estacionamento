package controller;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import database.DBConnection;
import model.Operador;
import model.Vaga;

public class VagaController {

	private Statement statement;
	
	public VagaController() {
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
	
	//salva a vaga no banco de dados
	public void create(Vaga vaga) {
		Integer categoria = vaga.getCategoria();
		String bloco = vaga.getBloco();
		Integer estado = vaga.getEstado();
		
		String sql = "INSERT INTO vagas (categoria, bloco, estado) "
				   + "VALUES ('" + categoria + "', '" + bloco + "', '" + estado + "')";
		
		try {
			this.execute(sql);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//recupera informações da vaga pelo id
	public ResultSet read(Vaga vaga) {		
		Integer id = vaga.getId();
		
		String sql = "SELECT * FROM vagas WHERE id = '" + id + "'";
		
		return query(sql);
	}
	
	//altera os dados da vaga com id igual ao passado como parâmetro
	public void update(Vaga vaga) {
		Integer id = vaga.getId();
		Integer categoria = vaga.getCategoria();
		String bloco = vaga.getBloco();
		
		if(id == null || categoria == null || bloco == null || bloco.isBlank()){
			throw new IllegalArgumentException("Digite todos os campos.");
		}
		if(id < 0){
			throw new IllegalArgumentException("Digite uma ID válida.");
		}
		if(categoria < 0){
			throw new IllegalArgumentException("Digite uma categoria válida.");
		}
		
		String sql = "UPDATE vagas SET categoria = '" + categoria + "', bloco = '" + bloco + "' WHERE id = '" + id + "'";
		
		try {
			this.execute(sql);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//altera a descrição para o novo bloco de todas as vagas com o bloco indicado
	public void updateAllBloco(String blocoOld, String blocoNew) {
		
		if(blocoOld == null || blocoNew == null){
			throw new IllegalArgumentException("Os blocos não podem ser vazios!");
		}
		
		String sql = "UPDATE vagas SET bloco = '" + blocoNew + "' WHERE bloco = '" + blocoOld + "'";
		
		try {
			this.execute(sql);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//apaga a vaga pelo ID
	public void delete(Integer id) {
		
		String sql = "DELETE FROM vagas WHERE id = '" + id + "'";
		
		try {
			this.execute(sql);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//apaga todas as vagas do respectivo bloco
	public void deleteAll(String bloco) {
		
		String sql = "DELETE FROM vagas WHERE bloco = '" + bloco + "'";
		
		try {
			this.execute(sql);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//retorna uma lista de todas as vagas do bloco
	public List<Vaga> getList() {		
		List<Vaga> vagas = new ArrayList<Vaga>();
		ResultSet rset = null;		
		String sql = "SELECT * FROM vagas ORDER BY id";
		
		try {					
			rset = query(sql);
			
			while(rset.next()) {
				Vaga vaga = new Vaga();
				
				vaga.setId(rset.getInt("id"));
				vaga.setCategoria(rset.getInt("categoria"));
				vaga.setBloco(rset.getString("bloco"));
				vaga.setEstado(rset.getInt("estado"));
				vaga.setTimestamp(rset.getTimestamp("timestamp"));
				
				vagas.add(vaga);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return vagas;
	}
	
	//retorna uma lista de vagas presentes apenas no bloco do operador passado como parâmetro
	public List<Vaga> getList(Operador operador) {		
		List<Vaga> vagas = new ArrayList<Vaga>();
		String bloco = operador.getBloco();
		ResultSet rset = null;		
		String sql = "SELECT * FROM vagas WHERE bloco = " + bloco + " ORDER BY id";
		
		try {					
			rset = query(sql);
			
			while(rset.next()) {
				Vaga vaga = new Vaga();
				
				vaga.setId(rset.getInt("id"));
				vaga.setCategoria(rset.getInt("categoria"));
				vaga.setBloco(rset.getString("bloco"));
				vaga.setEstado(rset.getInt("estado"));
				vaga.setTimestamp(rset.getTimestamp("timestamp"));
				
				vagas.add(vaga);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return vagas;
	}
	
	//cria várias vagas de uma só vez
	public void create(Vaga vaga, Integer quantidade) {
		Integer categoria = vaga.getCategoria();
		String bloco = vaga.getBloco();
		Integer estado = vaga.getEstado();
		
		if(quantidade <= 0) return;
		
		for(int i = 0; i < quantidade; i++) {
			String sql = "INSERT INTO vagas (categoria, bloco, estado) "
					   + "VALUES ('" + categoria + "', '" + bloco + "', '" + estado + "')";
			
			try {
				this.execute(sql);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}		
	}
	
	//altera e retorna o estado da vaga 0 = livre 1 = ocupado
	public void alteraEstado(Integer id) {		
		ResultSet rset = null;		
		String sql = "SELECT estado FROM vagas WHERE id = '" + id + "'";
		Integer estado = null;

		try {					
			rset = query(sql);
			
			if(rset.next()) {
				estado = rset.getInt("estado");
			}
			
			if(estado == 0) {
				sql = "UPDATE vagas SET estado = 1 WHERE id = '" + id + "'";
			} else {
				sql = "UPDATE vagas SET estado = 0 WHERE id = '" + id + "'";
			}
			
			try {
				this.execute(sql);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}		
	}
	
	//retorna a quantidade de vagas de acordo com o estado informado 0 = livre 1 = ocupado
	public Integer countEstado(Integer estado) {
		ResultSet rset = null;		
		String sql = "SELECT COUNT(*) AS count FROM vagas WHERE estado = '" + estado + "'";
		
		Integer count = 0;
		
		try {
			rset = query(sql);
			
			if(rset.next()) count = rset.getInt("count");
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}

}
