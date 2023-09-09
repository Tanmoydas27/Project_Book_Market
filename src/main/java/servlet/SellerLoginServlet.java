package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Sellers;

@WebServlet(urlPatterns = "/seller_login")
public class SellerLoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		String UserId =req.getParameter("email");
		String Password = req.getParameter("password");
		
		PrintWriter out = resp.getWriter();
		
		try {
			if(Sellers.Login(UserId, Password) == true)
			{
				HttpSession httpSession = req.getSession();
				httpSession.setAttribute("userid", UserId);
				
				out.print("1");
			}
			else
			{
				out.print("0");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
