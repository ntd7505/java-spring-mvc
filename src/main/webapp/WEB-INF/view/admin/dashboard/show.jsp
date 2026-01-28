<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <title>Dashboard - Laptop Shop Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/styles.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <style>
        /* Custom Card Counter Design */
        .card-counter {
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.05); /* Bóng mờ nhẹ */
            padding: 25px;
            background-color: #fff;
            height: 140px;
            border-radius: 15px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            border: none;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        /* Hiệu ứng Hover: Nổi lên */
        .card-counter:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }

        /* Icon mờ làm nền */
        .card-counter .bg-icon {
            font-size: 8rem;
            position: absolute;
            right: -20px;
            top: 10px;
            opacity: 0.1;
            transform: rotate(15deg);
            z-index: 0;
        }

        /* Số liệu */
        .card-counter .count-numbers {
            font-size: 3rem;
            font-weight: 800;
            display: block;
            z-index: 1;
            line-height: 1;
            margin-bottom: 5px;
        }

        /* Tên thẻ */
        .card-counter .count-name {
            font-size: 1.1rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            opacity: 0.9;
            z-index: 1;
        }

        /* Màu Gradient cho từng loại */
        .bg-gradient-primary-custom {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        .bg-gradient-success-custom {
            background: linear-gradient(135deg, #2af598 0%, #009efd 100%);
            color: white;
        }

        .bg-gradient-warning-custom {
            background: linear-gradient(135deg, #f6d365 0%, #fda085 100%);
            color: white;
        }

        /* Phần Welcome Banner */
        .welcome-banner {
            background: #fff;
            border-radius: 15px;
            border-left: 5px solid #0d6efd;
        }

        .shortcut-btn {
            transition: all 0.2s;
            border: 1px solid #eee;
        }

        .shortcut-btn:hover {
            background-color: #f8f9fa;
            border-color: #0d6efd;
            transform: translateY(-2px);
        }
    </style>
</head>
<body class="sb-nav-fixed bg-light">

<jsp:include page="../layout/header.jsp"/>

<div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp"/>

    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">

                <div class="d-flex justify-content-between align-items-center mt-4 mb-4">
                    <div>
                        <h1 class="fw-bold text-dark m-0">Dashboard</h1>
                        <p class="text-muted m-0">Tổng quan hệ thống quản trị</p>
                    </div>
                    <div class="text-end">
                            <span class="badge bg-secondary p-2 shadow-sm">
                                <i class="far fa-calendar-alt me-2"></i>Hôm nay: <script>document.write(new Date().toLocaleDateString('vi-VN'))</script>
                            </span>
                    </div>
                </div>

                <div class="row g-4">
                    <div class="col-xl-4 col-md-6">
                        <a href="/admin/user" class="text-decoration-none">
                            <div class="card-counter bg-gradient-primary-custom">
                                <i class="fas fa-users bg-icon"></i>
                                <span class="count-numbers">${countUser}</span>
                                <span class="count-name">Người dùng</span>
                            </div>
                        </a>
                    </div>

                    <div class="col-xl-4 col-md-6">
                        <a href="/admin/product" class="text-decoration-none">
                            <div class="card-counter bg-gradient-success-custom">
                                <i class="fas fa-box-open bg-icon"></i>
                                <span class="count-numbers">${countProduct}</span>
                                <span class="count-name">Sản phẩm</span>
                            </div>
                        </a>
                    </div>

                    <div class="col-xl-4 col-md-6">
                        <a href="/admin/order" class="text-decoration-none">
                            <div class="card-counter bg-gradient-warning-custom">
                                <i class="fas fa-shopping-cart bg-icon"></i>
                                <span class="count-numbers">${countOrderDetails}</span>
                                <span class="count-name">Đơn hàng</span>
                            </div>
                        </a>
                    </div>
                </div>

                <div class="row mt-5">
                    <div class="col-12">
                        <div class="welcome-banner p-4 shadow-sm">
                            <div class="row align-items-center">
                                <div class="col-md-8">
                                    <h4 class="fw-bold text-primary mb-2">
                                        Xin chào, <c:out value="${pageContext.request.userPrincipal.name}"/>! 👋
                                    </h4>
                                    <p class="text-muted mb-0">
                                        Hệ thống hiện đang ghi nhận <strong>${countOrderDetails}</strong> đơn hàng.
                                        Bạn có thể bắt đầu ngày làm việc bằng cách kiểm tra các đơn hàng mới hoặc cập
                                        nhật kho sản phẩm.
                                    </p>
                                </div>
                                <div class="col-md-4 text-end mt-3 mt-md-0">
                                    <a href="/admin/order"
                                       class="btn btn-primary px-4 py-2 rounded-pill fw-bold shadow-sm">
                                        <i class="fas fa-tasks me-2"></i>Quản lý đơn hàng
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row mt-4">
                    <h5 class="text-secondary mb-3 ms-1 fw-bold">Truy cập nhanh</h5>

                    <div class="col-md-3 col-sm-6 mb-3">
                        <a href="/admin/product/create" class="text-decoration-none text-dark">
                            <div class="bg-white p-3 rounded-3 shadow-sm shortcut-btn d-flex align-items-center">
                                <div class="bg-primary bg-opacity-10 p-3 rounded-circle me-3 text-primary">
                                    <i class="fas fa-plus"></i>
                                </div>
                                <div>
                                    <h6 class="m-0 fw-bold">Thêm Sản phẩm</h6>
                                    <small class="text-muted">Tạo mới vào kho</small>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col-md-3 col-sm-6 mb-3">
                        <a href="/admin/user/create" class="text-decoration-none text-dark">
                            <div class="bg-white p-3 rounded-3 shadow-sm shortcut-btn d-flex align-items-center">
                                <div class="bg-success bg-opacity-10 p-3 rounded-circle me-3 text-success">
                                    <i class="fas fa-user-plus"></i>
                                </div>
                                <div>
                                    <h6 class="m-0 fw-bold">Thêm User</h6>
                                    <small class="text-muted">Tạo tài khoản mới</small>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col-md-3 col-sm-6 mb-3">
                        <a href="/" target="_blank" class="text-decoration-none text-dark">
                            <div class="bg-white p-3 rounded-3 shadow-sm shortcut-btn d-flex align-items-center">
                                <div class="bg-warning bg-opacity-10 p-3 rounded-circle me-3 text-warning">
                                    <i class="fas fa-home"></i>
                                </div>
                                <div>
                                    <h6 class="m-0 fw-bold">Trang chủ Client</h6>
                                    <small class="text-muted">Xem giao diện khách</small>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col-md-3 col-sm-6 mb-3">
                        <div class="bg-white p-3 rounded-3 shadow-sm d-flex align-items-center opacity-50">
                            <div class="bg-secondary bg-opacity-10 p-3 rounded-circle me-3 text-secondary">
                                <i class="fas fa-cog"></i>
                            </div>
                            <div>
                                <h6 class="m-0 fw-bold">Cấu hình</h6>
                                <small class="text-muted">Coming soon...</small>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </main>

        <jsp:include page="../layout/footer.jsp"/>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="/js/scripts.js"></script>
</body>
</html>