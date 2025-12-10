package com.example.webapp.servlet.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import com.example.webapp.servlet.dao.Eventdao;
import com.example.webapp.servlet.model.Event;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/upcoming")
public class UpEventsServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        LocalDate crDate = LocalDate.now();
        Eventdao obj = new Eventdao();
        List<Event> upEvents = obj.getup(crDate);
        req.setAttribute("up", upEvents);
        req.getRequestDispatcher("upevents.jsp").forward(req, res);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doGet(req, res);
    }
}
