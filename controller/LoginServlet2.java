package com.example.webapp.servlet.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/collage")
public class LoginServlet2 extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        String name = req.getParameter("name");
        String pass = req.getParameter("pass");
        HttpSession session = req.getSession(false);
        if (session != null) {
            session.invalidate(); // old session destroyed
        }
        // create new session
        HttpSession newSession = req.getSession(true);
        if (name.equals(pass) && name.equals("college")) {
            req.getRequestDispatcher("collagedashbord.jsp").forward(req, res);
        } else {
            req.setAttribute("mess", "In-Correct");
            req.getRequestDispatcher("hom.jsp").forward(req, res);
        }

    }

}
