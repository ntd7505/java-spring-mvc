<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Tạo người dùng mới</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link href="/css/styles.css" rel="stylesheet"/>
    <style>
        .preview-container {
            border: 2px dashed #ccc;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 250px;
            background: #f9f9f9;
            position: relative;
            overflow: hidden;
        }

        .preview-image {
            max-width: 100%;
            max-height: 250px;
            display: none;
            object-fit: contain;
        }

        .upload-icon {
            font-size: 50px;
            color: #ccc;
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
                <h1 class="mt-4 text-primary">Tạo tài khoản</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                    <li class="breadcrumb-item"><a href="/admin/user">Users</a></li>
                    <li class="breadcrumb-item active">Create</li>
                </ol>

                <div class="card shadow-lg border-0 rounded-lg mb-4">
                    <div class="card-header bg-white"><h5 class="my-2"><i class="fas fa-user-plus me-2"></i>Thông tin
                        tài khoản</h5></div>
                    <div class="card-body">
                        <form:form method="post" action="/admin/user/create1" modelAttribute="newUser"
                                   class="row g-3 needs-validation" enctype="multipart/form-data">

                            <div class="col-md-7">
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <div class="form-floating mb-3">
                                            <form:input type="email"
                                                        class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                                                        id="email" path="email" placeholder="name@example.com"/>
                                            <label for="email">Email address</label>
                                            <form:errors path="email" cssClass="invalid-feedback"/>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating mb-3">
                                            <form:input type="password" class="form-control" id="pass" path="password"
                                                        placeholder="Password"/>
                                            <label for="pass">Password</label>
                                            <form:errors path="password" cssClass="invalid-feedback"/>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-floating mb-3">
                                            <form:input type="text" class="form-control" id="fullName" path="fullName"
                                                        placeholder="Full Name"/>
                                            <label for="fullName">Họ và tên</label>
                                            <form:errors path="fullName" cssClass="invalid-feedback"/>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-floating mb-3">
                                            <form:input type="text" class="form-control" id="phone" path="phone"
                                                        placeholder="Phone"/>
                                            <label for="phone">Số điện thoại</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating mb-3">
                                            <form:select class="form-select" id="role" path="role.name">
                                                <form:option value="USER">User (Người dùng)</form:option>
                                                <form:option value="ADMIN">Admin (Quản trị)</form:option>
                                            </form:select>
                                            <label for="role">Vai trò</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-floating mb-3">
                                            <form:input type="text" class="form-control" id="address" path="address"
                                                        placeholder="Address"/>
                                            <label for="address">Địa chỉ</label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-5">
                                <label class="form-label fw-bold">Ảnh đại diện</label>
                                <div class="preview-container mb-3"
                                     onclick="document.getElementById('avatarFile').click()" style="cursor: pointer;">
                                    <i class="fas fa-cloud-upload-alt upload-icon" id="uploadIcon"></i>
                                    <img id="avatarPreview" class="preview-image" alt="Avatar Preview"/>
                                </div>
                                <input class="form-control" type="file" id="avatarFile" name="hoidanitFile"
                                       accept="image/*"/>
                                <div class="form-text text-center">Nhấn vào khung trên để chọn ảnh</div>
                            </div>

                            <div class="col-12 text-end mt-4 border-top pt-3">
                                <a href="/admin/user" class="btn btn-secondary px-4 me-2">Quay lại</a>
                                <button type="submit" class="btn btn-primary px-4 fw-bold">Tạo mới</button>
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
                $("#avatarPreview").attr("src", imgURL).css("display", "block");
                $("#uploadIcon").css("display", "none");
            }
        });
    });
</script>
</body>
</html>