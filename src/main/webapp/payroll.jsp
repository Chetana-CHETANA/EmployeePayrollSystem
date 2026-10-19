<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en"><head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<title>Payroll - PayrollPro</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head><body>
<div class="container-fluid"><div class="row">
<jsp:include page="/includes/sidebar.jsp"/>
<main class="col-md-10 col-lg-10 content">
<div class="topbar d-flex justify-content-between align-items-center mb-4 no-print">
  <h2 class="mb-0">Payroll</h2>
  <span class="text-muted">Welcome, ${sessionScope.admin.username}</span>
</div>

<div class="card p-4 mb-4"><form method="post" action="${pageContext.request.contextPath}/payroll" id="payrollForm">
<div class="row g-3">
<div class="col-md-6"><label class="form-label">Employee</label><select class="form-select" name="employeeId" id="employeeSelect" required><option value="">Select employee</option><c:forEach var="e" items="${employees}"><option value="${e.id}" data-salary="${e.basicSalary}">${e.fullName} - ${e.designation}</option></c:forEach></select></div>
<div class="col-md-3"><label class="form-label">Month</label><input type="month" class="form-control" name="month" id="month" required></div>
<div class="col-md-3"><label class="form-label">Payment Date</label><input type="date" class="form-control" name="paymentDate" id="paymentDate" required></div>
<div class="col-md-3"><label class="form-label">Basic Salary</label><input class="form-control" name="basicSalary" id="basicSalary" readonly required></div>
<div class="col-md-3"><label class="form-label">Allowance</label><input type="number" min="0" step="0.01" class="form-control calc" name="allowance" id="allowance" value="0"></div>
<div class="col-md-3"><label class="form-label">Deductions</label><input type="number" min="0" step="0.01" class="form-control calc" name="deductions" id="deductions" value="0"></div>
<div class="col-md-3"><label class="form-label">Status</label><select class="form-select" name="status"><option>Paid</option><option>Pending</option><option>Cancelled</option></select></div>
<div class="col-md-6"><label class="form-label">Gross Salary</label><input class="form-control fw-bold" id="grossSalary" readonly></div>
<div class="col-md-6"><label class="form-label">Net Salary</label><input class="form-control fw-bold text-success" id="netSalary" readonly></div>
</div><div class="mt-4"><button class="btn btn-primary">Save Payroll</button></div></form></div>
<div class="card p-3"><h5>Recent Payroll Transactions</h5><div class="table-responsive"><table class="table align-middle"><thead><tr><th>Employee</th><th>Month</th><th>Basic</th><th>Allowance</th><th>Deduction</th><th>Gross</th><th>Net</th><th>Date</th><th>Status</th></tr></thead><tbody>
<c:forEach var="p" items="${payrolls}"><tr><td>${p.employeeName}</td><td>${p.month}</td><td>₹ ${p.basicSalary}</td><td>₹ ${p.allowance}</td><td>₹ ${p.deductions}</td><td>₹ ${p.grossSalary}</td><td>₹ ${p.netSalary}</td><td>${p.paymentDate}</td><td><span class="badge text-bg-success">${p.status}</span></td></tr></c:forEach>
</tbody></table></div></div>
<script>
const select=document.getElementById('employeeSelect');
function calculate(){const b=Number(document.getElementById('basicSalary').value||0),a=Number(document.getElementById('allowance').value||0),d=Number(document.getElementById('deductions').value||0);document.getElementById('grossSalary').value=(b+a).toFixed(2);document.getElementById('netSalary').value=(b+a-d).toFixed(2);}
select.addEventListener('change',()=>{const o=select.options[select.selectedIndex];document.getElementById('basicSalary').value=o.dataset.salary||'';calculate();});
document.querySelectorAll('.calc').forEach(x=>x.addEventListener('input',calculate));
const now=new Date(), localDate=new Date(now.getTime()-now.getTimezoneOffset()*60000).toISOString().slice(0,10);
document.getElementById('paymentDate').value=localDate;document.getElementById('month').value=localDate.slice(0,7);
</script>
</main></div></div>
<script src="${pageContext.request.contextPath}/js/app.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body></html>