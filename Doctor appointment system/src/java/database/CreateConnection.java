package database;

import java.sql.*;

public class CreateConnection {
    private final String SERVER_NAME = "localhost";
    private final String DB_NAME = "das";
    private final String USER = "root";
    private final String PASS = "password";
    private Connection connection;
    public CreateConnection() throws ClassNotFoundException, SQLException
    {
       //Load the JDBC driver
        Class.forName("com.mysql.jdbc.Driver");
        //Create Connection
        connection = DriverManager.getConnection("jdbc:mysql://" + SERVER_NAME + "/" + DB_NAME + "?characterEncoding=utf-8", USER, PASS);        
    }
    
    @Override // เมื่อ object ของ QueryData ทำงานเสร็จจะ close connection
    public void finalize () throws SQLException
    {
        getConnection().close();
    }

    /**
     * @return the connection
     */
    public Connection getConnection() {
        return connection;
    }

    /**
     * @param connection the connection to set
     */
    public void setConnection(Connection connection) {
        this.connection = connection;
    }

}
