package ShareAndLike;

import DAO.ShareDAO;
import Utils.Email;
import Utils.EmailUtils;
import entity.Share;
import entity.Users;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Date;

@WebServlet(name = "ShareServlet", value = "/ShareServlet")
public class ShareServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        if (id == null) {
            response.sendRedirect("/ecommerce_Java4_war/HomePage");
            return;
        }

        request.setAttribute("id", id);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String emailAddress = request.getParameter("email");
            String p_id = request.getParameter("id");

            if (p_id == null) {
                request.setAttribute("error", "Video id is null");
            } else {
                HttpSession session = request.getSession();
                Users usersSes = (Users) session.getAttribute("auth");
                Email email = new Email();
                email.setFrom("ducit2509@gmail.com");
                email.setFromPassword("nguyenvanduc");
                email.setTo(emailAddress);
                email.setSubject("Share Favorite video");
                StringBuilder sb = new StringBuilder();
                sb.append("Dear Ms.Mr. </br>");
                sb.append("The video is more interesting and I want to share with tou. <br>");
                sb.append("Please click the link ").append(String.format("<a href = ''>View Product </a> </br>", p_id));
                sb.append("Administrator");
                email.setContent(sb.toString());
                EmailUtils.send(email);
                ShareDAO dao = new ShareDAO();
                Share share= new Share();
                share.setEmail(emailAddress);
                share.setShareDate(new Date());
                share.setUserId(usersSes.getId());


                request.setAttribute("message", "Product link been sent");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", e.getMessage());
            throw e;
        }
    }
}
