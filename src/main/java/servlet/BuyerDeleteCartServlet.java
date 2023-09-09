package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.AddToCart;

@WebServlet(urlPatterns = "/deletecart")
public class BuyerDeleteCartServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int Cart_id = Integer.parseInt(req.getParameter("cart_id"));
		
		AddToCart atc = new AddToCart();
		atc.setCart_id(Cart_id);
		
		int response;
		
		PrintWriter out = resp.getWriter();
		
		try {
			response = atc.DeleteCart();
			if(response == 1)
			{
				
				out.print("Data Deleted Successfully");
			}
			else
			{
				out.print("Data Not Deleted");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
