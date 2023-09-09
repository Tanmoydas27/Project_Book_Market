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

@WebServlet(urlPatterns = "/confirmAddress")
public class BuyerConfirmAddressServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String buyer_id = (String) session.getAttribute("buyer_userid");
		
		String address = req.getParameter("address");
		
		Buyers b = new Buyers();
		b.setBuyer_userid(buyer_id);
		b.setBuyer_address(address);
		
		PrintWriter out = resp.getWriter();
		int response;
		
		try {
			response = b.UpdateFullAddress();
			
			if(response == 1)
			{
				out.print(true);
			}
			else
			{
				out.print(false);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
