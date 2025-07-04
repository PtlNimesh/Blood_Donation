package com.blood.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DashboardDAO {
    private Connection conn;

    public DashboardDAO(Connection conn) {
        this.conn = conn;
    }

    public int getTotalDonors() throws SQLException {
        String sql = "SELECT COUNT(*) FROM donor";
        try (PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            return rs.next() ? rs.getInt(1) : 0;
        }
    }

    public int getTotalBloodUnits() throws SQLException {
        String sql = "SELECT SUM(units) FROM blood_stock";
        try (PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            return rs.next() ? rs.getInt(1) : 0;
        }
    }

    public int getPendingRequests() throws SQLException {
        String sql = "SELECT COUNT(*) FROM requests WHERE status = 'Pending'";
        try (PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            return rs.next() ? rs.getInt(1) : 0;
        }
    }
}
