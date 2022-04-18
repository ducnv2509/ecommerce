<%--
  Created by IntelliJ IDEA.
  User: ducit
  Date: 3/29/2022
  Time: 7:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-lg-3">
    <h1 class="h2 pb-4">Categories</h1>
    <ul class="list-unstyled templatemo-accordion">
        <li class="pb-3">
            <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                Gender
                <i class="fa fa-fw fa-chevron-circle-down mt-1"></i>
            </a>
            <ul class="collapse show list-unstyled pl-3">
                <li><a class="text-decoration-none" href="#">Men</a></li>
                <li><a class="text-decoration-none" href="#">Women</a></li>
            </ul>
        </li>
        <li class="pb-3">
            <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                Sale
                <i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
            </a>
            <ul id="collapseTwo" class="collapse list-unstyled pl-3">
                <li><a class="text-decoration-none" href="#">Sport</a></li>
                <li><a class="text-decoration-none" href="#">Luxury</a></li>
            </ul>
        </li>
        <li class="pb-3">
            <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                Category
                <i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
            </a>
            <ul id="collapseThree" class="collapse list-unstyled pl-3">
                <c:forEach items="${category}" var="c">
                    <li><a class="text-decoration-none"
                           href="/ecommerce_Java4_war/CategoryControl?id=${c.id}">${c.nameCategory}</a></li>
                </c:forEach>
            </ul>
        </li>
    </ul>
</div>

