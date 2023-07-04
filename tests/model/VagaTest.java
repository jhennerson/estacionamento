package tests.model;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import model.Categoria;
import model.Estado;
import model.Vaga;

public class VagaTest {

    private Vaga vaga;

    @BeforeEach
    public void setUp() {
        vaga = new Vaga();
    }

    @Test
    public void testConstrutorVagaComTodosOsAtributos() {
        Integer id = 1;
        Categoria categoria = Categoria.CARRO;
        String bloco = "A";
        Estado estado = Estado.LIVRE;

        Vaga vaga = new Vaga(id, categoria, bloco, estado);

        assertEquals(id, vaga.getId());
        assertEquals(categoria, vaga.getCategoria());
        assertEquals(bloco, vaga.getBloco());
        assertEquals(estado, vaga.getEstado());
    }

    @Test
    public void testConstrutorVagaComCategoriaEBloco() {
        Categoria categoria = Categoria.MOTO;
        String bloco = "B";

        Vaga vaga = new Vaga(categoria, bloco);

        assertNotNull(vaga.getId());
        assertEquals(categoria, vaga.getCategoria());
        assertEquals(bloco, vaga.getBloco());
    }

    @Test
    public void testConstrutorVagaComIdCategoriaEBloco() {
        Integer id = 3;
        Categoria categoria = Categoria.DEFICIENTE;
        String bloco = "C";

        Vaga vaga = new Vaga(id, categoria, bloco);

        assertEquals(id, vaga.getId());
        assertEquals(categoria, vaga.getCategoria());
        assertEquals(bloco, vaga.getBloco());
    }

    @Test
    public void testSetTimestamp() throws ParseException {
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
        java.sql.Timestamp timestamp = new java.sql.Timestamp(df.parse("03/07/2023 12:34:56").getTime());

        vaga.setTimestamp(timestamp);

        assertEquals("03/07/2023 12:34:56", vaga.getTimestamp());
    }
}
