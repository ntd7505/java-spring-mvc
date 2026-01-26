<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Danh sách người dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link href="/css/styles.css" rel="stylesheet"/>
    <style>
        .table-custom th {
            background-color: #f8f9fa;
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 1px;
        }

        .avatar-sm {
            width: 40px;
            height: 40px;
            object-fit: cover;
            border-radius: 50%;
            border: 2px solid #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .action-btn {
            transition: all 0.2s;
            margin: 0 2px;
        }

        .action-btn:hover {
            transform: translateY(-2px);
        }

        .role-badge {
            padding: 8px 12px;
            border-radius: 20px;
            font-weight: 500;
            font-size: 0.8rem;
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
                <h1 class="mt-4 text-primary fw-bold">Quản lý người dùng</h1>
                <ol class="breadcrumb mb-4 bg-light p-3 rounded">
                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                    <li class="breadcrumb-item active">Users</li>
                </ol>

                <div class="card shadow-lg border-0 rounded-3 mb-4">
                    <div class="card-header bg-white py-3 d-flex justify-content-between align-items-center">
                        <h5 class="m-0 font-weight-bold text-secondary"><i class="fas fa-table me-2"></i>Danh sách tài
                            khoản</h5>
                        <a href="/admin/user/create" class="btn btn-primary rounded-pill px-4 shadow-sm">
                            <i class="fas fa-plus me-2"></i>Thêm mới
                        </a>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover align-middle table-custom">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Avatar</th>
                                    <th>Email</th>
                                    <th>Họ và Tên</th>
                                    <th>Vai trò</th>
                                    <th class="text-center">Thao tác</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="user" items="${users1}">
                                    <tr>
                                        <td class="fw-bold">#${user.id}</td>
                                        <td>
                                            <img src="/images/avatar/${user.avatar}"
                                                 onerror="this.src='https://ui-avatars.com/api/?name=${user.fullName}'"
                                                 class="avatar-sm" alt="user">
                                        </td>
                                        <td>${user.email}</td>
                                        <td class="fw-semibold">${user.fullName}</td>
                                        <td>
                                            <span class="role-badge ${user.role.name == 'ADMIN' ? 'bg-danger-subtle text-danger' : 'bg-success-subtle text-success'}">
                                                    ${user.role.name}
                                            </span>
                                        </td>
                                        <td class="text-center">
                                            <a href="/admin/user/${user.id}"
                                               class="btn btn-sm btn-info text-white action-btn" title="Xem"><i
                                                    class="fas fa-eye"></i></a>
                                            <a href="/admin/user/update/${user.id}"
                                               class="btn btn-sm btn-warning text-white action-btn" title="Sửa"><i
                                                    class="fas fa-pen"></i></a>
                                            <a href="/admin/user/delete/${user.id}"
                                               class="btn btn-sm btn-danger action-btn" title="Xóa"><i
                                                    class="fas fa-trash"></i></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
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