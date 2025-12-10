package com.example.webapp.servlet.controller;

import java.io.IOException;
import com.example.webapp.servlet.dao.Studentdao;
import com.example.webapp.servlet.model.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/stulogin")
public class LoginServlet1 extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        int id = Integer.parseInt(req.getParameter("id"));
        String pass = req.getParameter("pass");
        Studentdao sto = new Studentdao();
        HttpSession session = req.getSession(true);
        Student student = sto.cklog(id, pass);
        if (student != null) {
            // req.getRequestDispatcher().forward(req, res);
            session.setAttribute("student", student);
            req.getRequestDispatcher("studentdashbord.jsp").forward(req, res);
        } else {
            req.setAttribute("error", " In-corret" + pass);
            // req.getRequestDispatcher(pass).forward(req, res);
            req.getRequestDispatcher("hom.jsp").forward(req, res);
        }
    }
}
