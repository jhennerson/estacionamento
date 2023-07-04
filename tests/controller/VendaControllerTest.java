package tests.controller;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import controller.VendaController;
import model.Venda;

public class VendaControllerTest {

    private VendaController vendaController;

    @BeforeEach
    public void setup() {
        vendaController = new VendaController();
    }

    @Test
    public void testCreate() {
        Venda venda = new Venda();
        venda.setPrecoHora(10.0);
        venda.setValor(100.0);

        vendaController.create(venda);

        // Recupera a venda criada do banco de dados e verifica as informações
        ResultSet resultSet = vendaController.read(venda);
        try {
            if (resultSet.next()) {
                int id = resultSet.getInt("id");
                double precoHora = resultSet.getDouble("preco_hora");
                double valor = resultSet.getDouble("valor");

                Assertions.assertEquals(venda.getId(), id);
                Assertions.assertEquals(venda.getPrecoHora(), precoHora);
                Assertions.assertEquals(venda.getValor(), valor);
            } else {
                Assertions.fail("Nenhum registro encontrado.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            Assertions.fail("Ocorreu um erro SQL.");
        }
    }

    @Test
    public void testDelete() {
        int id = 1;
        Venda venda = new Venda();
        venda.setId(id);
        vendaController.delete(id);

        // Verifica que a venda com o ID especificado não existe mais no banco de dados
        ResultSet resultSet = vendaController.read(venda);
        try {
            Assertions.assertFalse(resultSet.next(), "O registro ainda existe.");
        } catch (SQLException e) {
            e.printStackTrace();
            Assertions.fail("Ocorreu um erro SQL.");
        }
    }

    @Test
    public void testGetList() {
        ResultSet resultSet = vendaController.query("SELECT COUNT(*) AS count FROM vendas");
        try {
            if (resultSet.next()) {
                int count = resultSet.getInt("count");
                Assertions.assertTrue(count >= 0, "A contagem de vendas é negativa.");
            } else {
                Assertions.fail("Nenhum registro encontrado.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            Assertions.fail("Ocorreu um erro SQL.");
        }
    }
}
