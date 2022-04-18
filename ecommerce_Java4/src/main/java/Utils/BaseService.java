package Utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseService {
    static final String db_url = "jdbc:sqlserver://localhost:1433;databaseName=ecommerce";
    static final String user = "sa";
    static final String password = "123";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (ClassNotFoundException el) {
            el.printStackTrace();
        }
        Connection conn = DriverManager.getConnection(db_url, user, password);
        return conn;
    }

    public static void main(String[] args) throws SQLException {
        System.out.println(getConnection());
    }
}
