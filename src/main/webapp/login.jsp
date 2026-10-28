<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login &bull; Arya College ClubSphere</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body class="bg-light d-flex align-items-center justify-content-center min-vh-100 py-5">

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-5 col-lg-4">
            
            <div class="text-center mb-4">
                <div class="d-inline-flex bg-primary text-white rounded-4 p-3 shadow mb-2">
                    <i class="bi bi-mortarboard-fill fs-2"></i>
                </div>
                <h3 class="fw-bold mb-1">ClubSphere</h3>
                <p class="text-muted small">Arya College of Engineering & IT</p>
            </div>

            <div class="card card-custom p-4 p-sm-5 shadow-sm">
                <h5 class="fw-bold text-dark mb-4 text-center">Sign In to Your Account</h5>

                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger py-2 small alert-dismissible fade show" role="alert">
                        <i class="bi bi-exclamation-circle-fill me-1"></i> ${errorMessage}
                        <button type="button" class="btn-close py-2" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>

                <c:if test="${not empty param.error}">
                    <div class="alert alert-warning py-2 small alert-dismissible fade show" role="alert">
                        <i class="bi bi-info-circle-fill me-1"></i> ${param.error}
                        <button type="button" class="btn-close py-2" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>

                <c:if test="${not empty param.message}">
                    <div class="alert alert-success py-2 small alert-dismissible fade show" role="alert">
                        <i class="bi bi-check-circle-fill me-1"></i> ${param.message}
                        <button type="button" class="btn-close py-2" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>

                <form action="${pageContext.request.contextPath}/login" method="post" id="loginForm" novalidate>
                    <c:if test="${not empty param.redirect}">
                        <input type="hidden" name="redirect" value="<c:out value='${param.redirect}'/>">
                    </c:if>

                    <div class="mb-3">
                        <label for="username" class="form-label small fw-semibold text-secondary">Username or College Email</label>
                        <div class="input-group">
                            <span class="input-group-text bg-white border-end-0 text-muted" id="userIcon"><i class="bi bi-person"></i></span>
                            <input type="text" id="username" name="username" class="form-control border-start-0" placeholder="e.g. admin or dev.kumar" autocomplete="username" aria-describedby="userIcon" required autofocus>
                        </div>
                    </div>

                    <div class="mb-4">
                        <div class="d-flex justify-content-between align-items-center">
                            <label for="password" class="form-label small fw-semibold text-secondary mb-1">Password</label>
                        </div>
                        <div class="input-group">
                            <span class="input-group-text bg-white border-end-0 text-muted" id="lockIcon"><i class="bi bi-lock"></i></span>
                            <input type="password" id="password" name="password" class="form-control border-start-0 border-end-0" placeholder="••••••••" autocomplete="current-password" aria-describedby="lockIcon" required>
                            <button class="btn btn-outline-secondary border-start-0 bg-white text-muted" type="button" id="togglePasswordBtn" aria-label="Toggle password visibility" title="Show or hide password">
                                <i class="bi bi-eye" id="togglePasswordIcon"></i>
                            </button>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary w-100 py-2 fw-semibold shadow-sm mb-3">
                        Sign In <i class="bi bi-arrow-right ms-1"></i>
                    </button>
                </form>

                <!-- Demo quick access helper -->
                <div class="mt-3 p-3 bg-light rounded-3 border small">
                    <div class="d-flex justify-content-between align-items-center mb-2">
                        <span class="fw-bold text-secondary text-uppercase" style="font-size: 0.7rem;">Quick Login Credentials:</span>
                        <span class="text-muted" style="font-size: 0.68rem;"><i class="bi bi-cursor-fill me-1"></i>Click to autofill</span>
                    </div>
                    <div class="d-grid gap-1">
                        <button type="button" class="btn btn-sm btn-white border text-start d-flex justify-content-between align-items-center py-1 px-2 quick-fill-btn" data-user="admin" data-pass="password123">
                            <span><strong>Admin:</strong> <code>admin</code></span>
                            <span class="badge bg-danger-subtle text-danger">Autofill</span>
                        </button>
                        <button type="button" class="btn btn-sm btn-white border text-start d-flex justify-content-between align-items-center py-1 px-2 quick-fill-btn" data-user="head_coding" data-pass="password123">
                            <span><strong>Club Head:</strong> <code>head_coding</code></span>
                            <span class="badge bg-warning-subtle text-dark">Autofill</span>
                        </button>
                        <button type="button" class="btn btn-sm btn-white border text-start d-flex justify-content-between align-items-center py-1 px-2 quick-fill-btn" data-user="member_coding_1" data-pass="password123">
                            <span><strong>Club Member:</strong> <code>member_coding_1</code></span>
                            <span class="badge bg-success-subtle text-success">Autofill</span>
                        </button>
                        <button type="button" class="btn btn-sm btn-white border text-start d-flex justify-content-between align-items-center py-1 px-2 quick-fill-btn" data-user="student_1" data-pass="password123">
                            <span><strong>Student:</strong> <code>student_1</code></span>
                            <span class="badge bg-primary-subtle text-primary">Autofill</span>
                        </button>
                    </div>
                </div>

                <div class="text-center mt-4">
                    <a href="${pageContext.request.contextPath}/" class="text-decoration-none small text-muted">
                        <i class="bi bi-arrow-left me-1"></i> Back to Homepage
                    </a>
                </div>
            </div>

        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Password visibility toggle
    const togglePasswordBtn = document.getElementById('togglePasswordBtn');
    const passwordInput = document.getElementById('password');
    const togglePasswordIcon = document.getElementById('togglePasswordIcon');

    if (togglePasswordBtn && passwordInput && togglePasswordIcon) {
        togglePasswordBtn.addEventListener('click', function () {
            const isPassword = passwordInput.getAttribute('type') === 'password';
            passwordInput.setAttribute('type', isPassword ? 'text' : 'password');
            togglePasswordIcon.className = isPassword ? 'bi bi-eye-slash text-primary' : 'bi bi-eye';
            togglePasswordBtn.setAttribute('aria-label', isPassword ? 'Hide password' : 'Show password');
        });
    }

    // Quick login credential autofill
    document.querySelectorAll('.quick-fill-btn').forEach(button => {
        button.addEventListener('click', function () {
            const usernameInput = document.getElementById('username');
            const user = this.getAttribute('data-user');
            const pass = this.getAttribute('data-pass');
            if (usernameInput && passwordInput) {
                usernameInput.value = user;
                passwordInput.value = pass;
                passwordInput.setAttribute('type', 'password');
                if (togglePasswordIcon) togglePasswordIcon.className = 'bi bi-eye';
                usernameInput.focus();
            }
        });
    });
</script>
</body>
</html>
