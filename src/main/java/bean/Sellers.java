package bean;

import java.sql.SQLException;
import java.util.ArrayList;
import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Sellers {
	private String s_userid;
	private String s_name;
	private String s_mob_no;
	private  String s_password;
	private String s_photocopy;
	private String s_address;
	
	public String getS_userid() {
		return s_userid;
	}
	public void setS_userid(String userid) {
		this.s_userid = userid;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getS_mob_no() {
		return s_mob_no;
	}
	public void setS_mob_no(String s_mob_no) {
		this.s_mob_no = s_mob_no;
	}
	public String getS_password() {
		return s_password;
	}
	public void setS_password(String s_password) {
		this.s_password = s_password;
	}
	public String getS_photocopy() {
		return s_photocopy;
	}
	public void setS_photocopy(String s_photocopy) {
		this.s_photocopy = s_photocopy;
	}
	public String getS_address() {
		return s_address;
	}
	public void setS_address(String s_address) {
		this.s_address = s_address;
	}
	//REGISTER SELLER 
	public int RegisterSeller() throws SQLException{
		Connection conn = DBConnect.connct();
		
		String sql="";
		PreparedStatement ps;
	
		sql = "insert into seller_log (s_userid,s_name,s_mobileno,s_address,s_password)values(?,?,?,?,?)";
		ps = conn.prepareStatement(sql);
		
		ps.setString(1, s_userid);
		ps.setString(2, s_name);
		ps.setString(3, s_mob_no);
		ps.setString(4, s_address);
		ps.setString(5, s_password);
			
		
		
		
		int response = ps.executeUpdate();
		conn.close();
		
		return response;
	}
	// SELLER LOGIN
	public static  boolean Login(String s_userid, String s_password )throws SQLException{
		
		boolean response = false; 
		try {
				Connection conn = DBConnect.connct();
				
				String sql = "select *from seller_log where s_userid = ? and s_password = ?";
				
				PreparedStatement ps = conn.prepareStatement(sql);
				
				ps.setString(1, s_userid);
				ps.setString(2, s_password);
				
				ResultSet rs =ps.executeQuery();
				response = rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return response;		
	}
	
	//SELLER UPDATE
	
	public int UpdateSeller() throws SQLException
	{
		Connection conn =DBConnect.connct();
		
		String sql = "";
		PreparedStatement ps;
		
		if(s_photocopy == null )
		{
			 sql = "update seller_log set s_name=?, s_mobileno=?,s_address =?,s_password=? where s_userid = ?";
			 ps = conn.prepareStatement(sql);
			    
		    
		    ps.setString(1, s_name);		
			ps.setString(2, s_mob_no);
			ps.setString(3, s_address);
			ps.setString(4, s_password);
			ps.setString(5, s_userid);	
		}
		else
		{
			
			
			sql = "update seller_log set s_name=?, s_mobileno=?,s_address =?,s_password=?,s_photocopy=? where s_userid = ?";
			ps = conn.prepareStatement(sql);
			    
		    
		    ps.setString(1, s_name);		
			ps.setString(2, s_mob_no);
			ps.setString(3, s_address);
			ps.setString(4, s_password);
			ps.setString(5, s_photocopy);
			ps.setString(6, s_userid);
	}
		
		int response = ps.executeUpdate();
		conn.close();
		
		return response;
	}
	
	//Delete Seller Profile
	
	public int deleteSeller() throws SQLException
	{
		Connection conn = DBConnect.connct();
		
		String sql = "delete from seller_log where s_userid =?";
		
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, s_userid);
		
		int response = ps.executeUpdate();
		
		if(response == 1)
		{
			File pp= new File(s_photocopy);
			pp.delete();
			
		}
		
		conn.close();
		
		return response;
		
	}
	
	//GET All SELLER Details
	
	public ArrayList<Sellers> getAllSellersDetails() throws SQLException
	{
		Connection conn = DBConnect.connct();
		
		String sql = "select *from seller_log";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		
		ArrayList<Sellers> allSeller = new ArrayList<>();
		
		while(rs.next())
		{
			Sellers s = new Sellers();
			
			s.setS_userid(rs.getString("s_userid"));
			s.setS_name(rs.getString("s_name"));
			s.setS_mob_no(rs.getString("s_mobileno"));
			s.setS_password(rs.getString("s_password"));
			s.setS_photocopy(rs.getString("s_photocopy"));	
			
			allSeller.add(s);
		}
		conn.close();
		
		return allSeller;
	}
	
	//GET SELLER BY ID
	
	public Sellers getSellerById() throws SQLException
	{
		Connection conn = DBConnect.connct();
		
		String sql = "select *from seller_log where s_userid=?";
		
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, s_userid);
		
		ResultSet rs = ps.executeQuery();
		
		Sellers s = new Sellers();
		
		while(rs.next())
		{
			s.setS_userid(rs.getString("s_userid"));
			s.setS_name(rs.getString("s_name"));
			s.setS_mob_no(rs.getString("s_mobileno"));
			s.setS_address(rs.getString("s_address"));
			s.setS_password(rs.getString("s_password"));
			s.setS_photocopy(rs.getString("s_photocopy"));
		}
		conn.close();
		return s;
	}
}
