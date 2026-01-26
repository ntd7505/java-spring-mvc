(function ($) {
    "use strict";

    // Spinner
    var spinner = function () {
        setTimeout(function () {
            if ($('#spinner').length > 0) {
                $('#spinner').removeClass('show');
            }
        }, 1);
    };
    spinner(0);


    // Fixed Navbar
    $(window).scroll(function () {
        if ($(window).width() < 992) {
            if ($(this).scrollTop() > 55) {
                $('.fixed-top').addClass('shadow');
            } else {
                $('.fixed-top').removeClass('shadow');
            }
        } else {
            if ($(this).scrollTop() > 55) {
                $('.fixed-top').addClass('shadow').css('top', 0);
            } else {
                $('.fixed-top').removeClass('shadow').css('top', 0);
            }
        }
    });


    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({scrollTop: 0}, 1500, 'easeInOutExpo');
        return false;
    });

    // ==========================================
    // LOGIC GIỎ HÀNG (TÍNH TOÁN NGAY LẬP TỨC)
    // ==========================================

    // 1. Hàm format tiền tệ (thêm dấu chấm phân cách)
    function formatCurrency(number) {
        return new Intl.NumberFormat('vi-VN').format(number);
    }

    // 2. Hàm tính lại tổng tiền cả giỏ hàng
    function updateCartTotal() {
        let total = 0;

        // Duyệt qua tất cả input số lượng để tính lại tổng
        $('.quantity-input').each(function () {
            const qty = parseInt($(this).val());
            const price = parseFloat($(this).data('price'));

            if (!isNaN(qty) && !isNaN(price)) {
                total += qty * price;
            }
        });

        // Cập nhật text hiển thị
        const formattedTotal = formatCurrency(total) + ' đ';
        $('#subtotalDisplay').text(formattedTotal);
        $('#totalPriceDisplay').text(formattedTotal);

        // Cập nhật giá trị vào input ẩn (nếu có dùng input hidden cho tổng tiền)
        $('#hiddenTotalPrice').val(total);
    }

    // 3. Sự kiện click nút Tăng/Giảm
    $('.quantity button').on('click', function () {
        var button = $(this);
        var input = button.closest('.quantity').find('input.quantity-input');
        var oldValue = parseFloat(input.val());
        var newVal = oldValue;

        if (button.hasClass('btn-plus')) {
            newVal = oldValue + 1;
        } else {
            if (oldValue > 1) {
                newVal = oldValue - 1;
            } else {
                newVal = 1; // Không cho giảm dưới 1
            }
        }

        // Cập nhật số lượng mới vào ô input hiển thị
        input.val(newVal);

        // ===========================================================
        // [QUAN TRỌNG] Đồng bộ dữ liệu sang Form ẩn của Spring MVC
        // ===========================================================

        // Lấy index của sản phẩm (đã gán trong attribute data-cart-detail-index ở file show.jsp)
        const index = input.data('cart-detail-index');

        // Tìm ô input ẩn tương ứng trong form Spring và cập nhật giá trị mới
        // Spring bind dữ liệu theo dạng name="cartDetails[0].quantity"
        $('input[name="cartDetails[' + index + '].quantity"]').val(newVal);

        // ===========================================================

        // --- CẬP NHẬT THÀNH TIỀN TỪNG MÓN ---
        const price = parseFloat(input.data('price'));
        const itemTotal = newVal * price;

        // Tìm thẻ hiển thị tiền của dòng đó
        const itemTotalElement = button.closest('tr').find('.item-total-price');
        itemTotalElement.text(formatCurrency(itemTotal) + ' đ');

        // --- CẬP NHẬT TỔNG GIỎ HÀNG ---
        updateCartTotal();
    });

})(jQuery);