package com.example.webapp.servlet.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import com.example.webapp.servlet.model.Event;
import com.example.webapp.servlet.util.DBConnection;

public class Eventdao {
    public List<Event> getup(LocalDate crDate) {
        List<Event> up = new ArrayList<>();
        Date dt = Date.valueOf(crDate);
        String query = " select * from events where event_date>? order by event_date;";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setDate(1, dt);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                up.add(new Event(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4)));
            }
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
        return up;
    }

    public Event getById(int id) {
        String query = " select * from events where id=?;";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setInt(1, id);
            ResultSet rst = pst.executeQuery();
            if (rst.next()) {
                return new Event(rst.getInt(1), rst.getString(2), rst.getDate(3), rst.getString(4));
            } else {
                return null;
            }
        } catch (Exception e) {
            return null;
        }
    }

    public boolean getByidDate(int id, LocalDate dt) {
        Date sdt = Date.valueOf(dt);
        String query = " select * from events where id=? and event_date>? ;";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setInt(1, id);
            pst.setDate(2, sdt);
            ResultSet rst = pst.executeQuery();
            if (rst.next()) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            return false;
        }
    }

    public boolean addEvent(Event event) {
        String query = "INSERT INTO events (event_name, event_date, description) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pst = conn.prepareStatement(query)) {

            pst.setString(1, event.getEname());
            pst.setDate(2, Date.valueOf(event.getEdate()));
            pst.setString(3, event.grtEdis());

            int i = pst.executeUpdate();
            return i > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Event> getTodaysEvents() {
        List<Event> events = new ArrayList<>();
        String query = "SELECT * FROM events WHERE event_date = CURDATE()";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pst = conn.prepareStatement(query);
                ResultSet rs = pst.executeQuery()) {

            while (rs.next()) {
                Event e = new Event(
                        rs.getInt("id"),
                        rs.getString("event_name"),
                        rs.getDate("event_date"),
                        rs.getString("description"));
                events.add(e);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return events;
    }
}
