package com.epam.db.services;

import com.epam.db.conf.DBConnectionProvider;
import com.epam.db.model.Employee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeServiceImpl implements EmployeeService<Employee> {
    private Connection connection = DBConnectionProvider.getInstance().getConnection();

    public List<Employee> getAll() {
        List<Employee> users = new ArrayList<>();
        try {
            String query = "SELECT * From employee";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Employee user = new Employee();
                user.setId(resultSet.getInt("id"));
                user.setFirst_name(resultSet.getString("first_name"));
                user.setEmail(resultSet.getString("email"));
                user.setUsername(resultSet.getString("username"));
                user.setPassword(resultSet.getString("password"));
                user.setAddress(resultSet.getString("address"));
                user.setContact(resultSet.getString("contact"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public void createUser(Employee obj) {
        try {
            String query = "INSERT INTO employee(first_name,email,username,password,address,contact) VALUES(?,?,?,?,?,?)";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, obj.getFirst_name());
            statement.setString(2, obj.getEmail());
            statement.setString(3, obj.getUsername());
            statement.setString(4, obj.getPassword());
            statement.setString(5, obj.getAddress());
            statement.setString(6, obj.getContact());
            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    @Override
    public void updateUser(Employee obj) {
        try {
            String query = "UPDATE employee SET username=? WHERE id=?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, obj.getUsername());
            preparedStatement.setInt(2, obj.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    @Override
    public void updateUserPassword(Employee obj) {
        try {
            String query = "UPDATE employee SET password=? WHERE email=?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, obj.getPassword());
            preparedStatement.setString(2, obj.getEmail());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean validate(Employee employee) {
        boolean status = false;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from employee where username=? and password=?");
            preparedStatement.setString(1, employee.getUsername());
            preparedStatement.setString(2, employee.getPassword());
            ResultSet resultSet = preparedStatement.executeQuery();
            status = resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    public boolean validateRegister(Employee employee) {
        boolean status = false;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from employee where username=?");
            preparedStatement.setString(1, employee.getUsername());
            ResultSet resultSet = preparedStatement.executeQuery();
            status = resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    public boolean validateEmail(Employee employee) {
        boolean status = false;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from employee where email=?");
            preparedStatement.setString(1, employee.getEmail());
            ResultSet resultSet = preparedStatement.executeQuery();
            status = resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }
}
