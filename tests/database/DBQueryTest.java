package tests.database;

import java.lang.reflect.InvocationTargetException;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import database.DBQuery;

public class DBQueryTest {

    private DBQuery dbQuery;

    @BeforeEach
    public void setup() throws InstantiationException, IllegalAccessException, InvocationTargetException, NoSuchMethodException, ClassNotFoundException {
        dbQuery = new DBQuery("users", "name, age, email", "id");
    }

    @Test
    public void testSelect() {
        String whereClause = "id = 1";
        ResultSet resultSet = dbQuery.select(whereClause);
        try {
            if (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                Assertions.assertEquals(1, id);
                Assertions.assertEquals("John Doe", name);
            } else {
                Assertions.fail("No records found.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            Assertions.fail("SQL error occurred.");
        }
    }

    @Test
    public void testInsert() {
        String[] values = {"Jane Smith", "25", "jane@example.com"};
        int result = dbQuery.insert(values);
        Assertions.assertEquals(1, result);
    }

    @Test
    public void testUpdate() {
        String[] values = {"Jane Smith", "26", "jane@example.com"};
        int result = dbQuery.update(values);
        Assertions.assertEquals(1, result);
    }

    @Test
    public void testDelete() {
        String[] values = {"1"};
        int result = dbQuery.delete(values);
        Assertions.assertEquals(1, result);
    }
}

