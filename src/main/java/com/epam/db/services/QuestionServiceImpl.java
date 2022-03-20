package com.epam.db.services;

import com.epam.db.conf.DBConnectionProvider;
import com.epam.db.model.Question;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QuestionServiceImpl implements QuestionService {
    private Connection connection = DBConnectionProvider.getInstance().getConnection();

    @Override
    public List<Question> findAll() {
        List<Question> question = new ArrayList<Question>();
        try {
            String query = "SELECT * FROM question";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Question question1 = new Question();
                question1.setId(resultSet.getInt("quest_id"));
                question1.setText(resultSet.getString("text"));

                question.add(question1);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Something is went wrong in getAll method");
        }
        return question;
    }

    @Override
    public Question findById(long id) {
        Question question = new Question();
        try {
            String query = "SELECT * FROM question WHERE quest_id=?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                question.setText(resultSet.getString("text"));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Something is went wrong in getById method");
        }

        return question;
    }

    @Override
    public List<Question> findByPollId(long pollId) {
        List<Question> questions = new ArrayList<>();
        try {
            String query = "SELECT * FROM poll INNER JOIN question ON poll.id=question.poll_id WHERE poll_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, pollId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Question question = new Question();
                question.setId(resultSet.getLong("quest_id"));
                question.setText(resultSet.getString("text"));
                question.setPollId(resultSet.getLong("poll_id"));
                questions.add(question);
            }
        } catch (SQLException e) {
            System.out.println("Something wrong during work in method findById");
        }
        return questions;
    }
}