package com.payroll.model;
import java.math.BigDecimal;
public class Employee {
    private int id;
    private String fullName,email,designation,phoneNo,departmentName;
    private BigDecimal basicSalary;
    private int departmentId;
    public Employee() {}
    public int getId(){return id;} public void setId(int v){id=v;}
    public String getFullName(){return fullName;} public void setFullName(String v){fullName=v;}
    public String getEmail(){return email;} public void setEmail(String v){email=v;}
    public String getDesignation(){return designation;} public void setDesignation(String v){designation=v;}
    public BigDecimal getBasicSalary(){return basicSalary;} public void setBasicSalary(BigDecimal v){basicSalary=v;}
    public int getDepartmentId(){return departmentId;} public void setDepartmentId(int v){departmentId=v;}
    public String getPhoneNo(){return phoneNo;} public void setPhoneNo(String v){phoneNo=v;}
    public String getDepartmentName(){return departmentName;} public void setDepartmentName(String v){departmentName=v;}
}
