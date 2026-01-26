<%@page contentType="text/html" pageEncoding="UTF-8" %>
<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        <div class="sb-sidenav-menu">
            <div class="nav">
                <div class="sb-sidenav-menu-heading text-uppercase small text-muted">Core</div>

                <a class="nav-link" href="/admin">
                    <div class="sb-nav-link-icon"><i class="fas fa-chart-line text-info"></i></div>
                    Dashboard (Tổng quan)
                </a>

                <div class="sb-sidenav-menu-heading text-uppercase small text-muted">Management</div>

                <a class="nav-link" href="/admin/user">
                    <div class="sb-nav-link-icon"><i class="fas fa-users-cog text-warning"></i></div>
                    Users (Người dùng)
                </a>

                <a class="nav-link" href="/admin/product">
                    <div class="sb-nav-link-icon"><i class="fas fa-box-open text-success"></i></div>
                    Products (Sản phẩm)
                </a>

                <a class="nav-link" href="/admin/order">
                    <div class="sb-nav-link-icon"><i class="fas fa-shopping-cart text-danger"></i></div>
                    Orders (Đơn hàng)
                </a>

                <div class="sb-sidenav-menu-heading text-uppercase small text-muted">System</div>
                <a class="nav-link" href="#">
                    <div class="sb-nav-link-icon"><i class="fas fa-sliders-h"></i></div>
                    Settings (Cài đặt)
                </a>
            </div>
        </div>

        <div class="sb-sidenav-footer bg-secondary bg-opacity-25">
            <div class="small text-muted mb-1">Đang đăng nhập:</div>
            <div class="d-flex align-items-center">
                <i class="fas fa-user-circle me-2"></i>
                <span class="fw-bold">Admin Manager</span>
            </div>
        </div>
    </nav>
</div>