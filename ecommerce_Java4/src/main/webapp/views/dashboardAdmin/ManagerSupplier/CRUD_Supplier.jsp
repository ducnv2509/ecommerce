<%--
  Created by IntelliJ IDEA.
  User: ducit
  Date: 3/27/2022
  Time: 9:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="DashboardAdmin" method="post">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Tên Nhà cung Cấp</label>
                                <label>
                                    <input type="text" name="nameSupplier" class="form-control">
                                </label>
                            </div>

                        </div>
                        <div class="col-md-4">

                            <div class="form-group">
                                <label>PHone cung Cấp</label>
                                <label>
                                    <input type="text" name="phone" class="form-control">
                                </label>
                            </div>

                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Address cung Cấp</label>
                                <label>
                                    <input type="text" name="address" class="form-control">
                                </label>
                            </div>

                        </div>

                    </div>
                    <div class="form-check mt-4">
                        <button class="btn btn-primary" formaction="DashboardAdmin/storeS">Create</button>
                        <button class="btn btn-info">Reset</button>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
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
                <th>Tên Nhà cung cấp</th>
                <th>Phone</th>
                <th>Address</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tfoot>
            <tr>
                <th>ID</th>
                <th>Tên Nhà cung cấp</th>
                <th>Phone</th>
                <th>Address</th>
                <th>Actions</th>
            </tr>
            </tfoot>
            <tbody>
            <c:forEach items="${supplier}" var="supplier">
                <tr>
                    <td>${supplier.id}</td>
                    <td>${supplier.nameSupplier}</td>
                    <td>${supplier.phone}</td>
                    <td>${supplier.address}</td>
                    <td>
                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#exampleModal_edit${supplier.id}"
                        >
                            sửa
                        </button>
                        <!--Đây là modal xoá nhé-->
                        <form action="DashboardAdmin" method="post">
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                    data-bs-target="#exampleModal_delete${supplier.id}">
                                Xoá
                            </button>

                            <!-- Modal -->

                            <!-- Button trigger modal -->
                            <div class="modal fade" id="exampleModal_delete${supplier.id}" tabindex="-1"
                                 aria-labelledby="exampleModalLabel_delete${supplier.id}" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel_delete${supplier.id}">
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
                                                    formaction="DashboardAdmin/deleteS?id=${supplier.id}"
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
                <div class="modal fade" id="exampleModal_edit${supplier.id}" tabindex="-1"
                     aria-labelledby="exampleModalLabel_edit${supplier.id}" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel_edit${supplier.id}">Modal
                                    title</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form action="DashboardAdmin" method="post">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Tên Nhà cung Cấp</label>
                                                <label>
                                                    <input type="text" name="nameSupplier" class="form-control"
                                                           value="${supplier.nameSupplier}"
                                                    >
                                                </label>
                                            </div>

                                        </div>
                                        <div class="col-md-4">

                                            <div class="form-group">
                                                <label>PHone cung Cấp</label>
                                                <label>
                                                    <input type="text" name="phone" class="form-control"
                                                           value="${supplier.phone}"
                                                    >
                                                </label>
                                            </div>

                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Address cung Cấp</label>
                                                <label>
                                                    <input type="text" name="address" class="form-control"
                                                           value="${supplier.address}"
                                                    >
                                                </label>
                                            </div>

                                        </div>

                                    </div>
                                    <div class="form-check mt-4">
                                        <button class="btn btn-warning"
                                                formaction="DashboardAdmin/updateS?id=${supplier.id}">Update
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
                                <button type="button" class="btn btn-primary">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>


