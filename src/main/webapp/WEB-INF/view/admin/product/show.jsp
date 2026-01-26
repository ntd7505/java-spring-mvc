<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Danh sách sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link href="/css/styles.css" rel="stylesheet"/>
    <style>
        .table-custom th {
            background-color: #f8f9fa;
            text-transform: uppercase;
            font-size: 0.8rem;
            letter-spacing: 0.5px;
        }

        .product-img-sm {
            width: 60px;
            height: 60px;
            object-fit: contain;
            border: 1px solid #dee2e6;
            border-radius: 4px;
            padding: 2px;
            background: #fff;
        }

        .price-tag {
            color: #dc3545;
            font-weight: 700;
            font-size: 1rem;
        }

        .action-btn {
            transition: all 0.2s;
            margin: 0 2px;
        }

        .action-btn:hover {
            transform: translateY(-2px);
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
                <h1 class="mt-4 text-primary fw-bold">Quản lý sản phẩm</h1>
                <ol class="breadcrumb mb-4 bg-light p-3 rounded">
                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                    <li class="breadcrumb-item active">Products</li>
                </ol>

                <div class="card shadow-lg border-0 rounded-3 mb-4">
                    <div class="card-header bg-white py-3 d-flex justify-content-between align-items-center">
                        <h5 class="m-0 font-weight-bold text-secondary"><i class="fas fa-box-open me-2"></i>Kho hàng
                        </h5>
                        <a href="/admin/product/create" class="btn btn-primary rounded-pill px-4 shadow-sm">
                            <i class="fas fa-plus me-2"></i>Thêm sản phẩm
                        </a>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover align-middle table-custom">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Hình ảnh</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Giá bán</th>
                                    <th>Hãng / Loại</th>
                                    <th class="text-center">Thao tác</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="products" items="${product}">
                                    <tr>
                                        <td class="fw-bold text-secondary">#${products.id}</td>
                                        <td>
                                            <img src="/images/product/${products.image}" class="product-img-sm"
                                                 alt="img" onerror="this.src='https://placehold.co/60x60?text=No+Img'">
                                        </td>
                                        <td class="fw-semibold">${products.name}</td>
                                        <td>
                                            <span class="price-tag">
                                                <fmt:formatNumber type="number" value="${products.price}"/> đ
                                            </span>
                                        </td>
                                        <td>
                                            <span class="badge bg-primary bg-opacity-10 text-primary mb-1">${products.factory}</span>
                                            <br>
                                            <span class="badge bg-info bg-opacity-10 text-info text-dark">${products.target}</span>
                                        </td>
                                        <td class="text-center">
                                            <a href="/admin/product/${products.id}"
                                               class="btn btn-sm btn-info text-white action-btn" title="Xem"><i
                                                    class="fas fa-eye"></i></a>
                                            <a href="/admin/product/update/${products.id}"
                                               class="btn btn-sm btn-warning text-white action-btn" title="Sửa"><i
                                                    class="fas fa-pen"></i></a>
                                            <a href="/admin/product/delete/${products.id}"
                                               class="btn btn-sm btn-danger action-btn" title="Xóa"><i
                                                    class="fas fa-trash"></i></a>
                                        </td>
                                    </tr>
                                </c:forEach>
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