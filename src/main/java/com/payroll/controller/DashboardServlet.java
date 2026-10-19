package com.payroll.controller;
import com.payroll.dao.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
    private final EmployeeDAO edao=new EmployeeDAO(); private final DepartmentDAO ddao=new DepartmentDAO(); private final PayrollDAO pdao=new PayrollDAO();
    protected void doGet(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        try{req.setAttribute("employeeCount",edao.count());req.setAttribute("departmentCount",ddao.findAll().size());req.setAttribute("monthlyPayroll",pdao.monthlyExpense());req.getRequestDispatcher("/dashboard.jsp").forward(req,resp);}
        catch(Exception e){throw new ServletException(e);}
    }
}
