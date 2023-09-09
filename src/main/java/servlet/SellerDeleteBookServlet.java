package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Seller_Books;

@WebServlet(urlPatterns = "/deletebook")
public class SellerDeleteBookServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException
	{
		int Book_id = Integer.parseInt(req.getParameter("book_id"));
		System.out.println(Book_id);
		
		Seller_Books sb = new Seller_Books();
		
		sb.setS_bookid(Book_id);
		
		int response;
		PrintWriter out =resp.getWriter();
		
		
		
		try {
			response = sb.DeleteBooks();
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
