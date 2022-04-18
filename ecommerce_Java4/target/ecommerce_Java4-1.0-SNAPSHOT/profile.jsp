<%@ page import="DAO.AccountDAO" %>
<%@ page import="entity.FlowStatus" %>
<%@ page import="java.util.List" %>
<%@ page import="DAO.StatusOrderDAO" %>
<%@ page import="entity.Users" %>
<%@ page contentType="text/html;charset=UTF-8"
         session="true"
         language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    Users users = (Users) session.getAttribute("auth");
    AccountDAO accountDAO = new AccountDAO();
    StatusOrderDAO statusOrderDAO = new StatusOrderDAO();
    List<FlowStatus> list = statusOrderDAO.ListStatus(users.getId());
    List<FlowStatus> listH = statusOrderDAO.historyOrder(users.getId());
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
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/include/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/include/assets/css/templatemo.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/include/assets/css/custom.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/views/dashboardAdmin/css/styles.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/include/assets/css/fontawesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
<div class="container m-5 p-5">

    <div class="d-flex align-items-start">
        <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            <button class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill"
                    data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home"
                    aria-selected="true">Profile
            </button>
            <button class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill"
                    data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile"
                    aria-selected="false">ChangePassword
            </button>
            <button class="nav-link" id="v-pills-messages-tab" data-bs-toggle="pill"
                    data-bs-target="#v-pills-messages" type="button" role="tab" aria-controls="v-pills-messages"
                    aria-selected="false">Theo dõi đơn hàng
            </button>
            <button class="nav-link" id="v-pills-settings-tab" data-bs-toggle="pill"
                    data-bs-target="#v-pills-settings" type="button" role="tab" aria-controls="v-pills-settings"
                    aria-selected="false">Lịch sử Đặt Hàng
            </button>

