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

import bean.Buyers;

@WebServlet(urlPatterns = "/updatebuyer")
public class BuyerUpdateServlet  extends HttpServlet{
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			MultipartRequest m = new MultipartRequest(req, "C:\\Users\\tanmo\\eclipse-workspace\\BookMarket\\src\\main\\webapp\\buyer\\images");
			
			String Userid =m.getParameter("userid");
			String Name = m.getParameter("name");
			String Mobile =m.getParameter("mobile");
			String Address = m.getParameter("address");
			String Password = m.getParameter("pass");
			
			File photofile = m.getFile("photo");
			String photopath ="";
			
			if(photofile == null)
			{
				photopath="";
			}
			else
			{
				photopath="buyer/images/"+photofile.getName();
			}
			
			Buyers b = new Buyers();
			
			b.setBuyer_userid(Userid);
			b.setBuyer_name(Name);
			b.setBuyer_mobile_no(Mobile);
			b.setBuyer_address(Address);
			b.setBuyer_password(Password);
			b.setBuyer_photograph(photopath);
			
			
			
			int response;
			
			RequestDispatcher rd = req.getRequestDispatcher("buyer_profile.jsp");
			
			try {
				response = b.UpdateBuyer();
				
				if(response == 1)
				  {
					
					 req.setAttribute("message", "Buyer Details Updated,Please Refresh The Page.");
				  }
				  else
				  {
					  req.setAttribute("message", "Buyer Details Not Updated.");
				  }
				rd.forward(req, resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}

