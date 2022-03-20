package com.epam.db.conf;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnectionProvider {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/userregister";
    private static final String DB_USER = "garik";
    private static final String DB_PASSWORD = "garik";
    private static final String DB_DRIVER = "com.mysql.cj.jdbc.Driver";
    public static Connection connection;
    private volatile static DBConnectionProvider instance;

    private DBConnectionProvider() {
        try {
            Class.forName(DB_DRIVER);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static DBConnectionProvider getInstance() {
        if (instance == null) {
            synchronized (DBConnectionProvider.class) {
                if (instance == null) {
                    instance = new DBConnectionProvider();
                }
            }
        }
        return instance;

    }

    public Connection getConnection() {
        try {
            if (connection == null || connection.isClosed()) {
                connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
}
