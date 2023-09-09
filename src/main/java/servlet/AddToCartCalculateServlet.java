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

import bean.AddToCart;

@WebServlet(urlPatterns = "/calculatecart")
public class AddToCartCalculateServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String buyer_id = (String) session.getAttribute("buyer_userid");
		
		int stock =Integer.parseInt(req.getParameter("stock"));
		int cart_id = Integer.parseInt(req.getParameter("cart_id"));
		
		
		AddToCart atc = new AddToCart();
		atc.setBuyer_id(buyer_id);
		atc.setStock(stock);
		atc.setCart_id(cart_id);
		
		PrintWriter out = resp.getWriter();
		int response;
		
		try {
			response = atc.UpdateCart();
			if(response ==1)
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
