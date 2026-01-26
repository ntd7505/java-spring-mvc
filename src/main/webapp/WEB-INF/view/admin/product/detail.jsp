<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết: ${Product.name}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link href="/css/styles.css" rel="stylesheet"/>
    <style>
        .product-image-box {
            background: #fff;
            border: 1px solid #dee2e6;
            border-radius: 8px;
            padding: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100%;
            min-height: 400px;
        }

        .product-image-box img {
            max-width: 100%;
            max-height: 400px;
            object-fit: contain;
        }

        .price-display {
            font-size: 2rem;
            color: #dc3545;
            font-weight: 800;
        }

        .spec-item {
            margin-bottom: 10px;
            border-bottom: 1px dashed #eee;
            padding-bottom: 5px;
        }

        .label-spec {
            font-weight: 600;
            color: #6c757d;
            width: 120px;
            display: inline-block;
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
                <ol class="breadcrumb mb-4 mt-4">
                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                    <li class="breadcrumb-item"><a href="/admin/product">Products</a></li>
                    <li class="breadcrumb-item active">Detail</li>
                </ol>

                <div class="card shadow-lg border-0 rounded-lg">
                    <div class="card-body p-5">
                        <div class="row">
                            <div class="col-lg-5 mb-4 mb-lg-0">
                                <div class="product-image-box shadow-sm">
                                    <img src="/images/product/${Product.image}" alt="${Product.name}"
                                         onerror="this.src='https://placehold.co/400x400?text=No+Image'">
                                </div>
                            </div>

                            <div class="col-lg-7 ps-lg-5">
                                <div class="d-flex justify-content-between align-items-start">
                                    <h2 class="fw-bold text-dark mb-3">${Product.name}</h2>
                                    <span class="badge bg-secondary fs-6">ID: #${id}</span>
                                </div>

                                <div class="price-display mb-4">
                                    <fmt:formatNumber type="number" value="${Product.price}"/> đ
                                </div>

                                <div class="specs mb-4">
                                    <h5 class="text-primary border-bottom pb-2 mb-3"><i
                                            class="fas fa-info-circle me-2"></i>Thông số kỹ thuật</h5>

                                    <div class="spec-item"><span
                                            class="label-spec">Hãng sản xuất:</span> ${Product.factory}</div>
                                    <div class="spec-item"><span class="label-spec">Nhu cầu:</span> ${Product.target}
                                    </div>
                                    <div class="spec-item"><span class="label-spec">Số lượng kho:</span> <span
                                            class="fw-bold">${Product.quantity}</span></div>
                                    <div class="spec-item"><span
                                            class="label-spec">Mô tả ngắn:</span> ${Product.shortDesc}</div>
                                </div>

                                <div class="description mb-4">
                                    <h5 class="text-primary border-bottom pb-2 mb-3"><i
                                            class="fas fa-align-left me-2"></i>Chi tiết sản phẩm</h5>
                                    <p class="text-muted bg-light p-3 rounded">
                                        ${Product.detailDesc}
                                    </p>
                                </div>

                                <div class="mt-5 d-flex gap-2">
                                    <a href="/admin/product" class="btn btn-outline-secondary px-4"><i
                                            class="fas fa-arrow-left me-2"></i>Quay lại</a>
                                    <a href="/admin/product/update/${id}"
                                       class="btn btn-warning px-4 text-white fw-bold"><i class="fas fa-pen me-2"></i>Chỉnh
                                        sửa</a>
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