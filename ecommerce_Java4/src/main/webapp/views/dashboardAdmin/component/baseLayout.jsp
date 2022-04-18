<%--
  Created by IntelliJ IDEA.
  User: ducit
  Date: 3/27/2022
  Time: 10:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <div class="col-xl-3 col-md-6">
        <div class="card bg-primary text-white mb-4">
            <div class="card-body">Primary Card</div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <a class="small text-white stretched-link" href="#">View Details</a>
                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6">
        <div class="card bg-warning text-white mb-4">
            <div class="card-body">Warning Card</div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <a class="small text-white stretched-link" href="#">View Details</a>
                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6">
        <div class="card bg-success text-white mb-4">
            <div class="card-body">Success Card</div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <a class="small text-white stretched-link" href="#">View Details</a>
                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6">
        <div class="card bg-danger text-white mb-4">
            <div class="card-body">Danger Card</div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <a class="small text-white stretched-link" href="#">View Details</a>
                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-xl-6">
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-chart-area me-1"></i>
                Area Chart Example
            </div>
            <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
        </div>
    </div>
    <div class="col-xl-6">
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-chart-bar me-1"></i>
                Bar Chart Example
            </div>
            <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
        </div>
    </div>
</div>
<div class="card mb-4">
    <div class="card-header">
        <i class="fas fa-table me-1"></i>
        DataTable Example
    </div>
    <div class="card-body">
        <table id="datatablesSimple">
            <thead>
            <tr>
                <th>ID</th>
                <th>Tên sản phẩm</th>
                <th>Số lượng</th>
                <th>Đơn Giá</th>
                <th>Màu</th>
                <th>Size</th>
                <th>Ảnh</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tfoot>
            <tr>
                <th>ID</th>
                <th>Tên sản phẩm</th>
                <th>Số lượng</th>
                <th>Đơn Giá</th>
                <th>Màu</th>
                <th>Size</th>
                <th>Ảnh</th>
                <th>Actions</th>
            </tr>
            </tfoot>
            <tbody>
            <c:forEach items="${product}" var="product">
                <tr>
                    <td>${product.id}</td>
                    <td>${product.nameProduct}</td>
                    <td>${product.quantity}</td>
                    <td>${product.price}</td>
                    <td>${product.color}</td>
                    <td>${product.size}</td>
                    <td>
                        <img src="${product.imageProduct}"  class="img-fluid" width="50px" alt="">
                    </td>
                    <td>
                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#exampleModal_edit${product.id}"
                        >
                            sửa
                        </button>
                        <!--Đây là modal xoá nhé-->
                        <form action="DashboardAdmin" method="post" enctype="multipart/form-data">
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                    data-bs-target="#exampleModal_delete${product.id}">
                                Xoá
                            </button>

                            <!-- Modal -->

                            <!-- Button trigger modal -->
                            <div class="modal fade" id="exampleModal_delete${product.id}" tabindex="-1"
                                 aria-labelledby="exampleModalLabel_delete${product.id}" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel_delete${product.id}">
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
                                                    formaction="DashboardAdmin/deleteP?id=${product.id}"
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
                <div class="modal fade" id="exampleModal_edit${product.id}" tabindex="-1"
                     aria-labelledby="exampleModalLabel_edit${product.id}" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel_edit${product.id}">CRUD_Products</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form action="DashboardAdmin" method="post" enctype="multipart/form-data">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Chủng loại</label>
                                                <select name="category_id" class="form-select"
                                                        aria-label="Default select example">
                                                    <c:forEach var="i" items="${category}">
                                                        <c:if test="${i.id == product.categoryByCategoryId.id}">
                                                            <option value="${i.id}"
                                                                    selected>${i.nameCategory}</option>
                                                        </c:if>
                                                        <c:if test="${i.id != product.categoryByCategoryId.id}">
                                                            <option value="${i.id}"
                                                            >${i.nameCategory}</option>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Nhà cung cấp</label>
                                                <select name="supplier_id" class="form-select"
                                                        aria-label="Default select example">
                                                    <c:forEach var="i" items="${supplier}">
                                                        <c:if test="${i.id == product.supplierBySupplierId.id}">
                                                            <option value="${i.id}"
                                                                    selected>${i.nameSupplier}</option>
                                                        </c:if>
                                                        <c:if test="${i.id != product.supplierBySupplierId.id}">
                                                            <option value="${i.id}"
                                                            >${i.nameSupplier}</option>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label>Tên sản phẩm</label>
                                                <input type="text" name="nameProduct" class="form-control"
                                                       value="${product.nameProduct}">
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label>Số lượng</label>
                                                <input type="number" min="1" name="quantity"
                                                       class="form-control"
                                                       value="${product.quantity}"
                                                >
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Đơn Giá</label>
                                                <input type="number" min="100" name="price"
                                                       class="form-control" value="${product.price}">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Màu</label>
                                                <input type="text" name="color" class="form-control"
                                                       value="${product.color}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Size</label>
                                                <input type="text" name="size" class="form-control"
                                                       value="${product.size}">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Mô tả chi tiết</label>
                                                <textarea name="description" class="form-control"
                                                          id="exampleFormControlTextarea1"
                                                          rows="3">${product.description}</textarea>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="formFile">Image</label>
                                                <input class="form-control" id="formFile" type="file"
                                                       name="imageProduct" value="${product.imageProduct}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-check mt-4">
                                        <button class="btn btn-warning"
                                                formaction="DashboardAdmin/updateP?id=${product.id}">Update
                                        </button>
                                        <button class="btn btn-info">Reset
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