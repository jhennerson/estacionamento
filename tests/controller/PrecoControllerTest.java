package tests.controller;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import controller.PrecoController;
import model.Preco;

public class PrecoControllerTest {

    private PrecoController precoController;

    @BeforeEach
    public void setup() {
        precoController = new PrecoController();
    }

    @Test
    public void testCreate() {
        Preco preco = new Preco();
        preco.setValor(10.99);

        precoController.create(preco);

        // Recupera o preco criado do banco de dados e verifica o valor
        ResultSet resultSet = precoController.read(preco);
        try {
            if (resultSet.next()) {
                int id = resultSet.getInt("id");
                double valor = resultSet.getDouble("valor");

                Assertions.assertEquals(preco.getId(), id);
                Assertions.assertEquals(preco.getValor(), valor);
            } else {
                Assertions.fail("Nenhum registro encontrado.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            Assertions.fail("Ocorreu um erro SQL.");
        }
    }

    @Test
    public void testUpdate() {
        Preco preco = new Preco();
        preco.setId(1);
        preco.setValor(15.99);

        precoController.update(preco);

        // Recupera o preco atualizado do banco de dados e verifica o valor
        ResultSet resultSet = precoController.read(preco);
        try {
            if (resultSet.next()) {
                int id = resultSet.getInt("id");
                double valor = resultSet.getDouble("valor");

                Assertions.assertEquals(preco.getId(), id);
                Assertions.assertEquals(preco.getValor(), valor);
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
        int id = 0;
        Preco preco = new Preco();
        preco.setId(id);
        precoController.delete(id);

        // Verifica que o preco com o ID especificado não existe mais no banco de dados
        ResultSet resultSet = precoController.read(preco);
        try {
            Assertions.assertFalse(resultSet.next(), "O registro ainda existe.");
        } catch (SQLException e) {
            e.printStackTrace();
            Assertions.fail("Ocorreu um erro SQL.");
        }
    }

    @Test
    public void testGetList() {
        List<Preco> precos = precoController.getList();

        // Verifica que a lista não é nula e contém pelo menos um preco
        Assertions.assertNotNull(precos);
        Assertions.assertFalse(precos.isEmpty(), "A lista está vazia.");
    }
}
