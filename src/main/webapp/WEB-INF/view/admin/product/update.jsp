<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cập nhật sản phẩm #${id}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link href="/css/styles.css" rel="stylesheet"/>
</head>
<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp"/>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4 text-warning">Cập nhật sản phẩm</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                    <li class="breadcrumb-item"><a href="/admin/product">Products</a></li>
                    <li class="breadcrumb-item active">Update</li>
                </ol>

                <div class="card shadow border-0 rounded-lg mb-4">
                    <div class="card-header bg-white border-bottom-warning"><h5 class="my-2 text-warning"><i
                            class="fas fa-edit me-2"></i>Sửa thông tin: #${id}</h5></div>
                    <div class="card-body">
                        <form:form method="post" action="/admin/product/update" modelAttribute="newProduct"
                                   enctype="multipart/form-data" class="row g-3">
                            <form:hidden path="id"/>

                            <div class="col-lg-8">
                                <div class="row g-3">
                                    <div class="col-12">
                                        <label class="form-label fw-bold">Tên sản phẩm</label>
                                        <form:input type="text" class="form-control" path="name"/>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label fw-bold">Giá tiền</label>
                                        <div class="input-group">
                                            <form:input type="number" class="form-control" path="price"/>
                                            <span class="input-group-text">VNĐ</span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label fw-bold">Số lượng</label>
                                        <form:input type="number" class="form-control" path="quantity"/>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label fw-bold">Hãng sản xuất</label>
                                        <form:select class="form-select" path="factory">
                                            <form:option value="Apple">Apple (MacBook)</form:option>
                                            <form:option value="Asus">Asus</form:option>
                                            <form:option value="Lenovo">Lenovo</form:option>
                                            <form:option value="Dell">Dell</form:option>
                                            <form:option value="LG">LG</form:option>
                                            <form:option value="Acer">Acer</form:option>
                                        </form:select>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label fw-bold">Nhu cầu</label>
                                        <form:select class="form-select" path="target">
                                            <form:option value="Gaming">Gaming</form:option>
                                            <form:option
                                                    value="Sinh viên - Văn phòng">Sinh viên - Văn phòng</form:option>
                                            <form:option value="Thiết kế đồ họa">Thiết kế đồ họa</form:option>
                                            <form:option value="Mỏng nhẹ">Mỏng nhẹ</form:option>
                                            <form:option value="Doanh nhân">Doanh nhân</form:option>
                                        </form:select>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label fw-bold">Mô tả ngắn</label>
                                        <form:textarea class="form-control" path="shortDesc" rows="3"/>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label fw-bold">Mô tả chi tiết</label>
                                        <form:textarea class="form-control" path="detailDesc" rows="5"/>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-4 text-center">
                                <div class="p-3 border rounded bg-light">
                                    <label class="form-label fw-bold d-block mb-3">Hình ảnh sản phẩm</label>
                                    <c:if test="${not empty newProduct.image}">
                                        <div class="mb-2">
                                            <small class="text-muted d-block mb-1">Ảnh hiện tại:</small>
                                            <img src="/images/product/${newProduct.image}" class="img-thumbnail"
                                                 style="max-height: 150px;" alt="Current Image">
                                        </div>
                                    </c:if>

                                    <div class="mt-3">
                                        <small class="text-muted d-block mb-1">Chọn ảnh mới (nếu muốn thay đổi):</small>
                                        <img id="avatarPreview" style="max-height: 150px; display: none;"
                                             class="img-thumbnail mb-2 mx-auto"/>
                                        <input type="file" class="form-control" id="avatarFile" name="hoidanitFile"
                                               accept="image/*"/>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12 text-end mt-4 pt-3 border-top">
                                <a href="/admin/product" class="btn btn-secondary px-4 me-2">Hủy bỏ</a>
                                <button type="submit" class="btn btn-warning px-4 fw-bold text-white">Lưu thay đổi
                                </button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="../layout/footer.jsp"/>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="/js/scripts.js"></script>
<script>
    $(document).ready(() => {
        $("#avatarFile").change(function (e) {
            const imgURL = URL.createObjectURL(e.target.files[0]);
            $("#avatarPreview").attr("src", imgURL).show();
        });
    });
</script>
</body>
</html>