<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cập nhật đơn hàng #${id}</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link href="/css/styles.css" rel="stylesheet"/>
    <style>
        .card-header-custom {
            background-color: #f8f9fa;
            border-bottom: 1px solid #e9ecef;
        }

        .form-label {
            font-weight: 500;
            color: #6c757d;
        }

        .value-text {
            font-weight: 600;
            font-size: 1.1rem;
        }

        .price-text {
            color: #dc3545; /* Màu đỏ cho giá tiền */
            font-weight: bold;
            font-size: 1.2rem;
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
                    <li class="breadcrumb-item active">Update</li>
                </ol>

                <div class="row justify-content-center">
                    <div class="col-lg-8 col-md-10">
                        <div class="card shadow-lg border-0 rounded-lg mt-3">
                            <div class="card-header card-header-custom">
                                <h3 class="text-center font-weight-light my-2">
                                    Cập nhật đơn hàng <span class="text-primary">#${id}</span>
                                </h3>
                            </div>
                            <div class="card-body p-4">
                                <form:form method="post" action="/admin/order/update" modelAttribute="order"
                                           enctype="multipart/form-data">

                                    <form:hidden path="id"/>

                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" id="inputOrderID" type="text" value="${id}"
                                                       disabled readonly/>
                                                <label for="inputOrderID">Mã đơn hàng (ID)</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input class="form-control" id="inputRole" type="text"
                                                       value="${order.user.role.name}" disabled readonly/>
                                                <label for="inputRole">Vai trò người đặt</label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <label class="form-label">Tổng tiền đơn hàng:</label>
                                            <div class="p-2 bg-light border rounded">
                                                <span class="price-text">
                                                    <fmt:formatNumber type="number" value="${order.totalPrice}"/> đ
                                                </span>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label">Trạng thái đơn hàng:</label>
                                            <form:select class="form-select form-select-lg" path="status">
                                                <form:option value="PENDING">🕒 PENDING (Đang chờ)</form:option>
                                                <form:option value="SHIPPING">🚚 SHIPPING (Đang giao)</form:option>
                                                <form:option value="COMPLETE">✅ COMPLETE (Hoàn thành)</form:option>
                                                <form:option value="CANCEL">❌ CANCEL (Đã hủy)</form:option>
                                            </form:select>
                                        </div>
                                    </div>

                                    <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                        <a href="/admin/order" class="btn btn-outline-secondary">
                                            <i class="fas fa-arrow-left me-1"></i> Quay lại
                                        </a>
                                        <button type="submit" class="btn btn-primary btn-lg px-4">
                                            <i class="fas fa-save me-1"></i> Cập nhật
                                        </button>
                                    </div>

                                </form:form>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="/js/scripts.js"></script>
</body>
</html>