package com.blood.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.blood.model.Donor;
import com.blood.util.DBUtil;

public class DonorDAO {

    // Register a new donor
    public static boolean registerDonor(String name, String email, String password,
            String phone, String address, String bloodGroup) {
        try (Connection con = DBUtil.getConnection()) {
            String sql = "INSERT INTO donor (name, email, password, phone, address, bloodGroup) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, phone);
            ps.setString(5, address);
            ps.setString(6, bloodGroup);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Login validation
    public Donor validateDonor(String email, String password) {
        Donor donor = null;

        try (Connection con = DBUtil.getConnection()) {
            String query = "SELECT * FROM donor WHERE email=? AND password=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                donor = extractDonorFromResultSet(rs);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return donor;
    }

    // Get all donors
    public List<Donor> getAllDonors() {
        List<Donor> donors = new ArrayList<>();
        try (Connection con = DBUtil.getConnection()) {
            String query = "SELECT * FROM donor";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                donors.add(extractDonorFromResultSet(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return donors;
    }

    // Get donor by ID
    public Donor getDonorById(int id) {
        Donor donor = null;
        try (Connection con = DBUtil.getConnection()) {
            String query = "SELECT * FROM donor WHERE id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                donor = extractDonorFromResultSet(rs);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return donor;
    }

    // Update donor details
    public boolean updateDonor(Donor donor) {
        try (Connection con = DBUtil.getConnection()) {
            String sql = "UPDATE donor SET name=?, email=?, phone=?, address=?, bloodGroup=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, donor.getName());
            ps.setString(2, donor.getEmail());
            ps.setString(3, donor.getPhone());
            ps.setString(4, donor.getAddress());
            ps.setString(5, donor.getBloodGroup());
            ps.setInt(6, donor.getId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Delete donor
    public boolean deleteDonor(int id) {
        try (Connection con = DBUtil.getConnection()) {
            String sql = "DELETE FROM donor WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Utility method to extract donor from ResultSet
    private Donor extractDonorFromResultSet(ResultSet rs) throws SQLException {
        Donor donor = new Donor();
        donor.setId(rs.getInt("id"));
        donor.setName(rs.getString("name"));
        donor.setEmail(rs.getString("email"));
        donor.setPhone(rs.getString("phone"));
        donor.setAddress(rs.getString("address"));
        donor.setBloodGroup(rs.getString("bloodGroup"));
        return donor;
    }
}
