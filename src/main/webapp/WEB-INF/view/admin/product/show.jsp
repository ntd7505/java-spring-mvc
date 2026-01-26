<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <!-- Latest compiled and minified CSS -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet">
        <!-- Latest compiled JavaScript -->
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <link href="/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
            crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <jsp:include page="../layout/header.jsp" />
        <div id="layoutSidenav">
            <jsp:include page="../layout/sidebar.jsp" />

            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Products Management</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active"><a
                                    href="/admin">Dashboard</a> <span> /
                                    Products</span></li>
                        </ol>
                        <div class="row">
                            <div class="col-12 mx-auto">

                                <div class="d-flex justify-content-between">
                                    <h2>Table Products</h2>

                                    <a href="/admin/product/create"><button
                                            type="button"
                                            class="btn btn-primary">Create a
                                            product</button></a>
                                </div>
                                <hr>
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Factory</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="products" items="${product}">
                                            <tr>
                                                <th>${products.id}</th>
                                                <td>${products.name}</td>
                                                <td>${products.price}</td>
                                                <td>${products.factory}</td>
                                                <td><a
                                                        href="/admin/product/${products.id}"><button
                                                            type="button"
                                                            class="btn btn-success">View</button></a>
                                                    <a
                                                        href="/admin/product/update/${products.id}"><button
                                                            type="button"
                                                            class="btn btn-warning">Update</button></a>
                                                    <a
                                                        href="/admin/product/delete/${products.id}"><button
                                                            type="button"
                                                            class="btn btn-danger">Delete</button></a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </main>
                <jsp:include page="../layout/footer.jsp" />

            </div>
        </div>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
    </body>

</html>