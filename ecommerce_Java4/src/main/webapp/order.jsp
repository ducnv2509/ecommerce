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
<%@ page import="entityOrder.Order" %>
<%@ page import="DAO.OrderDAO" %>
<%@ page contentType="text/html;charset=UTF-8"
         session="true"
         language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);
    Users auth = (Users) request.getSession().getAttribute("auth");
    List<Order> orders = null;
    if (auth != null) {
        request.setAttribute("auth", auth);
        orders = new OrderDAO(DbCon.getConnection()).userOrders(auth.getId());
    } else {
        response.sendRedirect("/ecommerce_Java4/HomePage");
    }
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
    <style>
        .activeC {
            color: red;
        }
    </style>
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
<div class="container">
    <div class="card-header my-3">All Orders</div>
    <table class="table table-light">
        <thead>
        <tr>
            <th scope="col">Date</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col">Quantity</th>
            <th scope="col">Price</th>
            <th scope="col">Cancel</th>
        </tr>
        </thead>
        <tbody>

        <%
            if (orders != null) {
                for (Order o : orders) {%>
        <tr>
            <td><%=o.getDate() %>
            </td>
            <td><%=o.getNameProduct() %>
            </td>
            <td><%=o.getCategoryId() %>
            </td>
            <td><%=o.getQuantity() %>
            </td>
            <td><%=dcf.format(o.getPrice()) %>
            </td>
            <td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId()%>">Cancel Order</a></td>
        </tr>
        <%
                }
            }
        %>

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
