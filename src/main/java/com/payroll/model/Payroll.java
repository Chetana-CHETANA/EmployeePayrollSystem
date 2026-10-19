package com.payroll.model;
import java.math.BigDecimal;
import java.sql.Date;
public class Payroll {
    private int id, employeeId;
    private String employeeName, month, status;
    private BigDecimal basicSalary, allowance, deductions, grossSalary, netSalary;
    private Date paymentDate;
    public Payroll() {}
    public int getId(){return id;} public void setId(int v){id=v;}
    public int getEmployeeId(){return employeeId;} public void setEmployeeId(int v){employeeId=v;}
    public String getEmployeeName(){return employeeName;} public void setEmployeeName(String v){employeeName=v;}
    public String getMonth(){return month;} public void setMonth(String v){month=v;}
    public String getStatus(){return status;} public void setStatus(String v){status=v;}
    public BigDecimal getBasicSalary(){return basicSalary;} public void setBasicSalary(BigDecimal v){basicSalary=v;}
    public BigDecimal getAllowance(){return allowance;} public void setAllowance(BigDecimal v){allowance=v;}
    public BigDecimal getDeductions(){return deductions;} public void setDeductions(BigDecimal v){deductions=v;}
    public BigDecimal getGrossSalary(){return grossSalary;} public void setGrossSalary(BigDecimal v){grossSalary=v;}
    public BigDecimal getNetSalary(){return netSalary;} public void setNetSalary(BigDecimal v){netSalary=v;}
    public Date getPaymentDate(){return paymentDate;} public void setPaymentDate(Date v){paymentDate=v;}
}
