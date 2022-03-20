package com.epam.servlets;

import com.epam.db.model.Poll;
import com.epam.db.services.PollServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/poll")
public class PollServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PollServiceImpl pollService = new PollServiceImpl();
        List<Poll> all = pollService.findAll();
        req.setAttribute("poll", all);
        req.getRequestDispatcher("/WEB-INF/poll.jsp").forward(req, resp);
    }
}
