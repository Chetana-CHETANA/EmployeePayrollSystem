<%@ page contentType="text/html;charset=UTF-8" %>
  <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Departments - PayrollPro</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
      </head>

      <body>
        <div class="container-fluid">
          <div class="row">
            <jsp:include page="/includes/sidebar.jsp" />
            <main class="col-md-10 col-lg-10 content">
              <div class="topbar d-flex justify-content-between align-items-center mb-4 no-print">
                <h2 class="mb-0">Departments</h2>
                <span class="text-muted">Welcome, ${sessionScope.admin.username}</span>
              </div>

              <div class="d-flex justify-content-end mb-3 no-print"><button class="btn btn-primary"
                  data-bs-toggle="modal" data-bs-target="#departmentModal" onclick="newDepartment()">+ Add
                  Department</button></div>
              <div class="card table-card p-3">
                <div class="table-responsive">
                  <table class="table align-middle">
                    <thead>
                      <tr>
                        <th>ID</th>
                        <th>Department</th>
                        <th>Description</th>
                        <th class="no-print">Actions</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:set var="srNo" value="1" />
                      <c:forEach var="d" items="${departments}">
                        <tr>
                          <td>
                            <c:out value="${srNo}" />
                          </td>
                          <c:set var="srNo" value="${srNo + 1}" />
                          <td>${d.departmentName}</td>
                          <td>${d.description}</td>
                          <td class="no-print">
                            <button class="btn btn-sm btn-outline-primary"
                              onclick="editDepartment(${d.id},'${fn:escapeXml(d.departmentName)}','${fn:escapeXml(d.description)}')">Edit</button>
                            <form method="post" action="${pageContext.request.contextPath}/departments" class="d-inline"
                              onsubmit="return confirmDelete()"><input type="hidden" name="action" value="delete"><input
                                type="hidden" name="id" value="${d.id}"><button
                                class="btn btn-sm btn-outline-danger">Delete</button></form>
                          </td>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
              <div class="modal fade" id="departmentModal" tabindex="-1">
                <div class="modal-dialog">
                  <form method="post" action="${pageContext.request.contextPath}/departments" class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">Department</h5><button type="button" class="btn-close"
                        data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                      <input type="hidden" name="id" id="deptId">
                      <div class="mb-3"><label class="form-label">Department Name</label><input class="form-control"
                          name="departmentName" id="deptName" required></div>
                      <div class="mb-3"><label class="form-label">Description</label><textarea class="form-control"
                          name="description" id="deptDesc"></textarea></div>
                    </div>
                    <div class="modal-footer"><button class="btn btn-primary">Save</button></div>
                  </form>
                </div>
              </div>
              <script>
                function newDepartment() { deptId.value = ''; deptName.value = ''; deptDesc.value = ''; }
                function editDepartment(id, name, desc) { deptId.value = id; deptName.value = name; deptDesc.value = desc; new bootstrap.Modal(document.getElementById('departmentModal')).show(); }
              </script>
            </main>
          </div>
        </div>
        <script src="${pageContext.request.contextPath}/js/app.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
      </body>

      </html>