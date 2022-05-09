package com.common;

import org.springframework.stereotype.Component;

import java.sql.*;

@Component
public class JUtil {
    private String driver = "com.mysql.cj.jdbc.Driver";
    private String url = "jdbc:mysql://localhost:3306/sk_three?serverTimezone=GMT&useUnicode=true&characterEncoding=UTF-8";
    private String username = "root";
    private String password = "12345678";
    private Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    public JUtil() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(this.url, this.username, this.password);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ResultSet executeSQL(String sql) {
        if (preparedStatement != null) {
            preparedStatement = null;

        }
        if (resultSet != null) {
            resultSet = null;
        }
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(this.url, this.username, this.password);
            preparedStatement = connection.prepareStatement(sql);
            if (sql.contains("delete") || sql.contains("update") || sql.contains("insert")) {
                preparedStatement.execute(sql);
            } else {
                resultSet = preparedStatement.executeQuery();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            return resultSet;
        }
    }

}
