<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <title>Access Denied - 403</title>

    <link href="/css/styles.css" rel="stylesheet"/>

    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

    <style>
        /* Tùy chỉnh thêm một chút để căn giữa hoàn hảo */
        body {
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #f8f9fa;
        }

        .error-container {
            text-align: center;
            max-width: 600px;
            padding: 40px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
        }

        .error-code {
            font-size: 8rem;
            font-weight: 700;
            color: #dc3545; /* Màu đỏ của Bootstrap */
            line-height: 1;
        }

        .error-message {
            font-size: 1.5rem;
            color: #343a40;
            margin-bottom: 20px;
        }
    </style>
</head>

<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="error-container">
                <div class="mb-4">
                    <i class="fas fa-user-lock fa-5x text-danger"></i>
                </div>

                <div class="error-code">403</div>

                <h2 class="error-message">Truy cập bị từ chối!</h2>
                <p class="lead mb-4 text-muted">
                    Xin lỗi, bạn không có quyền truy cập vào tài nguyên này.<br>
                    Vui lòng liên hệ quản trị viên hoặc quay lại trang chủ.
                </p>

                <a href="/" class="btn btn-primary btn-lg">
                    <i class="fas fa-arrow-left me-2"></i> Quay về trang chủ
                </a>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
</body>
</html>