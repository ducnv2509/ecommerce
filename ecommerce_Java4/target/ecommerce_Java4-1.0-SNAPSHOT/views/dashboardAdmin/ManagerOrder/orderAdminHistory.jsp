<%@ page import="entity.Users" %>
<%@ page import="DAO.AccountDAO" %>
<%@ page import="DAO.StatusOrderDAO" %>
<%@ page import="entity.FlowStatus" %>
<%@ page import="java.util.List" %>
<%@ page import="Utils.SaveLogin" %><%--
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
    List<FlowStatus> list = statusOrderDAO.historyOrderByAdmin(users.getId());

%>
<div class="card-header">
    <i class="fas fa-table me-1"></i>
    DataTable Example
</div>
<div class="card-body">
    <form action="DashboardAdminOrder" method="post">
        <table id="datatablesSimple">
            <thead>
            <tr>
                <th>ID_Order</th>
                <th>NameCustomer</th>
                <th>ImageProduct</th>
                <th>nameProduct</th>
                <th>size</th>
                <th>color</th>
                <th>quantity</th>
                <th>price</th>
                <th>total</th>
                <th>status</th>
                <th>Create By</th>
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
                <td>
                    <%
                        if (f.getStatus() == 2) {
                            out.print("Đã xác nhận");
                        } else if (f.getStatus() == 3) {
                            out.print("Hoàn Tất");
                        } else if (f.getStatus() == 4) {
                            out.print("Huỷ");
                        }
                    %>
                </td>
                <td>
                    <%
                        if (SaveLogin.isLogin()) {
                            out.print(SaveLogin.user.getFullName());
                        } else {
                            out.print("coming soon");
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