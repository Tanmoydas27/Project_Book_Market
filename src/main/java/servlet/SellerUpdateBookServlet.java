package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Seller_Books;

@WebServlet(urlPatterns = "/updatebook")
public class SellerUpdateBookServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)throws ServletException,IOException{
		int BookId = Integer.parseInt(req.getParameter("book_id"));
		String BookName = req.getParameter("book_name");
		String ArthurName = req.getParameter("arthur_name");
		int BookPrice = Integer.parseInt(req.getParameter("b_price"));
		int Bookstock = Integer.parseInt(req.getParameter("b_avl_stock"));
		
		Seller_Books sb = new Seller_Books();
		
		sb.setS_bookid(BookId);
		sb.setS_bookname(BookName);
		sb.setS_arthur(ArthurName);
		sb.setS_price(BookPrice);
		sb.setSeller_avl_stock(Bookstock);
		
		int response;
		RequestDispatcher rd = req.getRequestDispatcher("seller_book.jsp");
		try {
			response = sb.UpdateBooks();
			
			if(response == 1)
			  {
				
				 req.setAttribute("message", "Book Details Updated.");
			  }
			  else
			  {
				  req.setAttribute("message", "Book Details Not Updated.");
			  }
			rd.forward(req, resp);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
