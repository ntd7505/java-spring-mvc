<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết đơn hàng #${id}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link href="/css/styles.css" rel="stylesheet"/>
    <style>
        .card-header-custom {
            background-color: #f8f9fa;
            border-bottom: 2px solid #0d6efd;
        }

        .info-label {
            font-weight: 600;
            color: #6c757d;
            margin-bottom: 5px;
            display: block;
        }

        .info-value {
            font-size: 1.05rem;
            color: #212529;
            font-weight: 500;
        }

        .total-price-box {
            background-color: #e8f5e9;
            color: #198754;
            padding: 15px;
            border-radius: 8px;
            text-align: center;
            border: 1px dashed #198754;
        }

        .price-big {
            font-size: 1.5rem;
            font-weight: 800;
        }
    </style>
</head>
<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp"/>

<div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp"/>

    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Quản lý đơn hàng</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                    <li class="breadcrumb-item"><a href="/admin/order">Order</a></li>
                    <li class="breadcrumb-item active">Detail</li>
                </ol>

                <div class="row justify-content-center">
                    <div class="col-xl-10 col-md-12">
                        <div class="card shadow-lg border-0 rounded-lg mb-4">
                            <div class="card-header card-header-custom d-flex justify-content-between align-items-center">
                                <h4 class="mb-0"><i class="fas fa-file-invoice me-2"></i>Chi tiết đơn hàng</h4>
                                <span class="badge bg-primary fs-6">ID: ${id}</span>
                            </div>

                            <div class="card-body p-4">
                                <div class="row">
                                    <div class="col-md-6 border-end">
                                        <h5 class="text-primary mb-3 border-bottom pb-2">
                                            <i class="fas fa-user-circle me-2"></i>Thông tin người nhận
                                        </h5>

                                        <div class="mb-3">
                                            <span class="info-label">Tên người nhận:</span>
                                            <span class="info-value">${order.receiverName}</span>
                                        </div>

                                        <div class="mb-3">
                                            <span class="info-label">Địa chỉ giao hàng:</span>
                                            <div class="d-flex align-items-start">
                                                <i class="fas fa-map-marker-alt text-danger me-2 mt-1"></i>
                                                <span class="info-value">${order.receiverAddress}</span>
                                            </div>
                                        </div>

                                        <div class="mb-3">
                                            <span class="info-label">Số điện thoại:</span>
                                            <div class="d-flex align-items-center">
                                                <i class="fas fa-phone text-success me-2"></i>
                                                <span class="info-value">${order.receiverPhone}</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6 ps-md-4 mt-4 mt-md-0">
                                        <h5 class="text-primary mb-3 border-bottom pb-2">
                                            <i class="fas fa-info-circle me-2"></i>Thông tin hệ thống
                                        </h5>

                                        <div class="mb-3">
                                            <span class="info-label">ID Tài khoản đặt hàng (User ID):</span>
                                            <span class="badge bg-secondary p-2">User #${order.user.id}</span>
                                            <a href="/admin/user/${order.user.id}"
                                               class="btn btn-sm btn-outline-info ms-2" title="Xem user này">
                                                <i class="fas fa-external-link-alt"></i>
                                            </a>
                                        </div>

                                        <div class="mb-3 mt-4">
                                            <span class="info-label mb-2">Tổng giá trị đơn hàng:</span>
                                            <div class="total-price-box">
                                                <span class="price-big">
                                                    <fmt:formatNumber type="number" value="${order.totalPrice}"/> đ
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="d-flex justify-content-between align-items-center mt-5 pt-3 border-top">
                                    <a href="/admin/order" class="btn btn-secondary px-4">
                                        <i class="fas fa-arrow-left me-2"></i> Quay lại
                                    </a>

                                    <a href="/admin/order/update/${order.id}" class="btn btn-warning px-4 text-white">
                                        <i class="fas fa-edit me-2"></i> Cập nhật trạng thái
                                    </a>
                                </div>

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