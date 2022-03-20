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
import java.io.PrintWriter;
import java.util.Base64;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(urlPatterns = "/register")
public class UserServlet extends HttpServlet {
    Employee employee = new Employee();
    private EmployeeServiceImpl employeeManager = new EmployeeServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String first_name = request.getParameter("first_name");
        String email = request.getParameter("email");
        String regex = "^[\\w!#$%&'*+/=?`{|}~^-]+(?:\\.[\\w!#$%&'*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(email);
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String contact = request.getParameter("contact");
        String encodePassword = Base64.getEncoder().encodeToString(password.getBytes());
        employee.setFirst_name(first_name);
        employee.setEmail(email);
        employee.setUsername(username);

        if (employeeManager.validateRegister(employee)) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            if (username.equals(employee.getUsername()) || email.equals(employee.getEmail())) {
                request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
            }
        } else if (matcher.matches()) {
            employee.setPassword(encodePassword);
            employee.setAddress(address);
            employee.setContact(contact);
            employeeManager.createUser(employee);
            request.getRequestDispatcher("/WEB-INF/registerSuccessfully.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/WEB-INF/registerrefresh.jsp").forward(request, response);
        }
    }
}