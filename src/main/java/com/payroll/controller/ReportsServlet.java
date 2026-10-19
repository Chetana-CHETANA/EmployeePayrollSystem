package com.payroll.controller;
import com.payroll.dao.PayrollDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/reports")
public class ReportsServlet extends HttpServlet {
    private final PayrollDAO dao=new PayrollDAO();
    protected void doGet(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        try{req.setAttribute("payrolls",dao.findAll());req.getRequestDispatcher("/reports.jsp").forward(req,resp);}catch(Exception e){throw new ServletException(e);}
    }
}
