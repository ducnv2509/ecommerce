<%--
  Created by IntelliJ IDEA.
  User: ducit
  Date: 3/27/2022
  Time: 9:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url var="DashboardAdmin" value="/DashboardAdmin"/>

<%--<a class="btn btn-primary" href="${DashboardAdmin}/createProduct" role="button">Thêm mới</a>--%>
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
    Thêm mới
</button>

<!-- Modal -->
<div class="modal fade " id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">CRUD_Account</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="DashboardAdmin" method="post">
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label>UserName</label>
                                <input type="text" name="username" class="form-control" value="">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label>Họ Tên</label>
                                <input type="text" name="fullName" class="form-control"
                                       value=""
                                >
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label>Password</label>
                                <input type="password" name="password" class="form-control" value="">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label>Re_Password</label>
                                <input type="password" name="re_password" class="form-control"
                                       value=""
                                >
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" name="email" class="form-control" value="">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Phone</label>
                                <input type="text" name="phone" class="form-control" value="">
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <label>Gender: </label>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="gender" value="true">
                                <label class="form-check-label">
                                    Male
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="gender" value="false" checked>
                                <label class="form-check-label">
                                    FeMale
                                </label>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label>Role: </label>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="role" value="true">
                                <label class="form-check-label">
                                    Admin
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="role" value="false" checked>
                                <label class="form-check-label">
                                    Customer
                                </label>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <label>Trạng thái: </label>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="status" value="true">
                                <label class="form-check-label">
                                    Hoạt động
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="status" value="false" checked>
                                <label class="form-check-label">
                                    Khoá
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-check mt-4">
                        <button class="btn btn-primary" formaction="DashboardAdmin/storeA">Create</button>
                        <button class="btn btn-info" formaction="DashboardAdmin/reset">Reset</button>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<div class="card mb-4">
    <div class="row">
        <div class="col">
            <c:if test="${not empty message}">
                <div class="alert alert-success">${message}</div>

            </c:if>
            <c:if test="${not empty error}">
                <div class="alert alert-danger">${error}</div>
            </c:if>
        </div>
    </div>
    <div class="card-header">
        <i class="fas fa-table me-1"></i>
        DataTable Example
    </div>
    <div class="card-body">
        <table id="datatablesSimple">
            <thead>
            <tr>
                <th>ID</th>
                <th>Họ và Tên</th>
                <th>UserName</th>
                <th>email</th>
                <th>phone</th>
                <th>Gender</th>
                <th>Vai trò</th>
                <th>Trạng thái</th>
                <th>Date Create</th>
                <th>Ảnh</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tfoot>
            <tr>
                <th>ID</th>
                <th>Họ và Tên</th>
                <th>UserName</th>
                <th>email</th>
                <th>phone</th>
                <th>Gender</th>
                <th>Vai trò</th>
                <th>Date Create</th>
                <th>Trạng thái</th>
                <th>Ảnh</th>
                <th>Actions</th>
            </tr>
            </tfoot>
            <tbody>
            <c:forEach items="${account}" var="account">
                <tr>
                    <td>${account.id}</td>
                    <td>${account.fullName}</td>
                    <td>${account.username}</td>
                    <td>${account.email}</td>
                    <td>${account.phone}</td>
                    <td>
                            ${account.gender ? 'Nam' : 'Nữ'}
                    </td>
                    <td>
                            ${account.role ? 'Admin' : 'Customer'}
                    </td>
                    <td>
                            ${account.status ? 'Hoạt động' : 'Khoá'}
                    </td>
                    <td>
                        <fmt:formatDate value="${account.created}" pattern="dd-MM-yyy"/>
                    </td>
                    <td>
                        <img src="${account.avatar}" class="img-fluid" width="50px" alt="">
                    </td>
                    <td>
                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#exampleModal_edit${account.id}"
                        >
                            sửa
                        </button>
                        <!--Đây là modal xoá nhé-->
                        <form action="DashboardAdmin" method="post">
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                    data-bs-target="#exampleModal_delete${account.id}">
                                Xoá
                            </button>

                            <!-- Modal -->

                            <!-- Button trigger modal -->
                            <div class="modal fade" id="exampleModal_delete${account.id}" tabindex="-1"
                                 aria-labelledby="exampleModalLabel_delete${account.id}" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel_delete${account.id}">
                                                Bạn có muốn xoá không ?</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="text-center">
                                                <img src="${pageContext.servletContext.contextPath}/views/dashboardAdmin/component/are-you-sure-will-ferrel.gif"
                                                     alt="">
                                            </div>

                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary"
                                                    data-bs-dismiss="modal">
                                                Close
                                            </button>
                                                <%--                                                                                                    <a class="btn btn-danger" href="/Assignment_Java4_war/DashboardAdmin/delete?id=${product.id}" role="button">Xoá</a>--%>
                                            <button class="btn btn-danger"
                                                    formaction="DashboardAdmin/deleteA?id=${account.id}"
                                            >Xoá
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <!-- Hết rồi nhé-->
                    </td>
                </tr>
                <div class="modal fade" id="exampleModal_edit${account.id}" tabindex="-1"
                     aria-labelledby="exampleModalLabel_edit${account.id}" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel_edit${account.id}">CRUD_Account</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form action="DashboardAdmin" method="post">
                                    <div class="row">
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label>UserName</label>
                                                <input type="text" name="username" class="form-control"
                                                       value="${account.username}">
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label>Họ Tên</label>
                                                <input type="text" name="fullName" class="form-control"
                                                       value="${account.fullName}"
                                                >
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Email</label>
                                                <input type="email" name="email" class="form-control"
                                                       value="${account.email}">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Phone</label>
                                                <input type="text" name="phone" class="form-control"
                                                       value="${account.phone}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <label>Gender: </label>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="gender"
                                                       value="true" ${account.gender ? 'checked' : ''}>
                                                <label class="form-check-label">
                                                    Male
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="gender"
                                                       value="false" ${!account.gender ? 'checked' : ''}
                                                >
                                                <label class="form-check-label">
                                                    FeMale
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <label>Role: </label>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="role"
                                                       value="true" ${account.role ? 'checked' : ''}>
                                                <label class="form-check-label">
                                                    Admin
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="role"
                                                       value="false" ${!account.role ? 'checked' : ''}
                                                >
                                                <label class="form-check-label">
                                                    Customer
                                                </label>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <label>Trạng thái: </label>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="status"
                                                       value="true" ${account.status ? 'checked' : ''}>
                                                <label class="form-check-label">
                                                    Hoạt động
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="status"
                                                       value="false" ${!account.status ? 'checked' : ''}
                                                >
                                                <label class="form-check-label">
                                                    Khoá
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-check mt-4">
                                        <button class="btn btn-warning"
                                                formaction="DashboardAdmin/updateA?id=${account.id}">Update
                                        </button>
                                        <button class="btn btn-info" formaction="DashboardAdmin/reset">Reset
                                        </button>
                                    </div>
                                </form>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                    Close
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>


