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

@WebServlet("/changepassword")
public class ChangePasswordServlet extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        HttpSession session = req.getSession(false);
        Student cr = (Student) session.getAttribute("student");
        String crpass = req.getParameter("currentpass");
        String n1 = req.getParameter("newpass1");
        String n2 = req.getParameter("newpass2");
        if (crpass.equals(cr.getPass()) && n1.equals(n2) && !n1.isEmpty()) {
            Studentdao obj = new Studentdao();
            obj.update(n1, cr.getId());
            cr.setPass(n1);
            session.setAttribute("student", cr);
            req.setAttribute("succ", "Password Updated sucessfully");
        } else {
            req.setAttribute("error", "Something Went Wrong Try-Again");
        }
        req.getRequestDispatcher("changepass.jsp").forward(req, res);
    }
}
