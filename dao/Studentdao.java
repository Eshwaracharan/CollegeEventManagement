package com.example.webapp.servlet.dao;

import java.util.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.example.webapp.servlet.model.Student;
import com.example.webapp.servlet.util.DBConnection;

public class Studentdao {
    public Student cklog(int id, String pass) {
        String query = "select * from students where id=? and password=? ;";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setInt(1, id);
            pst.setString(2, pass);
            ResultSet rs = pst.executeQuery();
            if (rs.next())
                return new Student(rs.getInt(1), rs.getString(2), rs.getString(4), rs.getString(5), rs.getInt(6),
                        rs.getString(3));
            else
                return null;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public void update(String pass, int id) {
        String query = "update students set password=? where id=? ;";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setString(1, pass);
            pst.setInt(2, id);
            pst.executeUpdate();
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
    }

    public boolean isIdExist(int id) {
        String query = "SELECT id FROM students WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
            return true;
        }
    }

    public boolean isEmailExist(String email) {
        String query = "SELECT email FROM students WHERE email=?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
            return true;
        }
    }

    public boolean addStudent(Student stu, String email) {
        String query = "INSERT INTO students (id, name, email, password, branch, year) VALUES (?,?,?,?,?,?)";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setInt(1, stu.getId());
            pst.setString(2, stu.getName());
            pst.setString(3, email);
            pst.setString(4, stu.getPass());
            pst.setString(5, stu.getBranch());
            pst.setInt(6, stu.getYear());
            int i = pst.executeUpdate();
            return i > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Student> getall() {
        String qur = "select * from students order by year,branch;";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pst = conn.prepareStatement(qur)) {
            ResultSet rs = pst.executeQuery();
            List<Student> ans = new ArrayList<>();
            while (rs.next()) {
                ans.add(new Student(rs.getInt(1), rs.getString(2), rs.getString(4), rs.getString(5), rs.getInt(6),
                        rs.getString(3)));
            }
            return ans;

        } catch (Exception e) {
            // TODO: handle exception
            return null;
        }
    }

    public Student getById(int id) {
        String qur = "select * from students where id=?;";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pst = conn.prepareStatement(qur)) {
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return new Student(rs.getInt(1), rs.getString(2), rs.getString(4), rs.getString(5), rs.getInt(6),
                        rs.getString(3));
            }
            return null;
        } catch (Exception e) {
            return null;
        }

    }
}
