<%@ page import="entity.Users" %>
<%@ page import="entityOrder.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="DAO.ProductsDAO" %>
<%@ page import="Utils.DbCon" %>
<%@ page import="DAO.FavoriteDAO" %>
<%@ page import="entity.Favorite" %>
<%@ page import="Utils.SaveLogin" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ducit
  Date: 3/29/2022
  Time: 8:03 PM
  To change this template use File | Settings | File Templates.
--%>

<%--<%--%>
<%--    Users auth = (Users) request.getSession().getAttribute("auth");--%>
<%--    if (auth != null) {--%>
<%--        request.setAttribute("auth", auth);--%>
<%--    }--%>
<%--    FavoriteDAO favoriteDAO = new FavoriteDAO();--%>
<%--    assert auth != null;--%>
<%--    List<Favorite> list = favoriteDAO.findByIDUser(auth.getId());--%>


<%--%>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Zay Shop - Product Detail Page</title>
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

    <!-- Slick -->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.servletContext.contextPath}/include/assets/css/slick.min.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.servletContext.contextPath}/include/assets/css/slick-theme.css">
    <!--

    TemplateMo 559 Zay Shop

    https://templatemo.com/tm-559-zay-shop

    -->
</head>

<body>
<!-- Start Top Nav -->
<jsp:include page="include/component/info.jsp"/>
<!-- Close Top Nav -->


<!-- Header -->
<jsp:include page="include/component/header.jsp"/>
<!-- Close Header -->

<!-- Modal -->

<!-- Open Content -->
<section class="bg-light">
    <div class="container pb-5">
        <div class="row">
            <div class="col-lg-5 mt-5">
                <div class="card mb-3">
                    <img class="card-img img-fluid" src="${detailProduct.imageProduct}" width="524px"
                         alt="Card image cap"
                         id="product-detail">
                </div>
                <jsp:include page="include/component/Carousel.jsp"/>
            </div>
            <!-- col end -->
            <div class="col-lg-7 mt-5">
                <div class="card">
                    <div class="card-body">
                        <h1 class="h2">${detailProduct.nameProduct}</h1>
                        <p class="h3 py-2">${detailProduct.price} $</p>
                        <p class="py-2">
                            <i class="fa fa-star text-warning"></i>
                            <i class="fa fa-star text-warning"></i>
                            <i class="fa fa-star text-warning"></i>
                            <i class="fa fa-star text-warning"></i>
                            <i class="fa fa-star text-secondary"></i>
                            <span class="list-inline-item text-dark">Rating 4.8 | 36 Comments</span>
                        </p>
                        <ul class="list-inline">
                            <li class="list-inline-item">
                                <h6>Brand: </h6>
                            </li>
                            <li class="list-inline-item">
                                <c:forEach items="${supplier}" var="s">
                                    <c:if test="${s.id == detailProduct.supplierId}">
                                        <p class="text-muted"><strong>${s.nameSupplier}</strong></p>
                                    </c:if>
                                </c:forEach>
                            </li>
                        </ul>

                        <ul class="list-inline">
                            <li class="list-inline-item">
                                <h6>Avaliable Color :</h6>
                            </li>
                            <li class="list-inline-item">
                                <p class="text-muted"><strong>${detailProduct.color}</strong></p>
                            </li>
                        </ul>

                        <ul class="list-inline">
                            <li class="list-inline-item">
                                <h6>Size :</h6>
                            </li>
                            <li class="list-inline-item">
                                <p class="text-muted"><strong>${detailProduct.size}</strong></p>
                            </li>
                        </ul>

                        <h6>Specification:</h6>
                        <ul class="list-unstyled pb-3">
                            ${detailProduct.description}
                        </ul>
                        <form action="order-now" method="get">
                            <input type="hidden" name="product-title" value="Activewear">
                            <div class="row">
                                <div class="col-auto">
                                    <ul class="list-inline pb-3">
                                        <li class="list-inline-item text-right">
                                            Quantity
                                            <input type="hidden" name="product-quanity" id="product-quanity" value="1">
                                        </li>
                                        <li class="list-inline-item"><span class="btn btn-success"
                                                                           id="btn-minus">-</span></li>
                                        <li class="list-inline-item"><span class="badge bg-secondary"
                                                                           id="var-value">1</span>
                                        </li>
                                        <li class="list-inline-item"><span class="btn btn-success"
                                                                           id="btn-plus">+</span></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="row pb-3">
                                <div class="col d-grid">
                                    <a class="btn btn-success btn-lg"
                                       href="/ecommerce_Java4_war/order-now?quantity=1&id=${detailProduct.id}"
                                       role="button">Buy</a>
                                </div>
                                <div class="col d-grid">
                                    <a class="btn btn-success btn-lg"
                                       href="/ecommerce_Java4_war/add-to-cart?id=${detailProduct.id}"
                                       role="button">Add To Cart</a>
                                </div>


                            </div>
                        </form>

                        <div class="col d-grid">
                            <button id="likeUnlikeBTN" class="btn btn-success btn-lg" role="button">
                                Like
                            </button>
                            <button id="likeUnlikeBTN1" class="btn btn-success btn-lg" role="button">
                                Dis
                            </button>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Close Content -->

<!-- Start Article -->
<%--<section class="py-5">--%>
<%--    <div class="container">--%>
<%--        <div class="row text-left p-2 pb-3">--%>
<%--            <h4>Related Products</h4>--%>
<%--        </div>--%>

