<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xóa đơn hàng #${id}</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link href="/css/styles.css" rel="stylesheet"/>

    <style>
        .card-delete {
            border: none;
            border-top: 5px solid #dc3545; /* Đường viền đỏ trên cùng */
        }

        .icon-box {
            width: 80px;
            height: 80px;
            margin: 0 auto;
            border-radius: 50%;
            z-index: 9;
            text-align: center;
            border: 3px solid #f15e5e;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .icon-box i {
            color: #f15e5e;
            font-size: 46px;
        }

        .btn-confirm {
            background-color: #dc3545;
            border-color: #dc3545;
            color: white;
            padding: 10px 24px;
            font-weight: 600;
        }

        .btn-confirm:hover {
            background-color: #bb2d3b;
        }

        .btn-cancel {
            background-color: #e9ecef;
            color: #495057;
            padding: 10px 24px;
            font-weight: 600;
        }

        .btn-cancel:hover {
            background-color: #dee2e6;
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
                    <div class="col-lg-5 col-md-7">

                        <div class="card shadow-lg card-delete rounded-3">
                            <div class="card-body p-5 text-center">

                                <div class="icon-box mb-4">
                                    <i class="fas fa-trash-alt"></i>
                                </div>

                                <h2 class="mb-3 fw-bold text-danger">Bạn chắc chắn chứ?</h2>
                                <p class="mb-4 text-muted">
                                    Bạn đang chuẩn bị xóa đơn hàng có ID: <strong>#${id}</strong>.<br>
                                    Hành động này không thể hoàn tác được!
                                </p>

                                <form:form method="post" action="/admin/order/delete" modelAttribute="order">

                                    <form:hidden path="id" value="${id}"/>

                                    <div class="d-flex justify-content-center gap-3 mt-4">
                                        <a href="/admin/order" class="btn btn-cancel rounded-pill">
                                            Không, hủy bỏ
                                        </a>

                                        <button type="submit" class="btn btn-confirm rounded-pill">
                                            <i class="fas fa-check me-2"></i>Có, xóa nó!
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