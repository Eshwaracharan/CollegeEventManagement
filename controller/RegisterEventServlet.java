package com.example.webapp.servlet.controller;

import java.io.IOException;
import java.time.LocalDate;
import com.example.webapp.servlet.dao.Eventdao;
import com.example.webapp.servlet.model.Student;
import com.example.webapp.servlet.dao.Registerdao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/register")
public class RegisterEventServlet extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        int Eid = Integer.parseInt(req.getParameter("id"));
        HttpSession session = req.getSession(false);
        Student Stu = (Student) session.getAttribute("student");
        LocalDate crd = LocalDate.now();
        Registerdao obj2 = new Registerdao();
        Eventdao obj = new Eventdao();
        if (!obj.getByidDate(Eid, crd)) {
            req.setAttribute("mess", "Enter valid Event Id");
            req.getRequestDispatcher("upcoming").forward(req, res);
        } else if (!obj2.checkIds(Eid, Stu.getId())) {
            req.setAttribute("mess", "You have already registered for it!");
            req.getRequestDispatcher("upcoming").forward(req, res);
        } else {
            obj2.getRigester(Eid, Stu.getId());
            req.setAttribute("rig", obj2.getRig(Eid, Stu.getId()));
            req.setAttribute("event", obj.getById(Eid));
            req.getRequestDispatcher("registrationform.jsp").forward(req, res);
        }
    }

}