<%--        <!--Start Carousel Wrapper-->--%>
<%--        <div id="carousel-related-product">--%>
<%--            <c:forEach items="${product}" var="i">--%>
<%--                <div class="p-2 pb-3">--%>
<%--                    <div class="product-wap card rounded-0">--%>
<%--                        <div class="card rounded-0">--%>
<%--                            <img class="card-img rounded-0 img-fluid" src="${i.imageProduct}">--%>
<%--                            <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">--%>
<%--                                <ul class="list-unstyled">--%>
<%--                                    <li><a class="btn btn-success text-white"--%>
<%--                                           href="/ecommerce_Java4_war/detailProduct?id=${i.id}"><i--%>
<%--                                            class="far fa-heart"></i></a></li>--%>
<%--                                    <li><a class="btn btn-success text-white mt-2"--%>
<%--                                           href="/ecommerce_Java4_war/detailProduct?id=${i.id}"><i--%>
<%--                                            class="far fa-eye"></i></a></li>--%>
<%--                                    <li><a class="btn btn-success text-white mt-2"--%>
<%--                                           href="/ecommerce_Java4_war/add-to-cart?id=${i.id}"><i--%>
<%--                                            class="fas fa-cart-plus"></i></a></li>--%>
<%--                                </ul>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="card-body">--%>
<%--                            <a href="/ecommerce_Java4_war/detailProduct?id=${i.id}"--%>
<%--                               class="h3 text-decoration-none">${i.nameProduct}</a>--%>
<%--                            <ul class="w-100 list-unstyled d-flex justify-content-between mb-0">--%>
<%--                                <li>Size: ${i.size}</li>--%>
<%--                                <li class="pt-2">--%>
<%--                                    <span class="product-color-dot color-dot-red float-left rounded-circle ml-1"></span>--%>
<%--                                    <span class="product-color-dot color-dot-blue float-left rounded-circle ml-1"></span>--%>
<%--                                    <span class="product-color-dot color-dot-black float-left rounded-circle ml-1"></span>--%>
<%--                                    <span class="product-color-dot color-dot-light float-left rounded-circle ml-1"></span>--%>
<%--                                    <span class="product-color-dot color-dot-green float-left rounded-circle ml-1"></span>--%>
<%--                                </li>--%>
<%--                            </ul>--%>
<%--                            <ul class="list-unstyled d-flex justify-content-center mb-1">--%>
<%--                                <li>--%>
<%--                                    <i class="text-warning fa fa-star"></i>--%>
<%--                                    <i class="text-warning fa fa-star"></i>--%>
<%--                                    <i class="text-warning fa fa-star"></i>--%>
<%--                                    <i class="text-warning fa fa-star"></i>--%>
<%--                                    <i class="text-muted fa fa-star"></i>--%>
<%--                                </li>--%>
<%--                            </ul>--%>
<%--                            <p class="text-center mb-0">${i.price} $</p>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </c:forEach>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>

<input type="hidden" value="${detailProduct.id}" id="idHdn">

<!-- End Article -->


<!-- Start Footer -->
<jsp:include page="include/component/footerDetails.jsp"/>
<!-- End Footer -->

<!-- Start Script -->
<script src="${pageContext.servletContext.contextPath}/include/assets/js/jquery-1.11.0.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/include/assets/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/include/assets/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/include/assets/js/templatemo.js"></script>
<script src="${pageContext.servletContext.contextPath}/include/assets/js/custom.js"></script>
<!-- End Script -->

<!-- Start Slider Script -->

<script src="${pageContext.servletContext.contextPath}/include/assets/js/slick.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>
    // $('#likeUnlikeBTN').attr('id', 'likeUnlikeBTN1')
    // if($('#likeUnlikeBTN1').click(function () {
    //     $.ajax({
    //         url: '/ecommerce_Java4_war/UnlikeServlet'
    //     })
    // })){
    //
    // }
    // $('#likeUnlikeBTN').click(function () {
    //     var id = $('#idHdn').val();
    //     $.ajax({
    //         url: '/ecommerce_Java4_war/LikeProduct?id=' + id
    //     }).then(function (data) {
    //         var text = $('#likeUnlikeBTN').text();
    //         if (text.indexOf('Like') != -1) {
    //              $('#likeUnlikeBTN').text('Unlike');
    //         } else {
    //             $('#likeUnlikeBTN').text('Like')
    //         }
    //     }).fail(function () {
    //         alert('OopS')
    //     })
    // })
    $(document).ready(function(){
        $('#likeUnlikeBTN1').hide();
    })
    $('#likeUnlikeBTN').click(function () {
        var id = $('#idHdn').val();
        $.ajax({
            url: '/ecommerce_Java4_war/LikeProduct?id=' + id
        }).then(function (data) {
            var text = $('#likeUnlikeBTN').text();
            if (text.indexOf('Like') != -1) {
                $('#likeUnlikeBTN').hide();
                $('#likeUnlikeBTN1').show();
            }
        }).fail(function () {
            alert('OopS')
        })
    })
    $('#likeUnlikeBTN1').click(function () {
        var id = $('#idHdn').val();
        $.ajax({
            url: '/ecommerce_Java4_war/UnlikeServlet'
        }).then(function (data) {
            var text = $('#likeUnlikeBTN1').text();
            if (text.indexOf('Dis') != -1) {
                $('#likeUnlikeBTN1').hide();
                $('#likeUnlikeBTN').show();
            }
        }).fail(function () {
            alert('OopS')
        })
    })

    $('#carousel-related-product').slick({
        infinite: true,
        arrows: false,
        slidesToShow: 4,
        slidesToScroll: 3,
        dots: true,
        responsive: [{
            breakpoint: 1024,
            settings: {
                slidesToShow: 3,
                slidesToScroll: 3
            }
        },
            {
                breakpoint: 600,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 3
                }
            },
            {
                breakpoint: 480,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 3
                }
            }
        ]
    });
</script>
<!-- End Slider Script -->

</body>

</html>
