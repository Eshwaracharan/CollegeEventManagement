package com.example.webapp.servlet.controller;

import java.io.IOException;
// import java.util.*;
// import java.sql.ResultSet;
import java.util.List;

// import com.example.webapp.servlet.dao.Eventdao;
import com.example.webapp.servlet.dao.Registerdao;
import com.example.webapp.servlet.model.MyRigister;
// import com.example.webapp.servlet.model.Event;
import com.example.webapp.servlet.model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/MyEvents")
public class MyRigisterServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        HttpSession session = req.getSession();
        Student stu = (Student) session.getAttribute("student");
        Registerdao obj = new Registerdao();
        // Eventdao obj2 = new Eventdao();
        // List<Integer> Eids = obj.getMyEvents(stu.getId());
        // List<Event> Err = new ArrayList<>();
        // for (int ids : Eids) {
        // Err.add(obj2.getById(ids));
        // }
        // req.setAttribute("MyE", Err);
        // ResultSet rst = obj.getMyEvents(stu.getId());
        int sid;
        if (stu != null) {
            sid = stu.getId();
        } else {
            sid = Integer.parseInt(req.getParameter("id"));
        }
        List<MyRigister> arr = obj.getMyEvents(sid);
        req.setAttribute("rst", arr);
        if (stu != null) {
            req.getRequestDispatcher("myevents.jsp").forward(req, res);
        } else {
            req.getRequestDispatcher("getdata.jsp").forward(req, res);
        }
    }
}
