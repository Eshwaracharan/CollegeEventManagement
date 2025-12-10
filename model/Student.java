package com.example.webapp.servlet.model;

public class Student {
    private int id;
    private String name;
    private String branch;
    private int year;
    private String password;
    private String email;

    // Constructor
    public Student() {
    }

    public Student(int id, String name, String password, String branch, int year, String email) {
        this.id = id;
        this.name = name;
        this.branch = branch;
        this.year = year;
        this.password = password;
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getBranch() {
        return branch;
    }

    public int getYear() {
        return year;
    }

    public String getPass() {
        return password;
    }

    public void setPass(String ps) {
        this.password = ps;
    }

    public String getEmail() {
        return email;
    }
}
