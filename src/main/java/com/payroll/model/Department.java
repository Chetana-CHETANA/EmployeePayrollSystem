package com.payroll.model;
public class Department {
    private int id;
    private String departmentName;
    private String description;
    public Department() {}
    public Department(int id,String departmentName,String description){this.id=id;this.departmentName=departmentName;this.description=description;}
    public int getId(){return id;} public void setId(int id){this.id=id;}
    public String getDepartmentName(){return departmentName;} public void setDepartmentName(String v){departmentName=v;}
    public String getDescription(){return description;} public void setDescription(String v){description=v;}
}
