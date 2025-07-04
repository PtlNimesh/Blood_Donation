package com.blood.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.blood.model.Donation;

public class DonationDAO {

    private final String URL = "jdbc:mysql://localhost:3306/bloodbank";
    private final String USER = "root";
    private final String PASS = "Nimesh@2005";

    public List<Donation> getAllDonations() {
        List<Donation> list = new ArrayList<>();

        try {
            Connection con = DriverManager.getConnection(URL, USER, PASS);
            String sql = "SELECT * FROM donations";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Donation d = new Donation();
                d.setId(rs.getInt("donor_id"));
                d.setDonorName(rs.getString("donor_name"));
                d.setBloodGroup(rs.getString("blood_group"));
                d.setDate(rs.getString("donation_date"));
                d.setLocation(rs.getString("location"));
                list.add(d);
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean deleteDonationById(int id) {
        boolean success = false;

        try {
            Connection con = DriverManager.getConnection(URL, USER, PASS);
            String sql = "DELETE FROM donations WHERE donor_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            int rows = ps.executeUpdate();
            if (rows > 0) {
                success = true;
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }
}
