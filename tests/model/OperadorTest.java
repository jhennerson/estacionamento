package tests.model;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import model.Operador;

public class OperadorTest {

    private Operador operador;

    @BeforeEach
    public void setUp() {
        operador = new Operador();
    }

    @Test
    public void testConstrutorOperadorComTodosOsAtributos() {
        Integer id = 1;
        String nome = "Operador A";
        String senha = "senha123";
        String bloco = "Bloco A";

        Operador operador = new Operador(id, nome, senha, bloco);

        assertEquals(id, operador.getId());
        assertEquals(nome, operador.getNome());
        assertEquals(senha, operador.getSenha());
        assertEquals(bloco, operador.getBloco());
    }

    @Test
    public void testConstrutorOperadorComNomeSenhaEBloco() {
        String nome = "Operador B";
        String senha = "senha456";
        String bloco = "Bloco B";

        Operador operador = new Operador(nome, senha, bloco);

        assertNotNull(operador.getId());
        assertEquals(nome, operador.getNome());
        assertEquals(senha, operador.getSenha());
        assertEquals(bloco, operador.getBloco());
    }

    @Test
    public void testConstrutorOperadorComNomeESenha() {
        String nome = "Operador C";
        String senha = "senha789";

        Operador operador = new Operador(nome, senha);

        assertNotNull(operador.getId());
        assertEquals(nome, operador.getNome());
        assertEquals(senha, operador.getSenha());
    }
}
