package com.epam.servlets;

import com.epam.db.model.Question;
import com.epam.db.services.QuestionServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/question")
public class QuestionServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Question question = new Question();
        QuestionServiceImpl questionService = new QuestionServiceImpl();

        long id = Long.parseLong(req.getParameter("id"));
        question.setPollId(id);
        List<Question> texts = questionService.findByPollId(question.getPollId());
        req.setAttribute("question", texts);
        req.getRequestDispatcher("/answer").forward(req, resp);
    }
}
