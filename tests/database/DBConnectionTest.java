package tests.database;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import database.DBConnection;

public class DBConnectionTest {

    private DBConnection dbConnection;

    @BeforeEach
    public void setup() {
        // Configuração para o banco de dados de teste
        String host = "localhost";
        String port = "3306";
        String schema = "test_db";
        String user = "root";
        String password = "password";

        dbConnection = new DBConnection(host, port, schema, user, password);
    }

    @Test
    public void testGetConnection() {
        Connection connection = dbConnection.getConnection();
        assertNotNull(connection);
        try {
            assertFalse(connection.isClosed());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testQuery() {
        String sql = "SELECT * FROM users";
        ResultSet resultSet = dbConnection.query(sql);
        assertNotNull(resultSet);
        try {
            assertTrue(resultSet.next()); // Verifica se há pelo menos uma linha de resultado
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
