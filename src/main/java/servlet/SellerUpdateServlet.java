package servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import bean.Sellers;
@WebServlet(urlPatterns = "/updateseller")
public class SellerUpdateServlet  extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException{
		
		MultipartRequest m = new MultipartRequest(req, "C:\\Users\\tanmo\\eclipse-workspace\\BookMarket\\src\\main\\webapp\\assets\\img");
		
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
			photopath="assets/img/"+photofile.getName();
		}
		
		
		Sellers s = new Sellers();
		
		s.setS_userid(Userid);
		s.setS_name(Name);
		s.setS_mob_no(Mobile);
		s.setS_address(Address);
		s.setS_password(Password);
		s.setS_photocopy(photopath);
		
		
		int response;
		
		RequestDispatcher rd = req.getRequestDispatcher("seller_profile.jsp");
		
		try {
			response = s.UpdateSeller();
			
			if(response == 1)
			  {
				
				 req.setAttribute("message", "Seller Details Updated,Please Refresh The Page.");
			  }
			  else
			  {
				  req.setAttribute("message", "Seller Details Not Updated.");
			  }
			rd.forward(req, resp);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
