package com.epam.db.services;

import java.util.List;

public interface PollService<T> {

    List<T> findAll();

    T findById(long id);
}
