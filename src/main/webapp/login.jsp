<%@ page contentType="text/html;charset=UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>Login - PayrollPro</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    </head>

    <body>
        <div class="login-wrap d-flex align-items-center justify-content-center p-3">
            <div class="card login-card shadow-lg p-4 w-100">
                <div class="text-center mb-4">
                    <h2>PayrollPro</h2>
                    <p class="text-muted">Employee Payroll Management</p>
                </div>
                <% if(request.getAttribute("error")!=null){ %>
                    <div class="alert alert-danger">
                        <%=request.getAttribute("error")%>
                    </div>
                    <% } %>
                        <form method="post" action="${pageContext.request.contextPath}/login">
                            <div class="mb-3"><label class="form-label">Username</label><input class="form-control"
                                    name="username" required autocomplete="username"></div>
                            <div class="mb-4">
    <label class="form-label">Password</label>

    <div class="input-group">
        <input type="password"
               class="form-control"
               id="password"
               name="password"
               required
               autocomplete="current-password">

        <button type="button"
                class="btn btn-outline-secondary"
                id="togglePassword"
                onclick="togglePasswordVisibility()">
            👁
        </button>
    </div>
</div>
                            <button class="btn btn-primary w-100">Sign In</button>
                        </form>
                        <p class="text-center text-muted small mt-3 mb-0">Username and password can be changed anytime
                            after login from <b>Login Settings</b>.</p>
            </div>
        </div>

        <script>
function togglePasswordVisibility() {
    const passwordField = document.getElementById("password");
    const toggleButton = document.getElementById("togglePassword");

    if (passwordField.type === "password") {
        passwordField.type = "text";
        toggleButton.textContent = "🙈";
    } else {
        passwordField.type = "password";
        toggleButton.textContent = "👁";
    }
}
</script>
    </body>

    </html>