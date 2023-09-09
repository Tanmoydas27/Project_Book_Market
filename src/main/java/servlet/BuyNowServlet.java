package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;

import bean.AddToCart;
import bean.Buyers;
import bean.Orders;
import bean.Seller_Books;

@WebServlet(urlPatterns = "/buynow")
public class BuyNowServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String buyer_id = (String) session.getAttribute("buyer_userid");
		
		String trans_id =req.getParameter("trans_id");
		int total = Integer.parseInt(req.getParameter("total"));
		
		
		AddToCart atc = new AddToCart();
		atc.setBuyer_id(buyer_id);
		
		try {
			ArrayList<AddToCart> cart_details = atc.getAllCartBookDetails();
			int noofproducts = cart_details.size();
			
			//Add data in Order table 
			Orders ord = new Orders();
			ord.setBuyer_id(buyer_id);
			ord.setTotal(total);
			ord.setNo_of_products(noofproducts);
			ord.setTrans_id(trans_id);
			
			int orderid = ord.addToOrders();
			
			
			//get Orderid of current created
			int count=0;
			
			for(AddToCart ac : cart_details)
			{
				int cart_id=ac.getCart_id();
				int book_id=ac.getBook_id();
				
				//Get Book Price by book Id
				Seller_Books sb = new Seller_Books();
				sb.setS_bookid(book_id);
				
				Seller_Books details = sb.getBooksById();
				int price = details.getS_price();	
				
				int quantity = ac.getStock();
				
				//
				Orders or = new Orders();
				or.setOrder_id(orderid);
				or.setBook_id(book_id);
				or.setPrice(price);
				or.setQuantity(quantity);
				
				int response = or.addToOrderDetails();
				if(response == 1)
				{
					//delete By Cart Id
					AddToCart carts = new AddToCart();
					carts.setCart_id(cart_id);
					int  delete = carts.DeleteCart();
					count++;
					
					//update Quantity
					
					
					int order_qty=quantity;
					int stock= details.getSeller_avl_stock();
					int avl_stock=stock-order_qty;
					int s_book_id = details.getS_bookid();
					
					Seller_Books sellerBooks=new Seller_Books();
					sellerBooks.setS_bookid(s_book_id);
					sellerBooks.setSeller_avl_stock(avl_stock);
					int update_stock = sellerBooks.UpdateAvlStock();	
				}
				
			}
			
			PrintWriter out = resp.getWriter();
			if(noofproducts == count)
			{
				out.print("order_placed Successfully");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
