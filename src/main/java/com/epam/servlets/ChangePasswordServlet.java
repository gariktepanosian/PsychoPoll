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

@WebServlet(urlPatterns = "/changePassword")
public class ChangePasswordServlet extends HttpServlet {
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

        String password = request.getParameter("password");
        String passwordConfirm = request.getParameter("passwordConfirm");
        String encodePassword = Base64.getEncoder().encodeToString(password.getBytes());
        String encodePasswordConfirm = Base64.getEncoder().encodeToString(passwordConfirm.getBytes());
        employee.setEmail(email);
        employee.setPassword(encodePassword);

        if (matcher.matches() && email.equals(employee.getEmail()) && encodePassword.contentEquals(encodePasswordConfirm)) {
                employeeService.updateUserPassword(employee);
                request.getRequestDispatcher("/WEB-INF/yourChangeIsSuccess.jsp").forward(request, response);
            }
         else {
                request.getRequestDispatcher("/WEB-INF/errorpage.jsp").forward(request, response);
            }
    }
}
