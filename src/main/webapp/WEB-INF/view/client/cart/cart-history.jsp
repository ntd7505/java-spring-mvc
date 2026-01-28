<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Lịch sử mua hàng - LaptopShop</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
          rel="stylesheet">

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <link href="/client/css/bootstrap.min.css" rel="stylesheet">
    <link href="/client/css/style.css" rel="stylesheet">

    <style>
        .table-history th {
            background-color: #343a40;
            color: white;
            vertical-align: middle;
            font-size: 0.9rem;
            white-space: nowrap;
        }

        .table-history td {
            vertical-align: middle; /* Căn giữa dọc cực kỳ quan trọng khi rowspan */
        }

        .col-order-id {
            background-color: #f8f9fa;
            font-weight: bold;
            color: #81c408;
            border-right: 1px solid #dee2e6;
        }

        .col-status-action {
            background-color: #fff;
            border-left: 1px solid #dee2e6;
        }

        .col-total {
            color: #d63384;
            font-weight: bold;
        }
    </style>
</head>

<body>

<div id="spinner"
     class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center">
    <div class="spinner-grow text-primary" role="status"></div>
</div>

<jsp:include page="../layout/header.jsp"/>

<div class="container-fluid page-header py-5">
    <h1 class="text-center text-white display-6">Lịch sử mua hàng</h1>
    <ol class="breadcrumb justify-content-center mb-0">
        <li class="breadcrumb-item"><a href="/">Trang chủ</a></li>
        <li class="breadcrumb-item active text-white">Lịch sử</li>
    </ol>
</div>

<div class="container-fluid py-5">
    <div class="container py-5">
        <div class="table-responsive">

            <table class="table table-bordered table-hover text-center align-middle table-history">
                <thead>
                <tr>
                    <th scope="col">Order ID</th>
                    <th scope="col">Sản Phẩm</th>
                    <th scope="col" style="width: 25%;">Tên Sản Phẩm</th>
                    <th scope="col">Giá</th>
                    <th scope="col">Số Lượng</th>
                    <th scope="col">Tổng Tiền</th>
                    <th scope="col">Trạng Thái</th>
                    <th scope="col">Thao Tác</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${empty orderDetails}">
                    <tr>
                        <td colspan="8" class="text-center py-5">
                            <p class="mb-3">Bạn chưa có đơn hàng nào.</p>
                            <a href="/" class="btn btn-primary rounded-pill">Mua sắm ngay</a>
                        </td>
                    </tr>
                </c:if>

                <%-- Khởi tạo biến để theo dõi Order ID hiện tại --%>
                <c:set var="currentOrderId" value="-1"/>

                <c:forEach items="${orderDetails}" var="item">

                    <%-- Logic kiểm tra xem đây có phải dòng đầu tiên của Order mới không --%>
                    <c:set var="isFirstRow" value="false"/>
                    <c:if test="${item.order.id != currentOrderId}">
                        <c:set var="isFirstRow" value="true"/>
                        <c:set var="currentOrderId" value="${item.order.id}"/>

                        <%-- Đếm số lượng sản phẩm trong đơn hàng này để gán rowspan --%>
                        <c:set var="rowSpanCount" value="0"/>
                        <c:forEach items="${orderDetails}" var="innerItem">
                            <c:if test="${innerItem.order.id == currentOrderId}">
                                <c:set var="rowSpanCount" value="${rowSpanCount + 1}"/>
                            </c:if>
                        </c:forEach>
                    </c:if>

                    <tr>
                            <%-- 1. CỘT ORDER ID: Chỉ in nếu là dòng đầu tiên của nhóm --%>
                        <c:if test="${isFirstRow}">
                            <td rowspan="${rowSpanCount}" class="col-order-id">
                                #${item.order.id}
                            </td>
                        </c:if>

                            <%-- 2. CÁC CỘT CHI TIẾT SẢN PHẨM: Luôn in ra --%>
                        <td>
                            <div class="fruite-img">
                                <img src="/images/product/${item.product.image}"
                                     class="img-fluid w-100 rounded-top" alt>
                            </div>
                        </td>
                        <td class="text-start fw-bold">${item.product.name}</td>
                        <td>
                            <fmt:formatNumber value="${item.price}" type="currency" currencySymbol="đ"/>
                        </td>
                        <td>
                            <span class="badge bg-secondary rounded-pill">${item.quantity}</span>
                        </td>
                        <td class="col-total">
                            <fmt:formatNumber value="${item.price * item.quantity}" type="currency" currencySymbol="đ"/>
                        </td>

                            <%-- 3. CỘT STATUS & ACTION: Chỉ in nếu là dòng đầu tiên của nhóm (Gộp luôn 2 cột này) --%>
                        <c:if test="${isFirstRow}">
                            <td rowspan="${rowSpanCount}" class="col-status-action">
                                <span class="badge bg-success">${order.status}</span>
                            </td>
                            <td rowspan="${rowSpanCount}" class="col-status-action">
                                <a href="/order-history/${item.order.id}" class="btn btn-sm btn-outline-primary">
                                    <i class="fa fa-eye"></i> Xem
                                </a>
                            </td>
                        </c:if>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

        </div>
    </div>
</div>

<jsp:include page="../layout/footer.jsp"/>

<a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
        class="fa fa-arrow-up"></i></a>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="/client/lib/easing/easing.min.js"></script>
<script src="/client/lib/waypoints/waypoints.min.js"></script>
<script src="/client/lib/lightbox/js/lightbox.min.js"></script>
<script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="/client/js/main.js"></script>
</body>

</html>