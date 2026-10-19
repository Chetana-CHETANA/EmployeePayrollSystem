package com.payroll.controller;
import com.payroll.dao.AdminDAO;
import com.payroll.model.Admin;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private final AdminDAO dao=new AdminDAO();
    protected void doGet(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        if(req.getSession(false)!=null && req.getSession(false).getAttribute("admin")!=null){resp.sendRedirect("dashboard");return;}
        req.getRequestDispatcher("/login.jsp").forward(req,resp);
    }
    protected void doPost(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        String username=req.getParameter("username"), password=req.getParameter("password");
        try{
            Admin a=dao.authenticate(username,password);
            if(a!=null){HttpSession s=req.getSession(true);s.setAttribute("admin",a);s.setMaxInactiveInterval(30*60);resp.sendRedirect("dashboard");}
            else {req.setAttribute("error","Invalid username or password.");req.getRequestDispatcher("/login.jsp").forward(req,resp);}
        }catch(Exception e){throw new ServletException("Database error during login.",e);}
    }
}
