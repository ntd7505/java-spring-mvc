<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Tạo sản phẩm mới</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link href="/css/styles.css" rel="stylesheet"/>
    <style>
        .preview-area {
            border: 2px dashed #ccc;
            border-radius: 10px;
            min-height: 250px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #f8f9fa;
            cursor: pointer;
            overflow: hidden;
            position: relative;
        }

        .preview-area:hover {
            background: #e9ecef;
            border-color: #0d6efd;
        }

        .upload-icon {
            font-size: 3rem;
            color: #adb5bd;
        }

        #avatarPreview {
            max-width: 100%;
            max-height: 250px;
            display: none;
            object-fit: contain;
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
                <h1 class="mt-4 text-primary">Tạo sản phẩm</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                    <li class="breadcrumb-item"><a href="/admin/product">Products</a></li>
                    <li class="breadcrumb-item active">Create</li>
                </ol>

                <div class="card shadow-lg border-0 rounded-lg mb-4">
                    <div class="card-header bg-white"><h5 class="my-2 text-secondary"><i class="fas fa-edit me-2"></i>Thông
                        tin sản phẩm</h5></div>
                    <div class="card-body">
                        <form:form method="post" action="/admin/product/create" modelAttribute="newProducts"
                                   class="row g-3 needs-validation" enctype="multipart/form-data">

                            <div class="col-lg-8">
                                <div class="row g-3">
                                    <div class="col-md-12">
                                        <div class="form-floating">
                                            <form:input type="text" class="form-control" id="name" path="name"
                                                        placeholder="Name"/>
                                            <label for="name">Tên sản phẩm</label>
                                            <form:errors path="name" cssClass="invalid-feedback d-block"/>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <form:input type="number" class="form-control" id="price" path="price"
                                                        placeholder="Price"/>
                                            <label for="price">Giá tiền (VNĐ)</label>
                                            <form:errors path="price" cssClass="invalid-feedback d-block"/>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <form:input type="number" class="form-control" id="quantity" path="quantity"
                                                        placeholder="Quantity"/>
                                            <label for="quantity">Số lượng kho</label>
                                            <form:errors path="quantity" cssClass="invalid-feedback d-block"/>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <form:select class="form-select" id="factory" path="factory">
                                                <form:option value="Apple">Apple (MacBook)</form:option>
                                                <form:option value="Asus">Asus</form:option>
                                                <form:option value="Lenovo">Lenovo</form:option>
                                                <form:option value="Dell">Dell</form:option>
                                                <form:option value="LG">LG</form:option>
                                                <form:option value="Acer">Acer</form:option>
                                            </form:select>
                                            <label for="factory">Hãng sản xuất</label>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <form:select class="form-select" id="target" path="target">
                                                <form:option value="Gaming">Gaming</form:option>
                                                <form:option
                                                        value="Sinh viên - Văn phòng">Sinh viên - Văn phòng</form:option>
                                                <form:option value="Thiết kế đồ họa">Thiết kế đồ họa</form:option>
                                                <form:option value="Mỏng nhẹ">Mỏng nhẹ</form:option>
                                                <form:option value="Doanh nhân">Doanh nhân</form:option>
                                            </form:select>
                                            <label for="target">Nhu cầu sử dụng</label>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <div class="form-floating">
                                            <form:textarea class="form-control" id="shortDesc" path="shortDesc"
                                                           style="height: 100px"
                                                           placeholder="Short Desc"></form:textarea>
                                            <label for="shortDesc">Mô tả ngắn</label>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <div class="form-floating">
                                            <form:textarea class="form-control" id="detailDesc" path="detailDesc"
                                                           style="height: 150px"
                                                           placeholder="Detail Desc"></form:textarea>
                                            <label for="detailDesc">Mô tả chi tiết</label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <label class="form-label fw-bold mb-2">Ảnh sản phẩm</label>
                                <div class="preview-area mb-3" onclick="document.getElementById('avatarFile').click()">
                                    <img id="avatarPreview" alt="Preview"/>
                                    <i class="fas fa-cloud-upload-alt upload-icon" id="uploadIcon"></i>
                                </div>
                                <input class="form-control" type="file" id="avatarFile" name="hoidanitFile"
                                       accept="image/*"/>
                                <div class="form-text text-center mt-2">Hỗ trợ: .png, .jpg, .jpeg (Max 5MB)</div>
                            </div>

                            <div class="col-12 text-end mt-4 pt-3 border-top">
                                <a href="/admin/product" class="btn btn-secondary px-4 me-2">Quay lại</a>
                                <button type="submit" class="btn btn-primary px-5 fw-bold">Tạo mới</button>
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
            const file = e.target.files[0];
            if (file) {
                const imgURL = URL.createObjectURL(file);
                $("#avatarPreview").attr("src", imgURL).show();
                $("#uploadIcon").hide();
            }
        });
    });
</script>
</body>
</html>