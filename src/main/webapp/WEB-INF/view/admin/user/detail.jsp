<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hồ sơ người dùng #${id}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link href="/css/styles.css" rel="stylesheet"/>
    <style>
        .profile-card-header {
            background: linear-gradient(135deg, #0d6efd, #0dcaf0);
            height: 120px;
            border-radius: 0.5rem 0.5rem 0 0;
        }

        .profile-avatar {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            border: 5px solid #fff;
            margin-top: -60px;
            object-fit: cover;
            background: #fff;
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
                <ol class="breadcrumb mb-4 mt-4">
                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                    <li class="breadcrumb-item"><a href="/admin/user">Users</a></li>
                    <li class="breadcrumb-item active">Detail</li>
                </ol>

                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <div class="card shadow border-0 rounded-lg">
                            <div class="profile-card-header"></div>
                            <div class="card-body text-center">
                                <img src="/images/avatar/${user.avatar}"
                                     onerror="this.src='https://ui-avatars.com/api/?name=${user.fullName}&size=120'"
                                     class="profile-avatar mb-3 shadow-sm" alt="User Avatar">

                                <h3 class="fw-bold text-dark">${user.fullName}</h3>
                                <p class="text-muted mb-4"><span
                                        class="badge bg-primary rounded-pill">${user.role.name}</span></p>

                                <div class="row text-start mt-4 px-lg-5">
                                    <div class="col-md-6 mb-3">
                                        <label class="small text-muted text-uppercase fw-bold">Email</label>
                                        <div class="fs-5"><i class="fas fa-envelope text-primary me-2"></i>${user.email}
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="small text-muted text-uppercase fw-bold">User ID</label>
                                        <div class="fs-5">#${user.id}</div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="small text-muted text-uppercase fw-bold">Số điện thoại</label>
                                        <div class="fs-5"><i class="fas fa-phone text-success me-2"></i>${user.phone}
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="small text-muted text-uppercase fw-bold">Địa chỉ</label>
                                        <div class="fs-5"><i
                                                class="fas fa-map-marker-alt text-danger me-2"></i>${user.address}</div>
                                    </div>
                                </div>

                                <div class="mt-4 border-top pt-3">
                                    <a href="/admin/user" class="btn btn-outline-secondary px-4 me-2">Quay lại</a>
                                    <a href="/admin/user/update/${user.id}" class="btn btn-primary px-4">Chỉnh sửa</a>
                                </div>
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