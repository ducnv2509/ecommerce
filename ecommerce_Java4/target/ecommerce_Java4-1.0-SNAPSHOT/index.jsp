<%@ page import="entity.Users" %>
<%--<%@ page import="DAO.CustomerDAO.DAO.ProductDAO" %>--%>
<%--<%@ page import="DAO.CustomerDAO.connection.DbCon" %>--%>
<%@ page import="entity.Products" %>
<%--<%@ page import="DAO.CustomerDAO.DAO.Cart" %>--%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DAO.ProductsDAO" %>
<%@ page import="Utils.DbCon" %>
<%@ page import="entityOrder.Cart" %>
<%@ page import="entity.Favorite" %>
<%@ page import="DAO.FavoriteDAO" %>
<%@ page contentType="text/html;charset=UTF-8"
         session="true"
         language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    Users auth = (Users) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("auth", auth);
    }
    ProductsDAO pd = new ProductsDAO(DbCon.getConnection());
    List<Products> products = pd.findAll();

    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }

%>


<!DOCTYPE html>
<html lang="en">

<head>
    <title>Zay Shop - Product Listing Page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="${pageContext.servletContext.contextPath}/include/assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon"
          href="${pageContext.servletContext.contextPath}/include/assets/img/favicon.ico">

    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/include/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/include/assets/css/templatemo.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/include/assets/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/include/assets/css/fontawesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <base href="/ecommerce_Java4_war/">
    <!--

    TemplateMo 559 Zay Shop

    https://templatemo.com/tm-559-zay-shop

    -->
</head>

<body>
<!-- Start Top Nav -->
<jsp:include page="include/component/info.jsp"/>
<!-- Close Top Nav -->
<div id="spinner" class="spinner" style="display:none;">
    Getting value. Please wait....<br>
    <img id="img-spinner" src="loader.gif" alt="Loading"/>
</div>

<!-- Header -->
<jsp:include page="include/component/header.jsp"/>
<!-- Close Header -->

<!-- Modal -->
<jsp:include page="include/component/search.jsp"/>


<!-- Start Content -->
<div class="container py-5">
    <div class="row">
        <div class="col">
            <c:if test="${not empty sessionScope.message}">
                <script>
                    Swal.fire({
                        icon: "success",
                        title: "SuccessFully!",
                        text: "${sessionScope.message}",
                        showConfirmButton: false,
                        closeOnClickOutside: false,
                        allowOutsideClick: false,
                        timer: 1600,
                    });
                </script>
                <c:remove var="message" scope="session"/>
            </c:if>
            <c:if test="${not empty sessionScope.error}">
                <script>
                    Swal.fire({
                        icon: 'error',
                        title: 'ERROR!',
                        text: '${sessionScope.error}',
                    })
                </script>
                <c:remove var="error" scope="session"/>
            </c:if>
        </div>
    </div>
    <div class="row">

        <jsp:include page="include/component/categories.jsp"/>
        <div class="col-lg-9">
            <jsp:include page="include/component/chooseGender.jsp"/>
            <div id="content" class="row">
                <c:forEach var="i" items="${listA}">
                    <div class="product col-md-4">
                        <div class="card mb-4 product-wap rounded-0">
                            <div class="card rounded-0">
                                <img class="card-img rounded-0 img-fluid"
                                     src="${i.imageProduct}" width="256" height="256" alt="">
                                <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                    <ul class="list-unstyled">
                                        <li><a class="btn btn-success text-white"
                                               href="/ecommerce_Java4_war/LikeProduct?id=${i.id}"><i
                                                class="far fa-heart"></i></a>
                                        </li>
                                        <li><a class="btn btn-success text-white mt-2"
                                               href="/ecommerce_Java4_war/detailProduct?id=${i.id}"><i
                                                class="far fa-eye"></i></a></li>
                                        <li><a class="btn btn-success text-white mt-2"
                                               href="/ecommerce_Java4_war/add-to-cart?id=${i.id}"><i
                                                class="fas fa-cart-plus"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-body">
                                <a href="/ecommerce_Java4_war/detailProduct?id=${i.id}"
                                   class="h3 text-decoration-none">${i.nameProduct}</a>
                                <ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
                                    <li>Size: <strong>${i.size}</strong></li>
                                    <li>Color: <strong>${i.color}</strong></li>
                                    <li class="pt-2">
                                        <span class="product-color-dot color-dot-red float-left rounded-circle ml-1"></span>
                                        <span class="product-color-dot color-dot-blue float-left rounded-circle ml-1"></span>
                                        <span class="product-color-dot color-dot-black float-left rounded-circle ml-1"></span>
                                        <span class="product-color-dot color-dot-light float-left rounded-circle ml-1"></span>
                                        <span class="product-color-dot color-dot-green float-left rounded-circle ml-1"></span>
                                    </li>
                                </ul>
                                <ul class="list-unstyled d-flex justify-content-center mb-1">
                                    <li>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-muted fa fa-star"></i>
                                        <i class="text-muted fa fa-star"></i>
                                    </li>
                                </ul>
                                <p class="text-center mb-0">${i.price} $</p>
                            </div>
                                <%--                            <c:if test="${ like.product_id == i.id}">--%>
                                <%--                               --%>
                                <%--                            </c:if>--%>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <button onclick="loadMore()" class="btn btn-primary"> Load More</button>
            <div div="row">
                <ul class="pagination pagination-lg justify-content-end">
                    <c:forEach begin="1" end="${endP}" var="i">
                        <li class="page-item">
                            <a class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark ${tag == i ? "active" : ""}"
                               href="/ecommerce_Java4_war/HomePage?index=${i}">${i}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>

    </div>
</div>
<!-- End Content -->

<!-- Start Brands -->
<jsp:include page="include/component/footerAndSection.jsp"/>
<!-- End Footer -->

<!-- Start Script -->
<script src="${pageContext.servletContext.contextPath}/include/assets/js/jquery-1.11.0.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/include/assets/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/include/assets/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/include/assets/js/templatemo.js"></script>
<script src="${pageContext.servletContext.contextPath}/include/assets/js/custom.js"></script>
<!-- End Script -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>


    $(document).ready(function () {
        $("#spinner").bind("ajaxSend", function () {
            $(this).show();
        }).bind("ajaxStop", function () {
            $(this).hide();
        }).bind("ajaxError", function () {
            $(this).hide();
        });

    });

    function loadMore() {
        var amount = document.getElementsByClassName("product").length;
        $.ajax({
            url: "/ecommerce_Java4_war/load",
            type: "get",
            data: {
                exits: amount
            },
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML += data;

            },
            error: function (xhr) {

            }
        })
    }

    function searchByName(param) {
        var txtSearch = param.value;
        $.ajax({
            url: "/ecommerce_Java4_war/SearchByAjax",
            type: "get",
            data: {
                q: txtSearch
            },
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML = data;

            },
            error: function (xhr) {

            }
        })
    }
</script>
</body>

</html>
