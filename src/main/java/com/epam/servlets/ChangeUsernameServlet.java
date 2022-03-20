package com.epam.servlets;

import com.epam.db.model.Employee;
import com.epam.db.services.EmployeeServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Base64;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(urlPatterns = "/changeUsername")
public class ChangeUsernameServlet extends HttpServlet {
    Employee employee = new Employee();
    EmployeeServiceImpl employeeService = new EmployeeServiceImpl();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String email = request.getParameter("email");
        String regex = "^[\\w!#$%&'*+/=?`{|}~^-]+(?:\\.[\\w!#$%&'*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(email);

        String username = request.getParameter("username");
        String usernameConfirm = request.getParameter("usernameConfirm");

        employee.setEmail(email);
        employee.setUsername(username);

        if (matcher.matches() && email.equals(employee.getEmail()) && username.contentEquals(usernameConfirm)) {
            employeeService.updateUser(employee);
            request.getRequestDispatcher("/WEB-INF/yourChangeIsSuccess.jsp").forward(request, response);
        }
        else {
            request.getRequestDispatcher("/WEB-INF/errorpage.jsp").forward(request, response);
        }
    }

}
