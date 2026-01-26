<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="utf-8">
    <title>Đặt hàng thành công - Laptopshop</title>
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
</head>

<body>

<jsp:include page="../layout/header.jsp"/>

<div class="container-fluid py-5">
    <div class="container py-5 text-center">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="card shadow-sm border-0 rounded-3">
                    <div class="card-body p-5">
                        <div class="mb-4">
                            <i class="fas fa-check-circle text-success" style="font-size: 80px;"></i>
                        </div>

                        <h1 class="display-6 mb-3">Cảm ơn bạn đã đặt hàng!</h1>

                        <p class="lead text-muted mb-4">
                            Đơn hàng của bạn đã được hệ thống ghi nhận thành công.<br>
                            Chúng tôi sẽ sớm liên hệ để xác nhận và giao hàng cho bạn.
                        </p>

                        <hr class="my-4 w-50 mx-auto">

                        <p class="mb-4">
                            Mọi thắc mắc xin vui lòng liên hệ hotline: <strong>0123 456 789</strong>
                        </p>

                        <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
                            <a href="/" class="btn btn-primary rounded-pill px-5 py-3 fw-bold">
                                <i class="fas fa-home me-2"></i> Quay về trang chủ
                            </a>
                        </div>
                    </div>
                </div>
            </div>
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