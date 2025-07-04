package com.blood.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.blood.model.Admin;
import com.blood.util.DBUtil;

public class AdminDAO {
    public static Admin validate(String username, String password) {
        Admin admin = null;

        try (Connection con = DBUtil.getConnection()) {
            String sql = "SELECT * FROM admin WHERE username = ? AND password = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                admin = new Admin();
                admin.setId(rs.getInt("id"));
                admin.setUsername(rs.getString("username"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return admin;
    }
}
