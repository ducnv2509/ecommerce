<%@ page import="entity.Users" %>
<%@ page import="DAO.AccountDAO" %>
<%@ page import="DAO.StatusOrderDAO" %>
<%@ page import="entity.FlowStatus" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: ducit
  Date: 4/7/2022
  Time: 10:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="DashboardAdmin" value="/DashboardAdmin"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Users users = (Users) session.getAttribute("auth");
    AccountDAO accountDAO = new AccountDAO();
    StatusOrderDAO statusOrderDAO = new StatusOrderDAO();
    List<FlowStatus> list = statusOrderDAO.ListStatus1();
%>
<div class="card-header">
    <i class="fas fa-table me-1"></i>
    DataTable Example
</div>
<div class="card-body">
    <form action="DashboardAdminOrder" method="post">
        <div class="row">
            <div class="col-4">
                <input class="form-check-input" id="selectAll" type="checkbox" name="selectAll"
                > Check ALL
            </div>
            <div class="col-4">
                <select name="statusState" class="form-select" aria-label="Default select example">
                    <c:forEach var="i" items="${li}">
                        <option value="${i.id}">${i.nameStates}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-4">
                <button class="btn btn-primary"
                        formaction="DashboardAdminOrder/update"
                >
                    Set
                </button>
            </div>
        </div>


        <table id="datatablesSimple">
            <thead>
            <tr>
                <th>

                    CHECK
                </th>
                <th>ID_Order</th>
                <th>NameCustomer</th>
                <th>ImageProduct</th>
                <th>nameProduct</th>
                <th>size</th>
                <th>color</th>
                <th>quantity</th>
                <th>price</th>
                <th>total</th>
                <th>Date Order</th>
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
                <td>
                    <input class="form-check-input checkboxAll" type="checkbox" id="inlineCheckbox1" name="o_id"
                           value="<%=f.getO_id()%>">
                </td>
                <td><%= f.getO_id() %>
                    <%--                    <input type="hidden" value="<%= f.getO_id() %>" name="idD">--%>
                </td>
                <td>
                    <%=
                    f.getNameCustomer()
                    %>
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
                <td><%=
                f.getOrder_Date()
                %>
                </td>
                <td>
                    <%
                        if (f.getStatus() == 1) {
                            out.print("Chờ xác nhận");
                        } else if (f.getStatus() == 2) {
                            out.print("Chờ lấy hàng");
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
    </form>

</div>

<script>
    $(document).ready(function () {
        $("#selectAll").click(function () {
            if (this.checked) {
                $('.checkboxAll').each(function () {
                    $(".checkboxAll").prop('checked', true);
                })
            } else {
                $('.checkboxAll').each(function () {
                    $(".checkboxAll").prop('checked', false);
                })
            }
        });
    });
</script>