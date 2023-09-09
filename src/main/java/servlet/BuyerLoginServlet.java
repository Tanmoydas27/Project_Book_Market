package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Buyers;

@WebServlet(urlPatterns = "/buyer_login")
public class BuyerLoginServlet  extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String BuyerUsername = req.getParameter("b_email");
		String BuyerPassword = req.getParameter("b_password");
		
		PrintWriter out= resp.getWriter();
		
		try {
			if(Buyers.Login(BuyerUsername, BuyerPassword)== true)
			{
				HttpSession httpSession = req.getSession();
				httpSession.setAttribute("buyer_userid", BuyerUsername);
				
				out.print("1");
			}
			else
			{
				out.print("0");
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		
		
	}
}
