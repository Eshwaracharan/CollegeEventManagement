package com.example.webapp.servlet.controller;

import java.io.IOException;
import java.sql.Date;

import com.example.webapp.servlet.dao.Eventdao;
import com.example.webapp.servlet.model.Event;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddEventServlet")
public class AddEventServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("event_name");
        String dateStr = request.getParameter("event_date");
        String description = request.getParameter("description");

        String message = "";

        try {
            Date eventDate = Date.valueOf(dateStr); // convert String to java.sql.Date
            Event event = new Event(name, eventDate, description);

            Eventdao dao = new Eventdao();
            boolean success = dao.addEvent(event);

            message = success ? "Event added successfully!" : "Failed to add event!";

        } catch (Exception e) {
            e.printStackTrace();
            message = "Error: " + e.getMessage();
        }

        // Send message back to JSP
        request.setAttribute("message", message);
        request.getRequestDispatcher("addevent.jsp").forward(request, response);
    }
}
