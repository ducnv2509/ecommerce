<%--
  Created by IntelliJ IDEA.
  User: ducit
  Date: 3/30/2022
  Time: 8:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!doctype html>
<html lang="en">
<head>
    <title>Login 05</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet"
          href="${pageContext.servletContext.contextPath}/LoginAndRegister/Login/login-form-15/css/style.css">

</head>
<body>
<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-7 col-lg-5">
                <div class="wrap">
                    <div class="img"
                         style="background-image: url(${pageContext.servletContext.contextPath}/LoginAndRegister/Login/login-form-15/images/bg-1.jpg);"></div>
                    <div class="login-wrap p-4 p-md-5">
                        <div class="d-flex">
                            <div class="w-100">
                                <h3 class="mb-4">Sign In</h3>
                            </div>

                            <div class="w-100">
                                <p class="social-media d-flex justify-content-end">
                                    <a href="#"
                                       class="social-icon d-flex align-items-center justify-content-center"><span
                                            class="fa fa-facebook"></span></a>
                                    <a href="#"
                                       class="social-icon d-flex align-items-center justify-content-center"><span
                                            class="fa fa-twitter"></span></a>
                                </p>
                            </div>
                        </div>
                        <form action="LoginControl" class="signin-form" method="post">
                            <div class="form-group mt-3">
                                <input type="text" name="username" class="form-control" required>
                                <label class="form-control-placeholder">Username</label>
                            </div>
                            <div class="form-group">
                                <input id="password-field" name="password" type="password" class="form-control"
                                       required>
                                <label class="form-control-placeholder">Password</label>
                                <span toggle="#password-field"
                                      class="fa fa-fw fa-eye field-icon toggle-password"></span>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="form-control btn btn-primary rounded submit px-3">Sign In
                                </button>
                            </div>
                            <div class="form-group d-md-flex">
                                <div class="w-50 text-left">
                                    <label class="checkbox-wrap checkbox-primary mb-0">Remember Me
                                        <input type="checkbox" checked>
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <div class="w-50 text-md-right">
                                    <a href="/ecommerce_Java4_war/ForgotPassword">Forgot Password</a>
                                </div>
                            </div>
                        </form>
                        <p class="text-center">Not a member? <a href="/ecommerce_Java4_war/SignUpControl">Sign Up</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="${pageContext.servletContext.contextPath}/LoginAndRegister/Login/login-form-15/js/jquery.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/LoginAndRegister/Login/login-form-15/js/popper.js"></script>
<script src="${pageContext.servletContext.contextPath}/LoginAndRegister/Login/login-form-15/js/bootstrap.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/LoginAndRegister/Login/login-form-15/js/main.js"></script>

</body>
</html>


