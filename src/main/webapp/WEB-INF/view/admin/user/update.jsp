<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cập nhật User #${id}</title>
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
                <h1 class="mt-4 text-warning">Cập nhật tài khoản</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                    <li class="breadcrumb-item"><a href="/admin/user">Users</a></li>
                    <li class="breadcrumb-item active">Update</li>
                </ol>

                <div class="card shadow border-0 rounded-lg mb-4">
                    <div class="card-header bg-white border-bottom-warning"><h5 class="my-2 text-warning"><i
                            class="fas fa-user-edit me-2"></i>Sửa thông tin: #${id}</h5></div>
                    <div class="card-body">
                        <form:form method="post" action="/admin/user/update" modelAttribute="newUser"
                                   enctype="multipart/form-data" class="row g-3">
                            <form:hidden path="id"/>

                            <div class="col-md-8">
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <label class="form-label fw-bold">Email (Không thể sửa)</label>
                                        <form:input type="email" class="form-control bg-light" path="email"
                                                    disabled="true"/>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label fw-bold">Họ và tên</label>
                                        <form:input type="text" class="form-control" path="fullName"/>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label fw-bold">Số điện thoại</label>
                                        <form:input type="text" class="form-control" path="phone"/>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label fw-bold">Vai trò</label>
                                        <form:select class="form-select" path="role.name">
                                            <form:option value="ADMIN">ADMIN</form:option>
                                            <form:option value="USER">USER</form:option>
                                        </form:select>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label fw-bold">Địa chỉ</label>
                                        <form:input type="text" class="form-control" path="address"/>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4 text-center">
                                <label class="form-label fw-bold">Ảnh đại diện mới</label>
                                <div class="mt-2">
                                    <img id="avatarPreview" src="#" alt="New Avatar Preview"
                                         style="max-height: 200px; display: none;" class="img-thumbnail mb-2"/>
                                </div>
                                <input type="file" class="form-control" id="avatarFile" name="hoidanitFile"
                                       accept="image/*"/>
                            </div>

                            <div class="col-12 text-end mt-4 pt-3 border-top">
                                <a href="/admin/user" class="btn btn-secondary px-4">Hủy bỏ</a>
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
            $("#avatarPreview").attr("src", imgURL).css("display", "block");
        });
    });
</script>
</body>
</html>