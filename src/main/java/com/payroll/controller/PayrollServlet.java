package com.payroll.controller;
import com.payroll.dao.*;
import com.payroll.model.Payroll;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.time.LocalDate;
import java.time.YearMonth;

@WebServlet("/payroll")
public class PayrollServlet extends HttpServlet {
    private final PayrollDAO dao=new PayrollDAO(); private final EmployeeDAO edao=new EmployeeDAO();
    protected void doGet(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        try{req.setAttribute("employees",edao.findAll());req.setAttribute("payrolls",dao.findAll());req.getRequestDispatcher("/payroll.jsp").forward(req,resp);}catch(Exception e){throw new ServletException(e);}
    }
    protected void doPost(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        try{
            BigDecimal basic=new BigDecimal(req.getParameter("basicSalary"));
            BigDecimal allowance=new BigDecimal(defaultZero(req.getParameter("allowance")));
            BigDecimal deductions=new BigDecimal(defaultZero(req.getParameter("deductions")));
            BigDecimal gross=basic.add(allowance), net=gross.subtract(deductions);
            if(net.signum()<0) throw new IllegalArgumentException("Deductions cannot exceed gross salary.");
            Payroll p=new Payroll();p.setEmployeeId(Integer.parseInt(req.getParameter("employeeId")));
            String month=req.getParameter("month");p.setMonth(month==null||month.isBlank()?YearMonth.now().toString():month);
            p.setBasicSalary(basic);p.setAllowance(allowance);p.setDeductions(deductions);p.setGrossSalary(gross);p.setNetSalary(net);
            p.setPaymentDate(Date.valueOf(req.getParameter("paymentDate")));p.setStatus(req.getParameter("status"));dao.save(p);resp.sendRedirect("payroll");
        }catch(Exception e){throw new ServletException("Payroll save failed.",e);}
    }
    private String defaultZero(String s){return s==null||s.isBlank()?"0":s;}
}
