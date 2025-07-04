package com.blood.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.blood.model.Officer;
import com.blood.util.DBUtil;

public class OfficerDAO {
    public static Officer validateOfficer(String email, String password) {
        Officer officer = null;

        try (Connection con = DBUtil.getConnection()) {
            String sql = "SELECT * FROM officer WHERE email = ? AND password = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                officer = new Officer();
                officer.setId(rs.getInt("id"));
                officer.setName(rs.getString("name"));
                officer.setEmail(rs.getString("email"));
                officer.setPhone(rs.getString("phone"));
                officer.setAddress(rs.getString("address"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return officer;
    }

    private Connection conn;

    public List<Officer> getAllHospitals() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blood_db", "root", "root");
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<Officer> list = new ArrayList<>();
        try {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM hospitals");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Officer h = new Officer();
                h.setId(rs.getInt("id"));
                h.setName(rs.getString("name"));
                h.setEmail(rs.getString("email"));
                h.setPhone(rs.getString("phone"));
                h.setAddress(rs.getString("address"));
                list.add(h);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean addHospital(Officer h) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blood_db", "root", "root");
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            PreparedStatement ps = conn
                    .prepareStatement("INSERT INTO hospitals(name, email, phone, address) VALUES (?, ?, ?, ?)");
            ps.setString(1, h.getName());
            ps.setString(2, h.getEmail());
            ps.setString(3, h.getPhone());
            ps.setString(4, h.getAddress());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public Officer getHospitalById(int id) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blood_db", "root", "root");
        } catch (Exception e) {
            e.printStackTrace();
        }
        Officer h = new Officer();
        try {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM hospitals WHERE id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                h.setId(rs.getInt("id"));
                h.setName(rs.getString("name"));
                h.setEmail(rs.getString("email"));
                h.setPhone(rs.getString("phone"));
                h.setAddress(rs.getString("address"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return h;
    }

    public boolean updateHospital(Officer h) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blood_db", "root", "root");
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            PreparedStatement ps = conn
                    .prepareStatement("UPDATE hospitals SET name=?, email=?, phone=?, address=? WHERE id=?");
            ps.setString(1, h.getName());
            ps.setString(2, h.getEmail());
            ps.setString(3, h.getPhone());
            ps.setString(4, h.getAddress());
            ps.setInt(5, h.getId());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteHospital(int id) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blood_db", "root", "root");
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            PreparedStatement ps = conn.prepareStatement("DELETE FROM hospitals WHERE id=?");
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
