package com.example.webapp.servlet.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.*;

import com.example.webapp.servlet.model.MyRigister;
import com.example.webapp.servlet.model.Registration;
import com.example.webapp.servlet.util.DBConnection;

public class Registerdao {
    public boolean checkIds(int Eid, int Sid) {
        String query = " select * from  registrations where  student_id=? and event_id=?;";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setInt(1, Sid);
            pst.setInt(2, Eid);
            ResultSet rst = pst.executeQuery();
            if (rst.next()) {
                return false;
            } else {
                return true;
            }
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
            return false;
        }
    }

    public void getRigester(int Eid, int Sid) {
        LocalDate dt = LocalDate.now();
        Date sdt = Date.valueOf(dt);
        String query = " insert into registrations(event_id, student_id,registration_date) values (?,?,?);";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setInt(1, Eid);
            pst.setInt(2, Sid);
            pst.setDate(3, sdt);
            pst.executeUpdate();
        } catch (Exception e) {
            // TODO: handle exception
        }
    }

    public Registration getRig(int Eid, int Sid) {
        String query = " select * from  registrations where  student_id=? and event_id=?;";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setInt(1, Sid);
            pst.setInt(2, Eid);
            ResultSet rst = pst.executeQuery();
            if (rst.next()) {
                Registration ris = new Registration(rst.getInt(1), Eid, Sid, rst.getDate(4));
                return ris;
            }
            return null;
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
            return null;
        }
    }

    public List<MyRigister> getMyEvents(int Sid) {
        String query = " select reg_id,event_id,event_name,event_date,registration_date from registrations left join events on registrations.event_id = events.id where student_id=?;";
        List<MyRigister> arr = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setInt(1, Sid);
            ResultSet rst = pst.executeQuery();
            while (rst.next()) {
                arr.add(new MyRigister(rst.getInt(1), rst.getInt(2), rst.getString(3), rst.getDate(4), rst.getDate(5)));
            }
            return arr;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}
