<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Product ${id}</title>

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
                            <div class="container mt-5">
                                <div class="row">
                                    <div class="col-md-6 col-12 mx-auto">
                                        <h3>Update Product ${id}</h3>
                                        <hr>
                                        <form:form method="post"
                                            action="/admin/product/update"
                                            modelAttribute="newProduct"
                                            enctype="multipart/form-data">
                                            <div class="mb-3"
                                                style="display: none;">
                                                <label
                                                    class="form-label">ID</label>
                                                <form:input type="text"
                                                    class="form-control"
                                                    path="id" />
                                            </div>
                                            <div class="mb-3">
                                                <label
                                                    class="form-label">Name</label>
                                                <form:input type="text"
                                                    class="form-control"
                                                    path="name" />
                                            </div>
                                            <div class="mb-3">
                                                <label
                                                    class="form-label">Price</label>
                                                <form:input type="text"
                                                    class="form-control"
                                                    path="price" />
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Detail
                                                    Desc</label>
                                                <form:input type="text"
                                                    class="form-control"
                                                    path="detailDesc" />
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">
                                                    Short desc</label>
                                                <form:input type="text"
                                                    class="form-control"
                                                    path="shortDesc" />
                                            </div>
                                            <div class="mb-3">
                                                <label
                                                    class="form-label">Quantity</label>
                                                <form:input type="text"
                                                    class="form-control"
                                                    path="quantity" />
                                            </div>
                                            <div class="mb-3 col-12 col-md-6">
                                                <label for="avatarFile"
                                                    class="form-label">Image</label>
                                                <input
                                                    class="form-control"
                                                    type="file" id="avatarFile"
                                                    accept=".png , .jpg, .jpeg"
                                                    name="hoidanitFile" />
                                                <!-- Display current image -->
                                                <c:if test="${newProduct.image != null}">
                                                    <div class="mt-3">
                                                        <p class="text-muted">Current Image:</p>
                                                        <img id="avatarPreview" 
                                                            src="/images/product/${newProduct.image}" 
                                                            alt="Product Image"
                                                            style="max-width: 200px; max-height: 200px; border: 1px solid #ddd; padding: 5px; display: block;">
                                                    </div>
                                                </c:if>
                                                <c:if test="${newProduct.image == null}">
                                                    <img id="avatarPreview" 
                                                        alt="Product Image Preview"
                                                        style="max-width: 200px; max-height: 200px; border: 1px solid #ddd; padding: 5px; display: none;">
                                                </c:if>
                                            </div>
                                            <div class="mb-3 col-12 col-md-6">
                                                <label
                                                    class="form-label">Factory</label>
                                                <form:select class="form-select"
                                                    path="factory">
                                                    <form:option
                                                        value="Apple">Apple(MacBook)</form:option>
                                                    <form:option
                                                        value="Asus">Asus</form:option>
                                                    <form:option
                                                        value="Lenovo">Lenovo</form:option>
                                                    <form:option
                                                        value="Dell">Dell</form:option>
                                                    <form:option
                                                        value="LG">LG</form:option>
                                                    <form:option
                                                        value="Acer">Acer</form:option>
                                                </form:select>
                                            </div>
                                            <div class="mb-3 col-12 col-md-6">
                                                <label
                                                    class="form-label">Target</label>
                                                <form:select class="form-select"
                                                    path="target">
                                                    <form:option
                                                        value="Gaming">Gaming</form:option>
                                                    <form:option
                                                        value="Sinh viên - Văn phòng">Sinh
                                                        viên - Văn
                                                        phòng</form:option>
                                                    <form:option
                                                        value="Thiết kế đồ họa">Thiết
                                                        kế đồ họa</form:option>
                                                    <form:option
                                                        value="Mỏng nhẹ">Mỏng
                                                        nhẹ</form:option>
                                                    <form:option
                                                        value="Doanh nhân">Doanh
                                                        nhân</form:option>

                                                </form:select>
                                            </div>
                                            <a href="/admin/user"
                                                class="btn btn-success">Back</a>
                                            <button type="submit"
                                                class="btn btn-warning">Update</button>
                                        </form:form>
                                    </div>
                                </div>
                            </div>
                        </ol>
                    </div>

                </main>
                <jsp:include page="../layout/footer.jsp" />

            </div>
        </div>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
        <script>
            $(document).ready(() => {
                const avatarFile = $("#avatarFile");
                avatarFile.change(function (e) {
                    const imgURL = URL.createObjectURL(e.target.files[0]);
                    $("#avatarPreview").attr("src", imgURL);
                    $("#avatarPreview").css({ "display": "block" });
                });
            });
        </script>
    </body>
</html>