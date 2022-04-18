package Utils;

import entity.Users;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(
        filterName = "aut_filter",
        urlPatterns = {
                "/DashboardAdmin/*",
                "/DashboardAdminOrder/*"
        }
)
public class FilterUtils implements Filter {
    public FilterUtils() {
    }

    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpReq =
                (HttpServletRequest) request;
        HttpServletResponse httpRes =
                (HttpServletResponse) response;
        HttpSession session = httpReq.getSession();
        Users user = (Users) session.getAttribute("auth");

        if (user == null) {
            httpRes.sendRedirect("/ecommerce_Java4_war/LoginControl");
            return;
        }
        chain.doFilter(request, response);



    }
}
