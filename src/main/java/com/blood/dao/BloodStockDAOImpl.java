package com.blood.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.blood.model.BloodStock;
import com.blood.util.DBUtil;

public class BloodStockDAOImpl implements BloodStockDAO {
    private Connection conn;

    public BloodStockDAOImpl() throws Exception {
        try {
            conn = DBUtil.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<BloodStock> getStocks(String centerId, String bloodType) {
        List<BloodStock> stocks = new ArrayList<>();
        try {
            String sql = "SELECT bs.*, dc.name as center_name FROM blood_stock bs JOIN donation_center dc ON bs.center_id = dc.id WHERE 1=1";
            if (!centerId.equals("all"))
                sql += " AND bs.center_id = ?";
            if (!bloodType.equals("all"))
                sql += " AND bs.blood_type = ?";

            PreparedStatement stmt = conn.prepareStatement(sql);

            int paramIndex = 1;
            if (!centerId.equals("all"))
                stmt.setString(paramIndex++, centerId);
            if (!bloodType.equals("all"))
                stmt.setString(paramIndex++, bloodType);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                BloodStock stock = new BloodStock();
                stock.setId(rs.getInt("id"));
                stock.setBloodType(rs.getString("blood_type"));
                stock.setUnits(rs.getInt("units"));
                stock.setCenterId(rs.getString("center_id"));
                stock.setCenterName(rs.getString("center_name"));
                stock.setLastUpdated(rs.getString("last_updated"));

                stocks.add(stock);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return stocks;
    }

    @Override
    public boolean addStock(BloodStock stock) {
        boolean result = false;
        String sql = "INSERT INTO blood_stock (blood_type, units, center_id) VALUES (?, ?, ?)";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, stock.getBloodType());
            stmt.setInt(2, stock.getUnits());
            stmt.setString(3, stock.getCenterId());

            int rows = stmt.executeUpdate();
            result = (rows > 0);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

}
