<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title> Giỏ hàng - Laptopshop</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
            href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
            rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


    <!-- Customized Bootstrap Stylesheet -->
    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/client/css/style.css" rel="stylesheet">
</head>
<script>
    $(document).ready(function () {
        // Khi nhấn nút tăng/giảm
        $('.btn-plus, .btn-minus').click(function (e) {
            e.preventDefault();

            const $input = $(this).closest('.quantity').find('.quantity-input');
            const currentVal = parseInt($input.val());
            const index = $input.data('cart-detail-index');

            let newVal = currentVal;
            if ($(this).hasClass('btn-plus')) {
                newVal = currentVal + 1;
            } else if ($(this).hasClass('btn-minus') && currentVal > 1) {
                newVal = currentVal - 1;
            }

            $input.val(newVal);

            // ĐỒng BỘ VÀO HIDDEN INPUT
            $('input[name="cartDetails[' + index + '].quantity"]').val(newVal);

            // Cập nhật tổng tiền
            updateTotal();
        });

        function updateTotal() {
            let total = 0;
            $('.quantity-input').each(function () {
                const price = parseFloat($(this).data('price'));
                const quantity = parseInt($(this).val());
                total += price * quantity;
                // Cập nhật giá từng item
                $(this).closest('tr').find('.item-total-price').text(
                    (price * quantity).toLocaleString('vi-VN') + ' đ'
                );
            });

            $('#subtotalDisplay, #totalPriceDisplay').text(total.toLocaleString('vi-VN') + ' đ');
        }
    });
</script>

<body>

<!-- Spinner Start -->
<div id="spinner"
     class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
    <div class="spinner-grow text-primary" role="status"></div>
</div>
<!-- Spinner End -->


<jsp:include page="../layout/header.jsp"/>

<!-- Cart Page Start -->
<div class="container-fluid py-5">
    <div class="container py-5">

        <c:if test="${empty cartDetailsList}">
            <div class="row justify-content-center">
                <div class="col-md-6 text-center">
                    <div class="alert alert-warning p-4" role="alert">
                        <i class="fas fa-shopping-basket fa-3x mb-3 text-secondary"></i>
                        <h4 class="alert-heading">Giỏ hàng của bạn đang trống!</h4>
                        <p>Hãy quay lại cửa hàng để chọn thêm sản phẩm nhé.</p>
                        <hr>
                        <a href="/" class="btn btn-primary rounded-pill px-4 py-2">Tiếp tục mua sắm</a>
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${not empty cartDetailsList}">
            <div class="table-responsive">
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">Products</th>
                        <th scope="col">Name</th>
                        <th scope="col">Price</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Total</th>
                        <th scope="col">Handle</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="cartDetail" items="${cartDetailsList}" varStatus="status">
                        <tr>
                            <th scope="row">
                                <div class="d-flex align-items-center">
                                    <img src="/images/product/${cartDetail.product.image}"
                                         class="img-fluid me-5 rounded-circle"
                                         style="width: 80px; height: 80px;" alt="">
                                </div>
                            </th>
                            <td>
                                <p class="mb-0 mt-4">
                                    <a href="/client/product/${cartDetail.product.id}" target="_blank">
                                            ${cartDetail.product.name}
                                    </a>
                                </p>
                            </td>
                            <td>
                                <p class="mb-0 mt-4">
                                    <fmt:formatNumber type="number" value="${cartDetail.product.price}"/> đ
                                </p>
                            </td>
                            <td>
                                <div class="input-group quantity mt-4" style="width: 100px;">
                                    <div class="input-group-btn">
                                        <button class="btn btn-sm btn-minus rounded-circle bg-light border">
                                            <i class="fa fa-minus"></i>
                                        </button>
                                    </div>

                                    <input type="text"
                                           class="form-control form-control-sm text-center border-0 quantity-input"
                                           value="${cartDetail.quantity}"
                                           data-price="${cartDetail.product.price}"
                                           data-cart-detail-id="${cartDetail.id}"
                                           data-cart-detail-index="${status.index}">

                                    <div class="input-group-btn">
                                        <button class="btn btn-sm btn-plus rounded-circle bg-light border">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <p class="mb-0 mt-4 item-total-price">
                                    <fmt:formatNumber type="number"
                                                      value="${cartDetail.product.price * cartDetail.quantity}"/> đ
                                </p>
                            </td>
                            <td>
                                <form action="/cart/delete/${cartDetail.id}" method="post">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <button class="btn btn-md rounded-circle bg-light border mt-4">
                                        <i class="fa fa-times text-danger"></i>
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="row g-4 justify-content-end mt-4">
                <div class="col-8"></div>
                <div class="col-sm-8 col-md-7 col-lg-6 col-xl-4">
                    <div class="bg-light rounded">
                        <div class="p-4">
                            <h1 class="display-6 mb-4">Cart <span class="fw-normal">Total</span></h1>
                            <div class="d-flex justify-content-between mb-4">
                                <h5 class="mb-0 me-4">Subtotal:</h5>
                                <p class="mb-0" id="subtotalDisplay">
                                    <fmt:formatNumber type="number" value="${totalPrice}"/> đ
                                </p>
                            </div>
                            <div class="d-flex justify-content-between">
                                <h5 class="mb-0 me-4">Shipping</h5>
                                <div class="">
                                    <p class="mb-0">Free</p>
                                </div>
                            </div>
                        </div>
                        <div class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                            <h5 class="mb-0 ps-4 me-4">Total</h5>
                            <p class="mb-0 pe-4" id="totalPriceDisplay">
                                <fmt:formatNumber type="number" value="${totalPrice}"/> đ
                            </p>
                        </div>

                        <form:form method="post" action="/confirm-checkout" modelAttribute="cart">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <div style="display: block;">
                                <c:forEach var="cartDetail" items="${cart.cartDetails}" varStatus="status">
                                    <div class="mb-3">
                                        <div class="form-group">
                                            <label>Id:</label>
                                            <form:input type="text" class="form-control"
                                                        path="cartDetails[${status.index}].id"/>
                                        </div>
                                        <div class="form-group">
                                            <label>Quantity:</label>
                                            <form:input type="text" class="form-control"
                                                        path="cartDetails[${status.index}].quantity"/>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <button
                                    class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4">
                                Xác nhận đặt hàng
                            </button>
                        </form:form>

                    </div>
                </div>
            </div>
        </c:if>
    </div>
