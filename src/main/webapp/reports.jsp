<%@ page contentType="text/html;charset=UTF-8" %>
  <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>Payroll Reports - PayrollPro</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
      <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    </head>

    <body>
      <div class="container-fluid">
        <div class="row">
          <jsp:include page="/includes/sidebar.jsp" />
          <main class="col-md-10 col-lg-10 content">
            <div class="topbar d-flex justify-content-between align-items-center mb-4 no-print">
              <h2 class="mb-0">Payroll Reports</h2>
              <span class="text-muted">Welcome, ${sessionScope.admin.username}</span>
            </div>

            <div class="d-flex gap-2 justify-content-end mb-3 no-print">
              <button class="btn btn-outline-secondary" onclick="printReport()">Print Report</button>
              <button class="btn btn-success" onclick="downloadCSV('reportTable','payroll-report.csv')">Download
                CSV</button>
            </div>
            <div class="card p-3">
              <div class="table-responsive">
                <table class="table table-bordered align-middle" id="reportTable">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Employee</th>
                      <th>Month</th>
                      <th>Basic Salary</th>
                      <th>Allowance</th>
                      <th>Deductions</th>
                      <th>Gross Salary</th>
                      <th>Net Salary</th>
                      <th>Payment Date</th>
                      <th>Status</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:set var="srNo" value="1" />
                    <c:forEach var="p" items="${payrolls}">
                      <tr>
                        <td>
                          <c:out value="${srNo}" />
                        </td>
                        <c:set var="srNo" value="${srNo + 1}" />
                        <td>${p.employeeName}</td>
                        <td>${p.month}</td>
                        <td>${p.basicSalary}</td>
                        <td>${p.allowance}</td>
                        <td>${p.deductions}</td>
                        <td>${p.grossSalary}</td>
                        <td>${p.netSalary}</td>
                        <td>${p.paymentDate}</td>
                        <td>${p.status}</td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </main>
        </div>
      </div>
      <script src="${pageContext.request.contextPath}/js/app.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>