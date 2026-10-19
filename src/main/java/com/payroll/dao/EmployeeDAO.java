package com.payroll.dao;
import com.payroll.config.DatabaseConnection;
import com.payroll.model.Employee;
import java.sql.*;
import java.util.*;

public class EmployeeDAO {
    private static final String BASE="SELECT e.*, d.department_name FROM employees e JOIN departments d ON e.department_id=d.id";
    public List<Employee> findAll() throws SQLException {
        List<Employee> list=new ArrayList<>();
        try(Connection c=DatabaseConnection.getConnection(); PreparedStatement ps=c.prepareStatement(BASE+" ORDER BY e.id DESC"); ResultSet rs=ps.executeQuery()){
            while(rs.next()) list.add(map(rs));
        } return list;
    }
    public Employee findById(int id)throws SQLException{
        try(Connection c=DatabaseConnection.getConnection();PreparedStatement ps=c.prepareStatement(BASE+" WHERE e.id=?")){
            ps.setInt(1,id);try(ResultSet rs=ps.executeQuery()){return rs.next()?map(rs):null;}
        }
    }
    public void save(Employee e)throws SQLException{
        String sql=e.getId()==0?
        "INSERT INTO employees(full_name,email,designation,basic_salary,department_id,phone_no) VALUES(?,?,?,?,?,?)":
        "UPDATE employees SET full_name=?,email=?,designation=?,basic_salary=?,department_id=?,phone_no=? WHERE id=?";
        try(Connection c=DatabaseConnection.getConnection();PreparedStatement ps=c.prepareStatement(sql)){
            ps.setString(1,e.getFullName());ps.setString(2,e.getEmail());ps.setString(3,e.getDesignation());
            ps.setBigDecimal(4,e.getBasicSalary());ps.setInt(5,e.getDepartmentId());ps.setString(6,e.getPhoneNo());
            if(e.getId()!=0) ps.setInt(7,e.getId());ps.executeUpdate();
        }
    }
    public void delete(int id)throws SQLException{
        try(Connection c=DatabaseConnection.getConnection();PreparedStatement ps=c.prepareStatement("DELETE FROM employees WHERE id=?")){ps.setInt(1,id);ps.executeUpdate();}
    }
    public int count()throws SQLException{return countSql("SELECT COUNT(*) FROM employees");}
    private int countSql(String sql)throws SQLException{try(Connection c=DatabaseConnection.getConnection();PreparedStatement ps=c.prepareStatement(sql);ResultSet rs=ps.executeQuery()){rs.next();return rs.getInt(1);}}
    private Employee map(ResultSet rs)throws SQLException{
        Employee e=new Employee();e.setId(rs.getInt("id"));e.setFullName(rs.getString("full_name"));e.setEmail(rs.getString("email"));
        e.setDesignation(rs.getString("designation"));e.setBasicSalary(rs.getBigDecimal("basic_salary"));e.setDepartmentId(rs.getInt("department_id"));
        e.setPhoneNo(rs.getString("phone_no"));e.setDepartmentName(rs.getString("department_name"));return e;
    }
}
