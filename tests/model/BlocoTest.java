package tests.model;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import model.Bloco;

public class BlocoTest {

    private Bloco bloco;

    @BeforeEach
    public void setUp() {
        bloco = new Bloco();
    }

    @Test
    public void testConstrutorBlocoComTodosOsAtributos() {
        Integer id = 1;
        String descricao = "Bloco A";
        String operador = "Operador A";
        Integer vagasCarros = 10;
        Integer vagasMotos = 5;
        Integer vagasDeficientes = 2;

        Bloco bloco = new Bloco(id, descricao, operador, vagasCarros, vagasMotos, vagasDeficientes);

        assertEquals(id, bloco.getId());
        assertEquals(descricao, bloco.getDescricao());
        assertEquals(operador, bloco.getOperador());
        assertEquals(vagasCarros, bloco.getVagasCarros());
        assertEquals(vagasMotos, bloco.getVagasMotos());
        assertEquals(vagasDeficientes, bloco.getVagasDeficientes());
    }

    @Test
    public void testConstrutorBlocoComDescricaoOperadorEVagas() {
        String descricao = "Bloco B";
        String operador = "Operador B";
        Integer vagasCarros = 8;
        Integer vagasMotos = 4;
        Integer vagasDeficientes = 1;

        Bloco bloco = new Bloco(descricao, operador, vagasCarros, vagasMotos, vagasDeficientes);

        assertNotNull(bloco.getId());
        assertEquals(descricao, bloco.getDescricao());
        assertEquals(operador, bloco.getOperador());
        assertEquals(vagasCarros, bloco.getVagasCarros());
        assertEquals(vagasMotos, bloco.getVagasMotos());
        assertEquals(vagasDeficientes, bloco.getVagasDeficientes());
    }

    @Test
    public void testConstrutorBlocoComDescricaoEOperador() {
        String descricao = "Bloco C";
        String operador = "Operador C";

        Bloco bloco = new Bloco(descricao, operador);

        assertNotNull(bloco.getId());
        assertEquals(descricao, bloco.getDescricao());
        assertEquals(operador, bloco.getOperador());
    }
}

