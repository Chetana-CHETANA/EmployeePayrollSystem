package com.payroll.dao;
import com.payroll.config.DatabaseConnection;
import com.payroll.model.Department;
import java.sql.*;
import java.util.*;

public class DepartmentDAO {
    public List<Department> findAll() throws SQLException {
        List<Department> list=new ArrayList<>();
        try(Connection c=DatabaseConnection.getConnection(); PreparedStatement ps=c.prepareStatement("SELECT * FROM departments ORDER BY id DESC"); ResultSet rs=ps.executeQuery()){
            while(rs.next()) list.add(map(rs));
        } return list;
    }
    public Department findById(int id) throws SQLException {
        try(Connection c=DatabaseConnection.getConnection(); PreparedStatement ps=c.prepareStatement("SELECT * FROM departments WHERE id=?")){
            ps.setInt(1,id); try(ResultSet rs=ps.executeQuery()){return rs.next()?map(rs):null;}
        }
    }
    public void save(Department d) throws SQLException {
        String sql=d.getId()==0?"INSERT INTO departments(department_name,description) VALUES(?,?)":"UPDATE departments SET department_name=?,description=? WHERE id=?";
        try(Connection c=DatabaseConnection.getConnection(); PreparedStatement ps=c.prepareStatement(sql)){
            ps.setString(1,d.getDepartmentName()); ps.setString(2,d.getDescription()); if(d.getId()!=0) ps.setInt(3,d.getId()); ps.executeUpdate();
        }
    }
    public void delete(int id) throws SQLException {
        try(Connection c=DatabaseConnection.getConnection(); PreparedStatement ps=c.prepareStatement("DELETE FROM departments WHERE id=?")){ps.setInt(1,id);ps.executeUpdate();}
    }
    private Department map(ResultSet rs)throws SQLException{return new Department(rs.getInt("id"),rs.getString("department_name"),rs.getString("description"));}
}
