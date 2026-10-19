<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en"><head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<title>Dashboard - PayrollPro</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head><body>
<div class="container-fluid"><div class="row">
<jsp:include page="/includes/sidebar.jsp"/>
<main class="col-md-10 col-lg-10 content">
<div class="topbar d-flex justify-content-between align-items-center mb-4 no-print">
  <h2 class="mb-0">Dashboard</h2>
  <span class="text-muted">Welcome, ${sessionScope.admin.username}</span>
</div>

<div class="row g-4">
<div class="col-md-4"><div class="card stat-card p-4"><small class="text-muted">Total Employees</small><h1 class="mt-2">${employeeCount}</h1></div></div>
<div class="col-md-4"><div class="card stat-card p-4"><small class="text-muted">Total Departments</small><h1 class="mt-2">${departmentCount}</h1></div></div>
<div class="col-md-4"><div class="card stat-card p-4"><small class="text-muted">Current Month Payroll</small><h1 class="mt-2 money">₹ ${monthlyPayroll}</h1></div></div>
</div>
<div class="card p-4 mt-4"><h5>Quick Actions</h5><div class="d-flex gap-2 flex-wrap mt-3">
<a class="btn btn-primary" href="${pageContext.request.contextPath}/employees">Manage Employees</a>
<a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/payroll">Create Payroll</a>
<a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/reports">View Reports</a>
</div></div>
</main></div></div>
<script src="${pageContext.request.contextPath}/js/app.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body></html>