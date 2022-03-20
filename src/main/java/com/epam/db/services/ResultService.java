package com.epam.db.services;

import com.epam.db.model.Result;

import java.util.List;

public interface ResultService extends PollService<Result> {

    List<Result> findByPollId(long pollId);

    Result findByScore(long pollId, long score);
}
