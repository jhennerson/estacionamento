package tests.model;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import model.Preco;

public class PrecoTest {

    private Preco preco;

    @BeforeEach
    public void setUp() {
        preco = new Preco();
    }

    @Test
    public void testConstrutorPrecoComTodosOsAtributos() {
        Integer id = 1;
        Double valor = 10.5;
        String timestamp = "2023-07-03 12:34:56";

        Preco preco = new Preco(id, valor, timestamp);

        assertEquals(id, preco.getId());
        assertEquals(valor, preco.getValor());
        assertEquals(timestamp, preco.getTimestamp());
    }

    @Test
    public void testSetId() {
        Integer id = 2;

        preco.setId(id);

        assertEquals(id, preco.getId());
    }

    @Test
    public void testSetValor() {
        Double valor = 15.75;

        preco.setValor(valor);

        assertEquals(valor, preco.getValor());
    }

    @Test
    public void testSetTimestamp() {
        String timestamp = "2023-07-03 12:34:56";

        preco.setTimestamp(timestamp);

        assertEquals(timestamp, preco.getTimestamp());
    }
}
