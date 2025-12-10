package com.example.webapp.servlet.controller;

import java.io.IOException;
import com.example.webapp.servlet.dao.Studentdao;
import com.example.webapp.servlet.model.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddStudentServlet")
public class AddStudentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String branch = request.getParameter("branch");
        int year = Integer.parseInt(request.getParameter("year"));

        Studentdao dao = new Studentdao();
        String msg = "";

        // Check ID
        if (dao.isIdExist(id)) {
            msg = "Student ID already exists!";
        }
        // Check email
        else if (dao.isEmailExist(email)) {
            msg = "Email already exists!";
        }
        // Insert
        else {
            Student stu = new Student(id, name, password, branch, year, email);
            boolean success = dao.addStudent(stu, email);
            msg = success ? "Student added successfully!" : "Failed to add student!";
        }

        request.setAttribute("msg", msg);
        request.getRequestDispatcher("addstudent.jsp").forward(request, response);
    }
}
