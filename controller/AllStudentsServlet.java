package com.example.webapp.servlet.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.*;

import com.example.webapp.servlet.dao.Studentdao;
import com.example.webapp.servlet.model.Student;

@WebServlet("/allstudents")
public class AllStudentsServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        Studentdao stu = new Studentdao();
        List<Student> all = stu.getall();
        req.setAttribute("all", all);
        req.getRequestDispatcher("allstu.jsp").forward(req, res);
        // Student stu=null;

    }
}
