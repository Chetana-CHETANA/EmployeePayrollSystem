package com.payroll.controller;
import com.payroll.dao.*;
import com.payroll.model.Employee;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/employees")
public class EmployeeServlet extends HttpServlet {
    private final EmployeeDAO dao=new EmployeeDAO(); private final DepartmentDAO ddao=new DepartmentDAO();
    protected void doGet(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        try{req.setAttribute("employees",dao.findAll());req.setAttribute("departments",ddao.findAll());req.getRequestDispatcher("/employees.jsp").forward(req,resp);}catch(Exception e){throw new ServletException(e);}
    }
    protected void doPost(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        try{
            String action=req.getParameter("action");
            if("delete".equals(action)){dao.delete(Integer.parseInt(req.getParameter("id")));}
            else{
                Employee e=new Employee();String id=req.getParameter("id");e.setId(id==null||id.isBlank()?0:Integer.parseInt(id));
                e.setFullName(req.getParameter("fullName"));e.setEmail(req.getParameter("email"));e.setDesignation(req.getParameter("designation"));
                e.setBasicSalary(new BigDecimal(req.getParameter("basicSalary")));e.setDepartmentId(Integer.parseInt(req.getParameter("departmentId")));e.setPhoneNo(req.getParameter("phoneNo"));dao.save(e);
            }
            resp.sendRedirect("employees");
        }catch(Exception e){throw new ServletException("Employee operation failed.",e);}
    }
}
