<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login V8</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png"
          href="${pageContext.servletContext.contextPath}/forgotPassword/Forgot/images/icons/favicon.ico"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.servletContext.contextPath}/forgotPassword/Forgot/vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.servletContext.contextPath}/forgotPassword/Forgot/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.servletContext.contextPath}/forgotPassword/Forgot/vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.servletContext.contextPath}/forgotPassword/Forgot/vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.servletContext.contextPath}/forgotPassword/Forgot/vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.servletContext.contextPath}/forgotPassword/Forgot/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.servletContext.contextPath}/forgotPassword/Forgot/vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.servletContext.contextPath}/forgotPassword/Forgot/css/util.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.servletContext.contextPath}/forgotPassword/Forgot/css/main.css">
    <!--===============================================================================================-->
    <base href="/ecommerce_Java4_war/"/>

</head>
<body>

<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <form action="ForgotPassword" method="post" class="login100-form validate-form p-l-55 p-r-55 p-t-178">
					<span class="login100-form-title">
						Forgot Password
					</span>

                <div class="wrap-input100 validate-input m-b-16" data-validate="Please enter username">
                    <input class="input100" type="text" name="username" placeholder="Username">
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="Please enter email">
                    <input class="input100" type="text" name="email" placeholder="email">
                    <span class="focus-input100"></span>
                </div>

                <div class="text-right p-t-13 p-b-23">
						<span class="txt1">
							Forgot
						</span>

                    <a href="#" class="txt2">
                        Username / Password?
                    </a>
                </div>

                <div class="container-login100-form-btn">
                    <button class="login100-form-btn"
                            formaction="ForgotPassword/sendMail">
                        Forgot
                    </button>
                </div>

                <div class="flex-col-c p-t-170 p-b-40">
						<span class="txt1 p-b-9">
							Don’t have an account?
						</span>

                    <a href="#" class="txt3">
                        Sign up now
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>


<!--===============================================================================================-->
<script src="${pageContext.servletContext.contextPath}/forgotPassword/Forgot/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.servletContext.contextPath}/forgotPassword/Forgot/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.servletContext.contextPath}/forgotPassword/Forgot/vendor/bootstrap/js/popper.js"></script>
<script src="${pageContext.servletContext.contextPath}/forgotPassword/Forgot/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.servletContext.contextPath}/forgotPassword/Forgot/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.servletContext.contextPath}/forgotPassword/Forgot/vendor/daterangepicker/moment.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/forgotPassword/Forgot/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.servletContext.contextPath}/forgotPassword/Forgot/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.servletContext.contextPath}/forgotPassword/Forgot/js/main.js"></script>

</body>
</html>