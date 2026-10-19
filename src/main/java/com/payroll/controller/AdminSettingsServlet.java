package com.payroll.controller;
import com.payroll.dao.AdminDAO;
import com.payroll.model.Admin;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin-settings")
public class AdminSettingsServlet extends HttpServlet {
 private final AdminDAO dao=new AdminDAO();
 protected void doGet(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
  Admin a=(Admin)req.getSession().getAttribute("admin"); req.setAttribute("currentUsername",a.getUsername()); req.getRequestDispatcher("/admin-settings.jsp").forward(req,resp);
 }
 protected void doPost(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
  Admin a=(Admin)req.getSession().getAttribute("admin"); String u=req.getParameter("username"),p=req.getParameter("password"),cp=req.getParameter("confirmPassword");
  if(u==null||u.isBlank()||p==null||p.isBlank()){req.setAttribute("error","Username and password are required.");req.setAttribute("currentUsername",a.getUsername());req.getRequestDispatcher("/admin-settings.jsp").forward(req,resp);return;}
  if(!p.equals(cp)){req.setAttribute("error","Passwords do not match.");req.setAttribute("currentUsername",a.getUsername());req.getRequestDispatcher("/admin-settings.jsp").forward(req,resp);return;}
  try{ if(dao.usernameExists(u.trim(),a.getId())){req.setAttribute("error","That username is already in use.");req.setAttribute("currentUsername",a.getUsername());req.getRequestDispatcher("/admin-settings.jsp").forward(req,resp);return;} dao.updateCredentials(a.getId(),u.trim(),p); a.setUsername(u.trim());a.setPassword(p);req.getSession().setAttribute("admin",a);req.setAttribute("success","Username and password updated successfully.");req.setAttribute("currentUsername",a.getUsername());req.getRequestDispatcher("/admin-settings.jsp").forward(req,resp);}catch(Exception e){throw new ServletException("Unable to update login credentials.",e);}
 }
}
