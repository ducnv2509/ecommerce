<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ducit
  Date: 3/29/2022
  Time: 4:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand-lg navbar-light shadow">

    <div class="container d-flex justify-content-between align-items-center">

        <a class="navbar-brand text-success logo h1 align-self-center" href="/ecommerce_Java4_war/Home">
            Zay
        </a>

        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse"
                data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between"
             id="templatemo_main_nav">
            <div class="flex-fill">
                <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/ecommerce_Java4_war/Home">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/ecommerce_Java4_war/About">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/ecommerce_Java4_war/HomePage">Shop</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/ecommerce_Java4_war/Contact">Contact</a>
                    </li>
                </ul>
            </div>
            <form action="SearchControl" method="get" class="d-flex">
                <input class="form-control me-2" oninput="searchByName(this)" type="search" name="q"
                       placeholder="Search"
                       aria-label="Search">
            </form>
            <div class="navbar align-self-center d-flex">
                <div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
                    <div class="input-group">
                        <input type="text" class="form-control" id="inputMobileSearch" placeholder="Search ...">
                        <div class="input-group-text">
                            <i class="fa fa-fw fa-search"></i>
                        </div>
                    </div>
                </div>
                <a class="nav-icon d-none d-lg-inline" href="#" data-bs-toggle="modal"
                   data-bs-target="#templatemo_search">
                    <i class="fa fa-fw fa-search text-dark mr-2"></i>
                </a>
                <a class="nav-icon position-relative text-decoration-none"
                <%--                   buggg--%>
                   href="/ecommerce_Java4_war/ShowCart">
                    <i class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i>
                    <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark"> ${cart_list.size()}</span>
                </a>
                <c:if test="${sessionScope.auth != null}">
                    <a class="nav-icon position-relative text-decoration-none">
                        Hello ${sessionScope.auth.fullName}
                    </a>
                </c:if>
                <div class="dropdown">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fa fa-fw fa-user text-dark"></i>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                        <c:if test="${sessionScope.auth == null}">
                            <li><a class="dropdown-item" href="/ecommerce_Java4_war/LoginControl">Login</a></li>
                        </c:if>
                        <c:if test="${sessionScope.auth.role == true}">
                            <li><a class="dropdown-item" href="/ecommerce_Java4_war/DashboardAdmin/index">Dashboard</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.auth != null}">
                            <li><a class="dropdown-item" href="/ecommerce_Java4_war/ProfileServlet">Profile</a></li>
                            <li><a class="dropdown-item" href="/ecommerce_Java4_war/LogoutServlet">Logout</a></li>
                        </c:if>
                    </ul>
                </div>

            </div>
        </div>

    </div>
</nav>