package com.epam.db.services;

import com.epam.db.model.Answer;

import java.util.List;

public interface AnswerService extends PollService<Answer> {

    List<Answer> findByQuestionId(long questionId);
}
