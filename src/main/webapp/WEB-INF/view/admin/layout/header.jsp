<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark shadow">
    <a class="navbar-brand ps-3 fw-bold text-uppercase tracking-wider" href="/admin">
        <i class="fas fa-laptop-code me-2 text-warning"></i>Laptop Shop
    </a>

    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!">
        <i class="fas fa-bars fa-lg"></i>
    </button>

    <div class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
        <div class="input-group">
            <input class="form-control" type="text" placeholder="Tìm kiếm..." aria-label="Search for..."
                   aria-describedby="btnNavbarSearch"/>
            <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
        </div>
    </div>

    <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle d-flex align-items-center" id="navbarDropdown" href="#" role="button"
               data-bs-toggle="dropdown" aria-expanded="false">
                <div class="d-none d-md-block me-2 text-end">
                    <small class="text-muted d-block" style="font-size: 0.7rem; line-height: 1;">Welcome,</small>
                    <span class="fw-bold text-white"><c:out value="${pageContext.request.userPrincipal.name}"/></span>
                </div>
                <img src="https://ui-avatars.com/api/?name=${pageContext.request.userPrincipal.name}&background=random"
                     class="rounded-circle border border-2 border-white" width="35" height="35" alt="Avatar">
            </a>
            <ul class="dropdown-menu dropdown-menu-end shadow-lg border-0" aria-labelledby="navbarDropdown">
                <li><h6 class="dropdown-header">Tài khoản</h6></li>
                <li><a class="dropdown-item" href="#!"><i class="fas fa-cog me-2 text-secondary"></i>Cài đặt</a></li>
                <li><a class="dropdown-item" href="#!"><i class="fas fa-list me-2 text-secondary"></i>Nhật ký hoạt động</a>
                </li>
                <li>
                    <hr class="dropdown-divider"/>
                </li>
                <li>
                    <form action="/logout" method="post" class="m-0">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <button class="dropdown-item text-danger fw-bold" type="submit">
                            <i class="fas fa-sign-out-alt me-2"></i>Đăng xuất
                        </button>
                    </form>
                </li>
            </ul>
        </li>
    </ul>
</nav>