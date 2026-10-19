package com.payroll.controller;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebFilter(urlPatterns={"/dashboard","/departments","/employees","/payroll","/reports","/admin-settings"})
public class AuthFilter implements Filter {
    public void doFilter(ServletRequest request,ServletResponse response,FilterChain chain)throws IOException,ServletException{
        HttpServletRequest req=(HttpServletRequest)request;HttpServletResponse resp=(HttpServletResponse)response;
        if(req.getSession(false)==null || req.getSession(false).getAttribute("admin")==null){resp.sendRedirect(req.getContextPath()+"/login");return;}
        chain.doFilter(request,response);
    }
}
