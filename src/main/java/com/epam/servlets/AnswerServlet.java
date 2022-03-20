package com.epam.servlets;

import com.epam.db.model.Answer;
import com.epam.db.model.Question;
import com.epam.db.services.AnswerServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/answer")
public class AnswerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Answer answer = new Answer();
        List<Answer> byQuestionId = new ArrayList<>();
        AnswerServiceImpl answerService = new AnswerServiceImpl();
        List<Question> question = (List<Question>) req.getAttribute("question");
        for (Question quest : question) {
            long id = quest.getId();
            answer.setQuestion_id(id);
            byQuestionId.addAll(answerService.findByQuestionId(answer.getQuestion_id()));
        }

        req.setAttribute("answer", byQuestionId);
        req.getRequestDispatcher("/WEB-INF/question.jsp").forward(req, resp);
    }
}