package tests.model;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import model.Venda;

public class VendaTest {

    private Venda venda;

    @BeforeEach
    public void setUp() {
        venda = new Venda();
    }

    @Test
    public void testConstrutorVendaComTodosOsAtributos() {
        Integer id = 1;
        Double valor = 50.0;
        Double precoHora = 10.0;
        String timestamp = "2023-07-03 12:34:56";

        Venda venda = new Venda(id, valor, precoHora, timestamp);

        assertEquals(id, venda.getId());
        assertEquals(valor, venda.getValor());
        assertEquals(precoHora, venda.getPrecoHora());
        assertEquals(timestamp, venda.getTimestamp());
    }

    @Test
    public void testConstrutorVendaComValor() {
        Double valor = 25.0;

        Venda venda = new Venda(valor);

        assertNotNull(venda.getId());
        assertEquals(valor, venda.getValor());
    }

    @Test
    public void testSetId() {
        Integer id = 2;

        venda.setId(id);

        assertEquals(id, venda.getId());
    }

    @Test
    public void testSetValor() {
        Double valor = 75.0;

        venda.setValor(valor);

        assertEquals(valor, venda.getValor());
    }

    @Test
    public void testSetPrecoHora() {
        Double precoHora = 15.0;

        venda.setPrecoHora(precoHora);

        assertEquals(precoHora, venda.getPrecoHora());
    }

    @Test
    public void testSetTimestamp() {
        String timestamp = "2023-07-03 12:34:56";

        venda.setTimestamp(timestamp);

        assertEquals(timestamp, venda.getTimestamp());
    }
}
