package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Sellers;

@WebServlet(urlPatterns = "/seller_signup")
public class SellerSignUpServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		String userid = req.getParameter("username");
		String seller_name =req.getParameter("s_name");
		String seller_mob_no = req.getParameter("s_mobile");
		String seller_address = req.getParameter("s_address");
		String seller_password = req.getParameter("password");
		
		
		
		Sellers s = new Sellers();
		s.setS_userid(userid);
		s.setS_name(seller_name);
		s.setS_mob_no(seller_mob_no);
		s.setS_address(seller_address);
		s.setS_password(seller_password);
		
		try {
			int response = s.RegisterSeller();
			
			PrintWriter out = resp.getWriter();
			
			if(response == 1)
			{
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
