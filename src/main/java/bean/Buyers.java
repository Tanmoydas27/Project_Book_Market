package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Buyers {
	private String buyer_userid;
	private String buyer_name;
	private String buyer_mobile_no;
	private String buyer_address;
	private String buyer_password;
	private String buyer_photograph;
	public String getBuyer_userid() {
		return buyer_userid;
	}
	public void setBuyer_userid(String buyer_userid) {
		this.buyer_userid = buyer_userid;
	}
	public String getBuyer_name() {
		return buyer_name;
	}
	public void setBuyer_name(String buyer_name) {
		this.buyer_name = buyer_name;
	}
	public String getBuyer_mobile_no() {
		return buyer_mobile_no;
	}
	public void setBuyer_mobile_no(String buyer_mobile_no) {
		this.buyer_mobile_no = buyer_mobile_no;
	}
	public String getBuyer_address() {
		return buyer_address;
	}
	public void setBuyer_address(String buyer_address) {
		this.buyer_address = buyer_address;
	}
	public String getBuyer_password() {
		return buyer_password;
	}
	public void setBuyer_password(String buyer_password) {
		this.buyer_password = buyer_password;
	}
	public String getBuyer_photograph() {
		return buyer_photograph;
	}
	public void setBuyer_photograph(String buyer_photograph) {
		this.buyer_photograph = buyer_photograph;
	}
	
	public int BuyerRegistration() throws SQLException{
		
		Connection conn =DBConnect.connct();
		
		String sql ="insert into buyer_log (b_user_id,b_name,b_mobile_no,b_password) values(?,?,?,?)";
		
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, buyer_userid);
		ps.setString(2, buyer_name);
		ps.setString(3, buyer_mobile_no);
		ps.setString(4, buyer_password);
		
		int response = ps.executeUpdate();
		conn.close();
		
		return response;	
	}
	
	public static  boolean Login(String buyer_userid, String buyer_password )throws SQLException{
		
		boolean response = false; 
		try {
				Connection conn = DBConnect.connct();
				
				String sql = "select *from buyer_log where b_user_id = ? and b_password = ?";
				
				PreparedStatement ps = conn.prepareStatement(sql);
				
				ps.setString(1,buyer_userid );
				ps.setString(2,buyer_password);
				
				ResultSet rs =ps.executeQuery();
				response = rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return response;		
	}
	
	public int UpdateBuyer() throws SQLException
	{
		Connection conn =DBConnect.connct();
		
		String sql = "";
		PreparedStatement ps;
		
		if(buyer_photograph == null  || buyer_photograph == "")
		{
			 sql = "update buyer_log set b_name=?, b_mobile_no=?,b_address =?,b_password=? where b_user_id = ?";
			 ps = conn.prepareStatement(sql);
			    
		    
		    ps.setString(1, buyer_name);		
			ps.setString(2, buyer_mobile_no);
			ps.setString(3, buyer_address);
			ps.setString(4, buyer_password);
			ps.setString(5, buyer_userid);	
		}
		else
		{
			
			
			sql = "update buyer_log set b_name=?, b_mobile_no=?,b_address =?,b_password=?,b_photograph=? where b_user_id = ?";
			ps = conn.prepareStatement(sql);
			    
		    
		    ps.setString(1, buyer_name);		
			ps.setString(2, buyer_mobile_no);
			ps.setString(3, buyer_address);
			ps.setString(4, buyer_password);
			ps.setString(5, buyer_photograph);
			ps.setString(6, buyer_userid);
	}
		
		int response = ps.executeUpdate();
		conn.close();
		
		return response;
	}
	
	public ArrayList<Buyers> getAllBuyersDetails() throws SQLException
	{
		Connection conn = DBConnect.connct();
		
		String sql = "select *from buyer_log";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		
		ArrayList<Buyers> allBuyer = new ArrayList<>();
		
		while(rs.next())
		{
			Buyers b = new Buyers();
			
			b.setBuyer_userid(rs.getString("b_user_id"));
			b.setBuyer_name(rs.getString("b_name"));
			b.setBuyer_mobile_no(rs.getString("b_mobile_no"));
			b.setBuyer_address(rs.getString("b_address"));
			b.setBuyer_password(rs.getString("b_password"));
			b.setBuyer_photograph(rs.getString("b_photograph"));
			
			allBuyer.add(b);
		}
		conn.close();
		
		return allBuyer;
	}
	
	public Buyers getBuyerById() throws SQLException{
		Connection conn = DBConnect.connct();
		
		String sql = "select *from buyer_log where b_user_id =?";
		
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, buyer_userid);
		
		ResultSet rs = ps.executeQuery();
		
		Buyers b = new Buyers();
		while(rs.next())
		{
			b.setBuyer_userid(rs.getString("b_user_id"));
			b.setBuyer_name(rs.getString("b_name"));
			b.setBuyer_mobile_no(rs.getString("b_mobile_no"));
			b.setBuyer_address(rs.getString("b_address"));
			b.setBuyer_password(rs.getString("b_password"));
			b.setBuyer_photograph(rs.getString("b_photograph"));
		}
		conn.close();
		return b;
	}
	
	public int UpdateFullAddress() throws SQLException{
		Connection conn = DBConnect.connct();
		
		String sql ="update buyer_log set b_address=? where b_user_id =?";
		
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1,buyer_address);
		ps.setString(2, buyer_userid);
		
		int response = ps.executeUpdate();
		
		return response;
	}
	
}
