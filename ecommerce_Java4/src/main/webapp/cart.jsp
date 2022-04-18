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
<%@ page import="java.text.DecimalFormat" %>
<%@ page contentType="text/html;charset=UTF-8"
         session="true"
         language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);
    Users auth = (Users) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("auth", auth);

    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    List<Cart> cartProduct = null;
    if (cart_list != null) {
        ProductsDAO pDao = new ProductsDAO(DbCon.getConnection());
        cartProduct = pDao.getCartProducts(cart_list);
        double total = pDao.getTotalCartPrice(cart_list);
        request.setAttribute("cart_list", cart_list);
        request.setAttribute("total", total);
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
<jsp:include page="include/component/search.jsp"/>


<!-- Start Content -->
<div class="container my-3">
    <div class="d-flex py-3"><h3>Total Price: $
        ${(total>0)?dcf.format(total):0}

    </h3> <a class="mx-3 btn btn-primary"
             href="/ecommerce_Java4_war/cart-check-out">Check
        Out</a></div>
    <table class="table table-light">
        <thead>
        <tr>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col">Price</th>
            <th scope="col">Buy Now</th>
            <th scope="col">Cancel</th>
        </tr>
        </thead>
        <tbody>
        <%
            if (cart_list != null) {
                for (Cart c : cartProduct) {
        %>
        <tr>
            <td><%=c.getNameProduct()%>
            </td>
            <td><%=c.getCategoryId()%>
            </td>
            <td>
                <%= dcf.format(c.getPrice())%>
            </td>
            <td>
                <form action="order-now" method="get" class="form-inline">
                    <input type="hidden" name="id" value="<%= c.getId()%>" class="form-input">
                    <div class="form-group d-flex">
                        <a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=dec&id=<%=c.getId()%>"><i
                                class="fas fa-minus-square"></i></a>
                        <input type="text" name="quantity" class="form-control" value="<%=c.getQuantity()%>"
                               style="width: 250px;"
                               required>
                        <a class="btn bnt-sm btn-incre" href="quantity-inc-dec?action=inc&id=<%=c.getId()%>"><i
                                class="fas fa-plus-square"></i></a>
                        <button type="submit" class="btn btn-primary btn-sm">Buy</button>
                    </div>
                </form>
            </td>
            <td><a href="remove-from-cart?id=<%=c.getId() %>" class="btn btn-sm btn-danger">Remove</a></td>
        </tr>

        <%
                }
            }%>
        </tbody>
    </table>
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
    function loadMore() {
        var amount = document.getElementsByClassName("product").length;
        $.ajax({
            url: "/Assignment_Java4_war/load",
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
            url: "/Assignment_Java4_war/SearchByAjax",
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
