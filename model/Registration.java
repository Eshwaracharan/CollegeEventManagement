package com.example.webapp.servlet.model;

import java.sql.Date;
import java.time.LocalDate;

public class Registration {
    public int Rid;
    public int Eid;
    public int Sid;
    public LocalDate R_dt;

    public Registration() {

    }

    public Registration(int Rid, int Eid, int Sid, Date R_dt) {
        this.Rid = Rid;
        this.Eid = Eid;
        this.Sid = Sid;
        this.R_dt = R_dt.toLocalDate();
    }
}
