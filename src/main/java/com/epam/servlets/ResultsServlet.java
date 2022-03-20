package com.epam.servlets;

import com.epam.db.model.Result;
import com.epam.db.services.ResultServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/results")
public class ResultsServlet extends HttpServlet {
    long sum = 0;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] questionIds = req.getParameterValues("questionId");
        for (String questionId : questionIds) {
            String parameter = req.getParameter("marked" + questionId);
            if (parameter == null) {
                req.setAttribute("error", "You have not filled in all the fields, try again");
                req.getRequestDispatcher("/WEB-INF/errorpage.jsp").forward(req, resp);
            }
            long marked = Long.parseLong(parameter);
            sum += marked;
        }
        ResultServiceImpl resultService = new ResultServiceImpl();
        Result byScore = resultService.findByScore(1, sum/20);
        req.setAttribute("weight", byScore);
        req.getRequestDispatcher("/WEB-INF/results.jsp").forward(req, resp);
    }
}
