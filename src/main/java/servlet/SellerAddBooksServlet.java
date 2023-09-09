package servlet;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import bean.Seller_Books;

@WebServlet(urlPatterns = "/addbook")
public class SellerAddBooksServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		MultipartRequest m = new MultipartRequest(req, "C:\\Users\\tanmo\\eclipse-workspace\\BookMarket\\src\\main\\webapp\\assets\\img");

		String book_name = m.getParameter("book_name");
		String arthur_name = m.getParameter("arthur_name");
		int book_price = Integer.parseInt(m.getParameter("book_price"));
		int book_stock = Integer.parseInt(m.getParameter("book_stock"));
		String s_userid = m.getParameter("userid");
		
		File photofile = m.getFile("photo");
		String photopath ="";
		
		if(photofile == null)
		{
			photopath="";
		}
		else
		{
			photopath="assets/img/"+photofile.getName();
		}
		
		Seller_Books sb = new Seller_Books();
		
		sb.setS_bookname(book_name);
		sb.setS_arthur(arthur_name);
		sb.setS_price(book_price);
		sb.setSeller_avl_stock(book_stock);
		sb.setS_book_photo(photopath);
		sb.setSeller_id(s_userid);
		
		int response;
		
		RequestDispatcher rd = req.getRequestDispatcher("seller_book.jsp");
		
		try {
			response = sb.AddBooks();
			
			if(response == 1)
			  {
				 req.setAttribute("message", "Book Added.");
				 			  }
			  else
			  {
				  req.setAttribute("message", "Somethis Wrong, Try Again");
			  }
			rd.forward(req, resp);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
