package com.epam.servlets;

import com.epam.db.model.Employee;
import com.epam.db.services.EmployeeServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Base64;
import java.util.List;

@WebServlet(urlPatterns = "/login")
public class LoginServlet extends HttpServlet {

    EmployeeServiceImpl employeeManager = new EmployeeServiceImpl();
    Employee employee = new Employee();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String encodePassword = Base64.getEncoder().encodeToString(password.getBytes());
        employee.setUsername(username);
        employee.setPassword(encodePassword);
        if (employeeManager.validate(employee)) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("password", password);
            List<Employee> allUser = employeeManager.getAll();
            for (Employee employee1 : allUser) {
                if (username.equals(employee1.getUsername()) && encodePassword.equals(employee1.getPassword())) {
                    request.getSession().setAttribute("user", employee1);
                    break;
                }
            }
            request.getRequestDispatcher("/WEB-INF/loginsuccess.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/WEB-INF/loginrefresh.jsp").forward(request, response);
        }
    }
}

