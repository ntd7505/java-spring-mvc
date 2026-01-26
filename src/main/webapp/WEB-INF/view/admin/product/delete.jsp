<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Xóa sản phẩm #${id}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link href="/css/styles.css" rel="stylesheet"/>
    <style>
        .card-delete {
            border-top: 5px solid #dc3545;
        }

        .icon-box {
            width: 80px;
            height: 80px;
            margin: 0 auto;
            border-radius: 50%;
            border: 3px solid #f15e5e;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #fff;
        }

        .icon-box i {
            color: #f15e5e;
            font-size: 40px;
        }
    </style>
</head>
<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp"/>
    <div id="layoutSidenav_content">
        <main>
            <div class="container">
                <div class="row justify-content-center align-items-center" style="min-height: 80vh;">
                    <div class="col-md-5">
                        <div class="card shadow-lg card-delete rounded-3 border-0">
                            <div class="card-body p-5 text-center">
                                <div class="icon-box mb-4 shadow-sm"><i class="fas fa-trash-alt"></i></div>

                                <h3 class="mb-3 fw-bold text-danger">Xóa sản phẩm?</h3>
                                <p class="text-muted mb-4">
                                    Bạn có chắc chắn muốn xóa sản phẩm có ID <strong>#${id}</strong>?<br>
                                    Hành động này sẽ xóa vĩnh viễn sản phẩm khỏi kho hàng.
                                </p>

                                <form:form method="post" action="/admin/product/delete" modelAttribute="dProduct">
                                    <form:hidden path="id" value="${id}"/>

                                    <div class="d-flex justify-content-center gap-3">
                                        <a href="/admin/product" class="btn btn-light rounded-pill px-4">Không, giữ
                                            lại</a>
                                        <button type="submit" class="btn btn-danger rounded-pill px-4 fw-bold">
                                            <i class="fas fa-check me-2"></i>Xác nhận xóa
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
<script src="/js/scripts.js"></script>
</body>
</html>