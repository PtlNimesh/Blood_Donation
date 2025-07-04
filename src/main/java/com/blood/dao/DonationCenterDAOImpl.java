package com.blood.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.blood.model.DonationCenter;
import com.blood.util.DBUtil;

public class DonationCenterDAOImpl implements DonationCenterDAO {
    private Connection conn;

    public DonationCenterDAOImpl() throws Exception {
        try {
            conn = DBUtil.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<DonationCenter> getAllCenters() {
        List<DonationCenter> centers = new ArrayList<>();
        try {
            String sql = "SELECT * FROM donation_center";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                DonationCenter center = new DonationCenter();
                center.setId(rs.getString("id"));
                center.setName(rs.getString("name"));
                centers.add(center);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return centers;
    }
}
