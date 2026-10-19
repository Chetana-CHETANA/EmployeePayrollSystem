<%@ page contentType="text/html;charset=UTF-8" %>
  <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>Employees - PayrollPro</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
      <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    </head>

    <body>
      <div class="container-fluid">
        <div class="row">
          <jsp:include page="/includes/sidebar.jsp" />
          <main class="col-md-10 col-lg-10 content">
            <div class="topbar d-flex justify-content-between align-items-center mb-4 no-print">
              <h2 class="mb-0">Employees</h2>
              <span class="text-muted">Welcome, ${sessionScope.admin.username}</span>
            </div>

            <div class="d-flex justify-content-end mb-3 no-print"><button class="btn btn-primary" data-bs-toggle="modal"
                data-bs-target="#employeeModal" onclick="newEmployee()">+ Add Employee</button></div>
            <div class="card table-card p-3">
              <div class="table-responsive">
                <table class="table align-middle">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Name</th>
                      <th>Email</th>
                      <th>Designation</th>
                      <th>Department</th>
                      <th>Basic Salary</th>
                      <th>Phone</th>
                      <th class="no-print">Actions</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:set var="srNo" value="1" />
                    <c:forEach var="e" items="${employees}">
                      <tr>
                        <td>
                          <c:out value="${srNo}" />
                        </td>
                        <c:set var="srNo" value="${srNo + 1}" />
                        <td>${e.fullName}</td>
                        <td>${e.email}</td>
                        <td>${e.designation}</td>
                        <td>${e.departmentName}</td>
                        <td>₹ ${e.basicSalary}</td>
                        <td>${e.phoneNo}</td>
                        <td class="no-print">
                          <button class="btn btn-sm btn-outline-primary"
                            onclick="editEmployee(${e.id},'${e.fullName}','${e.email}','${e.designation}','${e.basicSalary}',${e.departmentId},'${e.phoneNo}')">Edit</button>
                          <form method="post" action="${pageContext.request.contextPath}/employees" class="d-inline"
                            onsubmit="return confirmDelete()">
                            <input type="hidden" name="action" value="delete"><input type="hidden" name="id"
                              value="${e.id}"><button class="btn btn-sm btn-outline-danger">Delete</button>
                          </form>
                        </td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
            <div class="modal fade" id="employeeModal" tabindex="-1">
              <div class="modal-dialog modal-lg">
                <form method="post" action="${pageContext.request.contextPath}/employees" class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title">Employee</h5><button type="button" class="btn-close"
                      data-bs-dismiss="modal"></button>
                  </div>
                  <div class="modal-body"><input type="hidden" name="id" id="empId">
                    <div class="row g-3">
                      <div class="col-md-6"><label class="form-label">Full Name</label><input class="form-control"
                          name="fullName" id="empName" required></div>
                      <div class="col-md-6"><label class="form-label">Email</label><input type="email"
                          class="form-control" name="email" id="empEmail" required></div>
                      <div class="col-md-6"><label class="form-label">Designation</label><input class="form-control"
                          name="designation" id="empDesignation" required></div>
                      <div class="col-md-6"><label class="form-label">Basic Salary</label><input type="number"
                          step="0.01" min="0" class="form-control" name="basicSalary" id="empSalary" required></div>
                      <div class="col-md-6"><label class="form-label">Department</label><select class="form-select"
                          name="departmentId" id="empDepartment" required>
                          <option value="">Select</option>
                          <c:forEach var="d" items="${departments}">
                            <option value="${d.id}">${d.departmentName}</option>
                          </c:forEach>
                        </select></div>
                      <div class="col-md-6"><label class="form-label">Phone</label><input class="form-control"
                          name="phoneNo" id="empPhone" required></div>
                    </div>
                  </div>
                  <div class="modal-footer"><button class="btn btn-primary">Save Employee</button></div>
                </form>
              </div>
            </div>
            <script>
              function newEmployee() { ['empId', 'empName', 'empEmail', 'empDesignation', 'empSalary', 'empPhone'].forEach(id => document.getElementById(id).value = ''); document.getElementById('empDepartment').value = ''; }
              function editEmployee(id, name, email, designation, salary, departmentId, phone) {
                document.getElementById('empId').value = id; document.getElementById('empName').value = name; document.getElementById('empEmail').value = email;
                document.getElementById('empDesignation').value = designation; document.getElementById('empSalary').value = salary;
                document.getElementById('empDepartment').value = departmentId; document.getElementById('empPhone').value = phone;
                new bootstrap.Modal(document.getElementById('employeeModal')).show();
              }
            </script>
          </main>
        </div>
      </div>
      <script src="${pageContext.request.contextPath}/js/app.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>