<%--            <button class="nav-link" id="v-pills-favorite-tab" data-bs-toggle="pill"--%>
<%--                    data-bs-target="#v-pills-favorite" type="button" role="tab" aria-controls="v-pills-favorite"--%>
<%--                    aria-selected="false">Lịch sử thích--%>
<%--            </button>--%>
        </div>
        <div class="tab-content" id="v-pills-tabContent">
            <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel"
                 aria-labelledby="v-pills-home-tab">
                <div class="container">
                    <form action="ProfileServlet" method="post" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-4">
                                <div class="row">
                                    <img src="${users.avatar}" class="img-fluid" alt="">
                                </div>
                                <div class="row">
                                    <input class="form-control" name="imageProduct" type="file" id="formFile">
                                </div>
                            </div>

                            <div class="col-8">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label>UserName</label>
                                            <input type="text" name="username" class="form-control"
                                                   value="${users.username}"
                                                   disabled>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label>Họ Tên</label>
                                            <input type="text" name="fullName" class="form-control"
                                                   value="${users.fullName}">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label>Address</label>
                                            <input type="text" name="address" class="form-control"
                                                   value="${users.address}">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input type="email" name="email" class="form-control"
                                                   value="${users.email}">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Phone</label>
                                            <input type="text" name="phone" class="form-control" value="${users.phone}">
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <label>Gender: </label>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="gender" value="true"
                                            ${users.gender ? 'checked':''}
                                            >
                                            <label class="form-check-label">
                                                Male
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="gender" value="false"
                                            ${!users.gender ? 'checked':''}>
                                            <label class="form-check-label">
                                                FeMale
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-check mt-4">
                                    <button class="btn btn-primary"
                                            formaction="ProfileServlet/update?id=${sessionScope.auth.id}">Update
                                    </button>
                                    <button class="btn btn-info" formaction="DashboardAdmin/reset">Reset</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

            </div>
            <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                <form action="UpdatePassServlet" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label>Password New</label>
                                <input type="password" name="password" class="form-control" value="">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label>RE_Passwords</label>
                                <input type="password" name="re_password" class="form-control" value="">
                            </div>
                        </div>
                    </div>

                    <div class="form-check mt-4">
                        <button class="btn btn-primary"
                                formaction="UpdatePassServlet/update?id=${sessionScope.auth.id}">Update
                        </button>
                        <button class="btn btn-info">Reset</button>
                    </div>
                </form>


            </div>

            <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="datatablesSimple1" class="table-striped table tab-content table-hover">
                                <thead>
                                <tr>
                                    <th>ID_Order</th>
                                    <th>ImageProduct</th>
                                    <th>nameProduct</th>
                                    <th>size</th>
                                    <th>color</th>
                                    <th>quantity</th>
                                    <th>price</th>
                                    <th>total</th>
                                    <th>Date</th>
                                    <th>status</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    if (!list.isEmpty()) {
                                        for (FlowStatus f : list
                                        ) {
                                %>
                                <tr>
                                    <td><%= f.getO_id() %>
                                    </td>
                                    <td>
                                        <img src="<%= f.getImageProduct() %>" class="img-fluid" width="105px" alt="">
                                    </td>
                                    <td><%= f.getNameProduct() %>
                                    </td>
                                    <td><%= f.getSize() %>
                                    </td>
                                    <td><%= f.getColor() %>
                                    </td>
                                    <td><%= f.getO_quantity() %>
                                    </td>
                                    <td><%= f.getPrice() %> $
                                    </td>
                                    <td><%= f.getTotal() %> $
                                    </td>
                                    <td>
                                        <%=
                                        f.getOrder_Date()
                                        %>
                                    </td>
                                    <td>
                                        <%
                                            if (f.getStatus() == 2) {
                                                out.print("Chờ lấy hàng");
                                            } else if (f.getStatus() == 1) {
                                                out.print("Chờ xác nhận");
                                            }
                                        %>
                                    </td>
                                </tr>
                                <%
                                        }
                                    } else {
                                        out.println("There is no proucts");
                                    }
                                %>
                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="datatablesSimple">
                                <thead>
                                <tr>
                                    <th>ID_Order</th>
                                    <th>ImageProduct</th>
                                    <th>nameProduct</th>
                                    <th>size</th>
                                    <th>color</th>
                                    <th>quantity</th>
                                    <th>price</th>
                                    <th>total</th>
                                    <th>Date</th>
                                    <th>status</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    if (!listH.isEmpty()) {
                                        for (FlowStatus f : listH
                                        ) {
                                %>
                                <tr>
                                    <td><%= f.getO_id() %>
                                    </td>
                                    <td>
                                        <img src="<%= f.getImageProduct() %>" class="img-fluid" width="105px" alt="">
                                    </td>
                                    <td><%= f.getNameProduct() %>
                                    </td>
                                    <td><%= f.getSize() %>
                                    </td>
                                    <td><%= f.getColor() %>
                                    </td>
                                    <td><%= f.getO_quantity() %>
                                    </td>
                                    <td><%= f.getPrice() %> $
                                    </td>
                                    <td><%= f.getTotal() %> $
                                    </td>
                                    <td>
                                        <%=
                                        f.getOrder_Date()
                                        %>
                                    </td>
                                    <td>
                                        <%
                                            if (f.getStatus() == 3) {
                                                out.print("Hoàn Tất");
                                            } else if (f.getStatus() == 4) {
                                                out.print("Huỷ");
                                            }
                                        %>
                                    </td>
                                </tr>
                                <%
                                        }
                                    } else {
                                        out.println("There is no proucts");
                                    }
                                %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="tab-pane fade" id="v-pills-favorite" role="tabpanel" aria-labelledby="v-pills-favorite-tab">
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="datatablesSimple2">
                                <thead>
                                <tr>
                                    <th>ID_Favorite</th>
                                    <th>user_ID</th>
                                    <th>product_id</th>
                                    <th>Date</th>
                                </tr>
                                </thead>

                                <tbody>
                                <c:forEach items="${lv}" var="l">
                                <tr>
                                    <td>${l.id}</td>
                                    <td>${l.userID}</td>
                                    <td>${l.productId}</td>
                                    <td>${l.likeDate}</td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
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
<%--    s--%>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<%--    e--%>
<script src="${pageContext.servletContext.contextPath}/views/dashboardAdmin/js/datatables-simple-demo.js"></script>
<script src="${pageContext.servletContext.contextPath}/views/dashboardAdmin/js/table_DataORder.js"></script>
<script src="${pageContext.servletContext.contextPath}/views/dashboardAdmin/js/scripts.js"></script>

<!-- End Script -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
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
