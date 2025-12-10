package com.example.webapp.servlet.model;

import java.sql.Date;
import java.time.LocalDate;

public class MyRigister {
    public int r_id;
    public int e_id;
    public String Ename;
    public LocalDate Edt;
    public LocalDate Rdt;

    public MyRigister(int rid, int eid, String Ename, Date edt, Date rdt) {
        this.r_id = rid;
        this.e_id = eid;
        this.Ename = Ename;
        this.Edt = edt.toLocalDate();
        this.Rdt = rdt.toLocalDate();
    }
}
