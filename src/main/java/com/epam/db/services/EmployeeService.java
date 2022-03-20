package com.epam.db.services;

import java.util.List;

public interface EmployeeService<T> {

    List<T> getAll();

    void createUser(T obj);

    void updateUser(T obj);

    void updateUserPassword(T obj);


}
