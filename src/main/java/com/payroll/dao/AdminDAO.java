package com.payroll.dao;
import com.payroll.config.DatabaseConnection;
import com.payroll.model.Admin;
import java.sql.*;

public class AdminDAO {
    public Admin authenticate(String username, String password) throws SQLException {
        String sql="SELECT id,username,password FROM admin WHERE username=? AND password=?";
        try(Connection c=DatabaseConnection.getConnection(); PreparedStatement ps=c.prepareStatement(sql)){
            ps.setString(1,username); ps.setString(2,password);
            try(ResultSet rs=ps.executeQuery()){
                if(rs.next()) return new Admin(rs.getInt("id"),rs.getString("username"),rs.getString("password"));
            }
        }
        return null;
    }

    public boolean usernameExists(String username, int excludeId) throws SQLException {
        String sql = "SELECT COUNT(*) FROM admin WHERE username=? AND id<>?";
        try (Connection c=DatabaseConnection.getConnection(); PreparedStatement ps=c.prepareStatement(sql)) {
            ps.setString(1, username); ps.setInt(2, excludeId);
            try (ResultSet rs=ps.executeQuery()) { rs.next(); return rs.getInt(1)>0; }
        }
    }

    public void updateCredentials(int id, String username, String password) throws SQLException {
        String sql="UPDATE admin SET username=?, password=? WHERE id=?";
        try (Connection c=DatabaseConnection.getConnection(); PreparedStatement ps=c.prepareStatement(sql)) {
            ps.setString(1,username); ps.setString(2,password); ps.setInt(3,id); ps.executeUpdate();
        }
    }
}
