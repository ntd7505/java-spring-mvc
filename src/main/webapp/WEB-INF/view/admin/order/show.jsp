<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý đơn hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link href="/css/styles.css" rel="stylesheet"/>
    <style>
        .table-custom th {
            background-color: #f8f9fa;
            text-transform: uppercase;
            font-size: 0.8rem;
            letter-spacing: 0.5px;
            color: #6c757d;
        }

        .price-text {
            color: #dc3545;
            font-weight: 700;
        }

        .action-btn {
            width: 32px;
            height: 32px;
            padding: 0;
            line-height: 32px;
            text-align: center;
            border-radius: 4px;
            margin: 0 2px;
            transition: all 0.3s;
        }

        .action-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
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
                <h1 class="mt-4 text-primary fw-bold">Quản lý đơn hàng</h1>
                <ol class="breadcrumb mb-4 bg-light p-3 rounded">
                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                    <li class="breadcrumb-item active">Orders</li>
                </ol>

                <div class="card shadow-lg border-0 rounded-3 mb-4">
                    <div class="card-header bg-white py-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <h5 class="m-0 font-weight-bold text-secondary">
                                <i class="fas fa-shopping-cart me-2"></i>Danh sách đơn hàng
                            </h5>
                        </div>
                    </div>

                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover table-bordered align-middle table-custom">
                                <thead>
                                <tr class="text-center">
                                    <th scope="col" style="width: 50px;">ID</th>
                                    <th scope="col">Khách hàng</th>
                                    <th scope="col">Tổng tiền</th>
                                    <th scope="col">Vai trò</th>
                                    <th scope="col">Trạng thái</th>
                                    <th scope="col" style="width: 150px;">Thao tác</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="orders" items="${orders}">
                                    <tr>
                                        <td class="text-center fw-bold text-secondary">#${orders.id}</td>

                                        <td>
                                            <div class="d-flex align-items-center">
                                                <div class="ms-2">
                                                    <div class="fw-bold text-dark">${orders.receiverName}</div>
                                                    <small class="text-muted">User ID: ${orders.user.id}</small>
                                                </div>
                                            </div>
                                        </td>

                                        <td class="text-end pe-4">
                                                <span class="price-text">
                                                    <fmt:formatNumber type="number" value="${orders.totalPrice}"/> đ
                                                </span>
                                        </td>

                                        <td class="text-center">
                                                <span class="badge bg-secondary bg-opacity-10 text-secondary border border-secondary border-opacity-10">
                                                        ${orders.user.role.name}
                                                </span>
                                        </td>

                                        <td class="text-center">
                                            <c:choose>
                                                <c:when test="${orders.status == 'PENDING'}">
                                                        <span class="badge bg-warning text-dark">
                                                            <i class="fas fa-clock me-1"></i> PENDING
                                                        </span>
                                                </c:when>
                                                <c:when test="${orders.status == 'SHIPPING'}">
                                                        <span class="badge bg-info text-dark">
                                                            <i class="fas fa-truck me-1"></i> SHIPPING
                                                        </span>
                                                </c:when>
                                                <c:when test="${orders.status == 'COMPLETE'}">
                                                        <span class="badge bg-success">
                                                            <i class="fas fa-check-circle me-1"></i> COMPLETE
                                                        </span>
                                                </c:when>
                                                <c:when test="${orders.status == 'CANCEL'}">
                                                        <span class="badge bg-danger">
                                                            <i class="fas fa-times-circle me-1"></i> CANCEL
                                                        </span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge bg-secondary">${orders.status}</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>

                                        <td class="text-center">
                                            <a href="/admin/order/${orders.id}" class="btn btn-primary action-btn"
                                               title="Xem chi tiết">
                                                <i class="fas fa-eye fs-6"></i>
                                            </a>
                                            <a href="/admin/order/update/${orders.id}"
                                               class="btn btn-warning action-btn text-white"
                                               title="Cập nhật trạng thái">
                                                <i class="fas fa-pen fs-6"></i>
                                            </a>
                                            <a href="/admin/order/delete/${orders.id}" class="btn btn-danger action-btn"
                                               title="Xóa đơn hàng">
                                                <i class="fas fa-trash fs-6"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>

                                <c:if test="${empty orders}">
                                    <tr>
                                        <td colspan="6" class="text-center py-4 text-muted">
                                            <i class="fas fa-box-open fa-3x mb-3 d-block opacity-50"></i>
                                            Chưa có đơn hàng nào trong hệ thống.
                                        </td>
                                    </tr>
                                </c:if>
                                </tbody>
                            </table>
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