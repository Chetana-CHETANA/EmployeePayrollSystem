package com.payroll.controller;
import com.payroll.dao.DepartmentDAO;
import com.payroll.model.Department;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/departments")
public class DepartmentServlet extends HttpServlet {
    private final DepartmentDAO dao=new DepartmentDAO();
    protected void doGet(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        try{req.setAttribute("departments",dao.findAll());req.getRequestDispatcher("/departments.jsp").forward(req,resp);}catch(Exception e){throw new ServletException(e);}
    }
    protected void doPost(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        try{
            String action=req.getParameter("action");
            if("delete".equals(action)){dao.delete(Integer.parseInt(req.getParameter("id")));}
            else {Department d=new Department();String id=req.getParameter("id");d.setId(id==null||id.isBlank()?0:Integer.parseInt(id));d.setDepartmentName(req.getParameter("departmentName"));d.setDescription(req.getParameter("description"));dao.save(d);}
            resp.sendRedirect("departments");
        }catch(Exception e){throw new ServletException("Department operation failed.",e);}
    }
}
