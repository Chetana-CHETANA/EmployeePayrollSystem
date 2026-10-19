package com.payroll.dao;
import com.payroll.config.DatabaseConnection;
import com.payroll.model.Payroll;
import java.math.BigDecimal;
import java.sql.*;
import java.util.*;

public class PayrollDAO {
    public List<Payroll> findAll() throws SQLException{
        List<Payroll> list=new ArrayList<>();
        String sql="SELECT p.*,e.full_name FROM payroll p JOIN employees e ON p.employee_id=e.id ORDER BY p.payment_date DESC,p.id DESC";
        try(Connection c=DatabaseConnection.getConnection();PreparedStatement ps=c.prepareStatement(sql);ResultSet rs=ps.executeQuery()){
            while(rs.next())list.add(map(rs));
        }return list;
    }
    public void save(Payroll p)throws SQLException{
        String sql="INSERT INTO payroll(employee_id,month,basic_salary,allowance,deductions,gross_salary,net_salary,payment_date,status) VALUES(?,?,?,?,?,?,?,?,?)";
        try(Connection c=DatabaseConnection.getConnection();PreparedStatement ps=c.prepareStatement(sql)){
            ps.setInt(1,p.getEmployeeId());ps.setString(2,p.getMonth());ps.setBigDecimal(3,p.getBasicSalary());
            ps.setBigDecimal(4,p.getAllowance());ps.setBigDecimal(5,p.getDeductions());ps.setBigDecimal(6,p.getGrossSalary());
            ps.setBigDecimal(7,p.getNetSalary());ps.setDate(8,p.getPaymentDate());ps.setString(9,p.getStatus());ps.executeUpdate();
        }
    }
    public BigDecimal monthlyExpense()throws SQLException{
        String sql="SELECT COALESCE(SUM(net_salary),0) FROM payroll WHERE month=DATE_FORMAT(CURDATE(),'%Y-%m')";
        try(Connection c=DatabaseConnection.getConnection();PreparedStatement ps=c.prepareStatement(sql);ResultSet rs=ps.executeQuery()){rs.next();return rs.getBigDecimal(1);}
    }
    private Payroll map(ResultSet rs)throws SQLException{
        Payroll p=new Payroll();p.setId(rs.getInt("id"));p.setEmployeeId(rs.getInt("employee_id"));p.setEmployeeName(rs.getString("full_name"));
        p.setMonth(rs.getString("month"));p.setBasicSalary(rs.getBigDecimal("basic_salary"));p.setAllowance(rs.getBigDecimal("allowance"));
        p.setDeductions(rs.getBigDecimal("deductions"));p.setGrossSalary(rs.getBigDecimal("gross_salary"));p.setNetSalary(rs.getBigDecimal("net_salary"));
        p.setPaymentDate(rs.getDate("payment_date"));p.setStatus(rs.getString("status"));return p;
    }
}
