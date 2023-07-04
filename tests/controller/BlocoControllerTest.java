package tests.controller;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import controller.BlocoController;
import model.Bloco;

public class BlocoControllerTest {

    private BlocoController blocoController;

    @BeforeEach
    public void setup() {
        blocoController = new BlocoController();
    }

    @Test
    public void testCreate() {
        Bloco bloco = new Bloco(1, "Bloco A", "Operador 1", 100, 50, 5);
        
        blocoController.create(bloco);

        // Retrieve the created block from the database and verify its values
        ResultSet resultSet = blocoController.read(bloco);
        try {
            if (resultSet.next()) {
                int id = resultSet.getInt("id");
                String descricao = resultSet.getString("descricao");
                String operador = resultSet.getString("operador");
                int vagasCarros = resultSet.getInt("vagas_carros");
                int vagasMotos = resultSet.getInt("vagas_motos");
                int vagasDeficientes = resultSet.getInt("vagas_deficientes");

                Assertions.assertEquals(bloco.getId(), id);
                Assertions.assertEquals(bloco.getDescricao(), descricao);
                Assertions.assertEquals(bloco.getOperador(), operador);
                Assertions.assertEquals(bloco.getVagasCarros(), vagasCarros);
                Assertions.assertEquals(bloco.getVagasMotos(), vagasMotos);
                Assertions.assertEquals(bloco.getVagasDeficientes(), vagasDeficientes);
            } else {
                Assertions.fail("No records found.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            Assertions.fail("SQL error occurred.");
        }
    }

    @Test
    public void testUpdate() {
        Bloco bloco = new Bloco();
        bloco.setId(1);
        bloco.setDescricao("Bloco B");
        bloco.setOperador("Operador 2");
        bloco.setVagasCarros(200);
        bloco.setVagasMotos(100);
        bloco.setVagasDeficientes(10);

        blocoController.update(bloco);

        // Retrieve the updated block from the database and verify its values
        ResultSet resultSet = blocoController.read(bloco);
        try {
            if (resultSet.next()) {
                int id = resultSet.getInt("id");
                String descricao = resultSet.getString("descricao");
                String operador = resultSet.getString("operador");
                int vagasCarros = resultSet.getInt("vagas_carros");
                int vagasMotos = resultSet.getInt("vagas_motos");
                int vagasDeficientes = resultSet.getInt("vagas_deficientes");

                Assertions.assertEquals(bloco.getId(), id);
                Assertions.assertEquals(bloco.getDescricao(), descricao);
                Assertions.assertEquals(bloco.getOperador(), operador);
                Assertions.assertEquals(bloco.getVagasCarros(), vagasCarros);
                Assertions.assertEquals(bloco.getVagasMotos(), vagasMotos);
                Assertions.assertEquals(bloco.getVagasDeficientes(), vagasDeficientes);
            } else {
                Assertions.fail("No records found.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            Assertions.fail("SQL error occurred.");
        }
    }

    @Test
    public void testDelete() {
        int id = 1;
        blocoController.delete(id);
        Bloco bloco = new Bloco();
        bloco.setId(id);

        // Verify that the block with the specified ID is no longer in the database
        ResultSet resultSet = blocoController.read(bloco);
        try {
            Assertions.assertFalse(resultSet.next(), "Record still exists.");
        } catch (SQLException e) {
            e.printStackTrace();
            Assertions.fail("SQL error occurred.");
        }
    }

    @Test
    public void testGetList() {
        List<Bloco> blocos = blocoController.getList();

        // Verify that the list is not null and contains at least one block
        Assertions.assertNotNull(blocos);
        Assertions.assertFalse(blocos.isEmpty(), "List is empty.");
    }

    @Test
    public void testDistinctList() {
        List<String> descricoes = blocoController.distinctList();

        // Verify that the list is not null and contains at least one description
        Assertions.assertNotNull(descricoes);
        Assertions.assertFalse(descricoes.isEmpty(), "List is empty.");
    }
}
