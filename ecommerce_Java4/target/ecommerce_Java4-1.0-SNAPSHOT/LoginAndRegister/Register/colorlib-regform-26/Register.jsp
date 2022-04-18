<%--
  Created by IntelliJ IDEA.
  User: ducit
  Date: 3/30/2022
  Time: 8:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>RegistrationForm_v10 by Colorlib</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- LINEARICONS -->
    <link rel="stylesheet"
          href="${pageContext.servletContext.contextPath}/LoginAndRegister/Register/colorlib-regform-26/fonts/linearicons/style.css">

    <!-- STYLE CSS -->
    <link rel="stylesheet"
          href="${pageContext.servletContext.contextPath}/LoginAndRegister/Register/colorlib-regform-26/css/style.css">
</head>

<body>

<div class="wrapper">
    <div class="inner">
        <img src="${pageContext.servletContext.contextPath}/LoginAndRegister/Register/colorlib-regform-26/images/image-1.png"
             alt="" class="image-1">
        <form action="SignUpControl" method="post">
            <h3>New Account?</h3>
            <div class="form-holder">
                <span class="lnr lnr-user"></span>
                <input type="text" class="form-control" name="username" placeholder="Username">
            </div>
            <div class="form-holder">
                <span class="lnr lnr-phone-handset"></span>
                <input type="text" class="form-control" name="phone" placeholder="Phone Number">
            </div>
            <div class="form-holder">
                <span class="lnr lnr-user"></span>
                <input type="text" class="form-control" name="fullName" placeholder="FullName">
            </div>
            <div class="form-holder">
                <span class="lnr lnr-envelope"></span>
                <input type="text" class="form-control" name="email" placeholder="Mail">
            </div>
            <div class="form-holder">
                <span class="lnr lnr-lock"></span>
                <input type="password" class="form-control" name="password" placeholder="Password">
            </div>
            <div class="form-holder">
                <span class="lnr lnr-lock"></span>
                <input type="password" class="form-control" name="re_pass" placeholder="Confirm Password">
            </div>
            <div class="form-holder">
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" id="inlineRadio1" value="true">
                    <label class="form-check-label" for="inlineRadio1">Male</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" id="inlineRadio2" value="false">
                    <label class="form-check-label" for="inlineRadio2">FelMal</label>
                </div>
            </div>
            <button>
                <span>Register</span>
            </button>
        </form>
        <img src="${pageContext.servletContext.contextPath}/LoginAndRegister/Register/colorlib-regform-26/images/image-2.png"
             alt="" class="image-2">
    </div>

</div>

<script src="${pageContext.servletContext.contextPath}/LoginAndRegister/Register/colorlib-regform-26/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/LoginAndRegister/Register/colorlib-regform-26/js/main.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
