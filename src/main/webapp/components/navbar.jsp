<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
    String currentPath = request.getRequestURI();
%>
<!-- Official Arya College Accreditation & Info Ribbon -->
<div class="arya-top-bar d-none d-lg-block">
    <div class="container-fluid d-flex justify-content-between align-items-center">
        <div>
            <i class="bi bi-geo-alt-fill me-1"></i> Arya College of Engineering & IT, Kukas, Jaipur &bull; Approved by AICTE, Affiliated to RTU Kota
        </div>
        <div class="d-flex align-items-center gap-3">
            <span><i class="bi bi-telephone-fill me-1"></i> Toll Free: 1800-102-1044</span>
            <span>&bull;</span>
            <span><i class="bi bi-envelope-fill me-1"></i> info@aryacollege.in</span>
        </div>
    </div>
</div>

<nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom sticky-top py-2 px-3">
    <div class="container-fluid">
        <a class="navbar-brand d-flex align-items-center gap-2" href="${pageContext.request.contextPath}/">
            <div class="bg-primary text-white rounded-3 p-1 px-2 fw-bold shadow-sm">
                <i class="bi bi-mortarboard-fill"></i>
            </div>
            <span class="navbar-brand-sphere fs-4">ClubSphere</span>
            <span class="brand-badge ms-1">Arya College</span>
        </a>

        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#topNav" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="topNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item">
                    <a class="nav-link fw-semibold" href="${pageContext.request.contextPath}/clubs">
                        <i class="bi bi-grid me-1 text-primary"></i> Explore Clubs (26)
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fw-semibold" href="${pageContext.request.contextPath}/events">
                        <i class="bi bi-calendar-event me-1 text-primary"></i> Events
                    </a>
                </li>
            </ul>

            <div class="d-flex align-items-center gap-3">
                <c:choose>
                    <c:when test="${not empty sessionScope.currentUser}">
                        <!-- Notifications Bell -->
                        <a href="${pageContext.request.contextPath}/notifications" class="btn btn-light position-relative rounded-circle p-2 text-secondary" aria-label="View notifications">
                            <i class="bi bi-bell fs-5"></i>
                            <c:if test="${sessionScope.unreadCount > 0}">
                                <span id="notifBadge" class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                                    ${sessionScope.unreadCount}
                                </span>
                            </c:if>
                        </a>

                        <!-- User Profile Dropdown -->
                        <div class="dropdown">
                            <button class="btn btn-light dropdown-toggle d-flex align-items-center gap-2 border rounded-pill py-1 px-3" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <div class="bg-primary text-white rounded-circle d-flex align-items-center justify-content-center fw-bold" style="width: 28px; height: 28px; font-size: 0.8rem;">
                                    ${sessionScope.currentUser.fullName.substring(0, 1)}
                                </div>
                                <span class="fw-semibold small">${sessionScope.currentUser.fullName}</span>
                                <span class="badge bg-secondary opacity-75 small">${sessionScope.currentUser.role}</span>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end shadow border-0 mt-2">
                                <li class="dropdown-header text-muted small">Signed in as <strong>${sessionScope.currentUser.username}</strong></li>
                                <li><hr class="dropdown-divider"></li>
                                
                                <c:if test="${sessionScope.currentUser.role == 'ADMIN'}">
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/dashboard"><i class="bi bi-speedometer2 me-2 text-primary"></i>Admin Dashboard</a></li>
                                </c:if>
                                <c:if test="${sessionScope.currentUser.role == 'CLUB_HEAD'}">
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/club-head/dashboard"><i class="bi bi-kanban me-2 text-primary"></i>Club Head Dashboard</a></li>
                                </c:if>
                                <c:if test="${sessionScope.currentUser.role == 'CLUB_MEMBER'}">
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/club-member/dashboard"><i class="bi bi-person-badge me-2 text-primary"></i>Member Dashboard</a></li>
                                </c:if>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/student/dashboard"><i class="bi bi-person me-2 text-primary"></i>Student Dashboard</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/student/registrations"><i class="bi bi-ticket-perforated me-2 text-primary"></i>My Registrations</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/student/profile"><i class="bi bi-gear me-2 text-primary"></i>Profile Settings</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/logout"><i class="bi bi-box-arrow-right me-2"></i>Logout</a></li>
                            </ul>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/login" class="btn btn-primary fw-semibold px-4">Log In</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</nav>
