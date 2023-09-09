package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Buyers;

@WebServlet(urlPatterns = "/buyer_registration")
public class BuyerRegistrationServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		String buyer_userid = req.getParameter("b_userid");
		String buyer_name =req.getParameter("b_name");
		String buyer_mob_no = req.getParameter("b_mobile");
		String buyer_password = req.getParameter("b_password");
		
		
		
		Buyers b = new Buyers();
		
		b.setBuyer_userid(buyer_userid);
		b.setBuyer_name(buyer_name);
		b.setBuyer_mobile_no(buyer_mob_no);
		b.setBuyer_password(buyer_password);
		
		try {
			int response = b.BuyerRegistration();
			
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