</div>
<!-- Cart Page End -->


<!-- Footer Start -->
<div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5">
    <div class="container py-5">
        <div class="pb-4 mb-4" style="border-bottom: 1px solid rgba(226, 175, 24, 0.5) ;">
            <div class="row g-4">
                <div class="col-lg-3">
                    <a href="#">
                        <h1 class="text-primary mb-0">Fruitables</h1>
                        <p class="text-secondary mb-0">Fresh products</p>
                    </a>
                </div>
                <div class="col-lg-6">
                    <div class="position-relative mx-auto">
                        <input class="form-control border-0 w-100 py-3 px-4 rounded-pill" type="number"
                               placeholder="Your Email">
                        <button type="submit"
                                class="btn btn-primary border-0 border-secondary py-3 px-4 position-absolute rounded-pill text-white"
                                style="top: 0; right: 0;">Subscribe Now
                        </button>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="d-flex justify-content-end pt-3">
                        <a class="btn  btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i
                                class="fab fa-twitter"></i></a>
                        <a class="btn btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i
                                class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i
                                class="fab fa-youtube"></i></a>
                        <a class="btn btn-outline-secondary btn-md-square rounded-circle" href=""><i
                                class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row g-5">
            <div class="col-lg-3 col-md-6">
                <div class="footer-item">
                    <h4 class="text-light mb-3">Why People Like us!</h4>
                    <p class="mb-4">typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the like Aldus PageMaker including of Lorem Ipsum.</p>
                    <a href="" class="btn border-secondary py-2 px-4 rounded-pill text-primary">Read More</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="d-flex flex-column text-start footer-item">
                    <h4 class="text-light mb-3">Shop Info</h4>
                    <a class="btn-link" href="">About Us</a>
                    <a class="btn-link" href="">Contact Us</a>
                    <a class="btn-link" href="">Privacy Policy</a>
                    <a class="btn-link" href="">Terms & Condition</a>
                    <a class="btn-link" href="">Return Policy</a>
                    <a class="btn-link" href="">FAQs & Help</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="d-flex flex-column text-start footer-item">
                    <h4 class="text-light mb-3">Account</h4>
                    <a class="btn-link" href="">My Account</a>
                    <a class="btn-link" href="">Shop details</a>
                    <a class="btn-link" href="">Shopping Cart</a>
                    <a class="btn-link" href="">Wishlist</a>
                    <a class="btn-link" href="">Order History</a>
                    <a class="btn-link" href="">International Orders</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="footer-item">
                    <h4 class="text-light mb-3">Contact</h4>
                    <p>Address: 1429 Netus Rd, NY 48247</p>
                    <p>Email: Example@gmail.com</p>
                    <p>Phone: +0123 4567 8910</p>
                    <p>Payment Accepted</p>

                </div>
            </div>
        </div>
    </div>
</div>
<!-- Footer End -->


<!-- Back to Top -->
<a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
        class="fa fa-arrow-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="/client/lib/easing/easing.min.js"></script>
<script src="/client/lib/waypoints/waypoints.min.js"></script>
<script src="/client/lib/lightbox/js/lightbox.min.js"></script>
<script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Template Javascript -->
<script src="/client/js/main.js"></script>
</body>

</html>
