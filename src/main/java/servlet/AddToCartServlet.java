package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.AddToCart;
import bean.Seller_Books;

@WebServlet(urlPatterns = "/addtocart")
public class AddToCartServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String buyer_id = (String) session.getAttribute("buyer_userid");
		
		PrintWriter out = resp.getWriter();
		int response;
		try {
			if(buyer_id == null)
			{
				response =4;
				out.print(response);
			}
			else 
			{
				
				int book_id = Integer.parseInt(req.getParameter("book_id"));
				
				Seller_Books sb = new Seller_Books();
				sb.setS_bookid(book_id);
				Seller_Books details =sb.getBooksById();
				
				int avl_stock=details.getSeller_avl_stock();
				
				
				if(avl_stock >= 1)
				{
					AddToCart atc = new AddToCart();
					
					
					atc.setBook_id(book_id);
					atc.setBuyer_id(buyer_id);
					
					
					
					try {
						
						
						int check = atc.CartItemSearch();
						
						if(check == 1)
						{
							response =2;
							out.print(response);
						}
						else
						{
							
							response = atc.addToCart();
							
							if(response == 1)
							{
								
								out.print(response);
							}
						}
						
					}catch (Exception e) {
						// TODO: handle exception
					}
				}
				else
				{
					response = 3;
					out.print(response);
				}
			}			
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		
	}

}
