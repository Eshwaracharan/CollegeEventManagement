package com.example.webapp.servlet.model;

import java.sql.Date;
import java.time.LocalDate;

public class Event {
    private int id;
    private String Ename;
    private LocalDate Edate;
    private String Edis;

    public Event() {
    }

    public Event(int id, String Ename, Date Edate, String Edis) {
        this.id = id;
        this.Ename = Ename;
        this.Edis = Edis;
        this.Edate = Edate.toLocalDate();
    }

    public Event(String eventName, Date eventDate, String description) {
        this.Ename = eventName;
        this.Edate = eventDate.toLocalDate();
        this.Edis = description;
    }

    public String getEname() {
        return Ename;
    }

    public String grtEdis() {
        return Edis;
    }

    public int getId() {
        return id;
    }

    public LocalDate getEdate() {
        return Edate;
    }
}
