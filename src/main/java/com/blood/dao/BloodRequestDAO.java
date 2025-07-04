package com.blood.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.blood.model.BloodRequest;
import com.blood.util.DBUtil;

public class BloodRequestDAO {

    public static boolean requestBlood(String name, String email, String phone,
            String bloodGroup, String location) {
        try (Connection con = DBUtil.getConnection()) {
            String sql = "INSERT INTO blood_request (name, email, phone, bloodGroup, location) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, bloodGroup);
            ps.setString(5, location);

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<BloodRequest> getAllRequests() {
        List<BloodRequest> list = new ArrayList<>();

        try (Connection conn = DBUtil.getConnection()) {
            String sql = "SELECT * FROM blood_request";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                BloodRequest r = new BloodRequest();
                r.setName(rs.getString("name"));
                r.setEmail(rs.getString("email"));
                r.setPhone(rs.getString("phone"));
                r.setBloodGroup(rs.getString("bloodGroup"));
                r.setLocation(rs.getString("location"));
                list.add(r);
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

}
