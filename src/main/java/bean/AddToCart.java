package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AddToCart {
	private int book_id;
	private int cart_id;
	private String buyer_id ;
	private int stock;
	private String buyer_address;
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public String getBuyer_id() {
		return buyer_id;
	}
	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getBuyer_address() {
		return buyer_address;
	}
	public void setBuyer_address(String buyer_address) {
		this.buyer_address = buyer_address;
	}
	
	
	public int addToCart() throws SQLException{
		Connection conn = DBConnect.connct();
		
		String sql = "insert into cart_details (book_id,buyer_id) values(?,?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setInt(1, book_id);
		ps.setString(2, buyer_id);
		
		int response = ps.executeUpdate();
		conn.close();
		
		return response;
		
	}
	public int UpdateCart() throws SQLException{
		Connection conn = DBConnect.connct();
		
		String sql =  "update cart_details set stock =? where buyer_id=? and cart_id =? ";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setInt(1, stock);
		ps.setString(2, buyer_id);
		ps.setInt(3, cart_id);
		
		int response = ps.executeUpdate();
		
		return response;
	}
	
	public int DeleteCart() throws SQLException{
		Connection conn =  DBConnect.connct();
		
		String sql = "delete from cart_details where cart_id =?";
		
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setInt(1, cart_id);
		
		int response = ps.executeUpdate();
		return response;
		
	}
	public ArrayList<AddToCart> getAllCartBookDetails() throws SQLException
	{
		Connection conn = DBConnect.connct();
		
		String sql = "select *from cart_details where buyer_id =?";
		
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, buyer_id);
		ResultSet rs = ps.executeQuery();
		
		ArrayList<AddToCart> allcart = new ArrayList<>();
		
		while(rs.next())
		{
			AddToCart act = new AddToCart();
			
			act.setBook_id(rs.getInt("book_id"));
			act.setBuyer_id(rs.getString("buyer_id"));
			act.setCart_id(rs.getInt("cart_id"));
			act.setStock(rs.getInt("stock"));
			
			allcart.add(act);
		}
		conn.close();
		
		return allcart;
	}
	
	public int CartItemSearch() throws SQLException{
		Connection conn = DBConnect.connct();
		
		String sql = "select *from cart_details where buyer_id =? and book_id=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, buyer_id);
		ps.setInt(2, book_id);
		
		
		ResultSet rs = ps.executeQuery();
		
		if(rs.next())
		{
			return 1;
		}
		else
			return 0;
	}

	
}
