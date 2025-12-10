package com.example.webapp.servlet.controller;

import java.io.IOException;
import java.util.List;

import com.example.webapp.servlet.dao.Eventdao;
import com.example.webapp.servlet.model.Event;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/todayevents")
public class TodaysEventsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Eventdao dao = new Eventdao();
        List<Event> todaysEvents = dao.getTodaysEvents();

        request.setAttribute("todaysEvents", todaysEvents);
        request.getRequestDispatcher("todaysevents.jsp").forward(request, response);
    }
}
