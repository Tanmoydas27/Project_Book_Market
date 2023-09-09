package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Seller_Books {
	private int s_bookid;
	private String s_bookname;
	private String s_arthur;
	private int s_price;
	private String s_book_photo;
	private String seller_id;
	private int seller_avl_stock;
	
	public int getSeller_avl_stock() {
		return seller_avl_stock;
	}
	public void setSeller_avl_stock(int seller_avl_stock) {
		this.seller_avl_stock = seller_avl_stock;
	}
	public int getS_bookid() {
		return s_bookid;
	}
	public void setS_bookid(int s_bookid) {
		this.s_bookid = s_bookid;
	}
	public String getS_bookname() {
		return s_bookname;
	}
	public void setS_bookname(String s_bookname) {
		this.s_bookname = s_bookname;
	}
	public String getS_arthur() {
		return s_arthur;
	}
	public void setS_arthur(String s_arthur) {
		this.s_arthur = s_arthur;
	}
	public int getS_price() {
		return s_price;
	}
	public void setS_price(int s_price) {
		this.s_price = s_price;
	}
	public String getS_book_photo() {
		return s_book_photo;
	}
	public void setS_book_photo(String s_book_photo) {
		this.s_book_photo = s_book_photo;
	}
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	
	
	
	public int AddBooks() throws SQLException{
		Connection conn = DBConnect.connct();
		
		String sql = "insert into seller_books_log (s_book_name,s_book_arthur,s_book_price,avl_stock,s_book_photo,s_userid)values(?,?,?,?,?,?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, s_bookname);
		ps.setString(2, s_arthur);
		ps.setInt(3, s_price);
		ps.setInt(4, seller_avl_stock);
		ps.setString(5, s_book_photo);
		ps.setString(6, seller_id );
		
		int response = ps.executeUpdate();
		conn.close();
		
		return response;
	}
	
	public int UpdateBooks() throws SQLException
	{
		Connection conn =DBConnect.connct();
		
	
		 String sql = "update seller_books_log set s_book_name=?, s_book_arthur=?,s_book_price =?,avl_stock=? where  s_book_id =?";
		 PreparedStatement ps = conn.prepareStatement(sql);
			    
		    
	    ps.setString(1, s_bookname);		
		ps.setString(2, s_arthur);
		ps.setInt(3, s_price);
		ps.setInt(4, seller_avl_stock);
		ps.setInt(5, s_bookid);	
	
		int response = ps.executeUpdate();
		conn.close();
		
		return response;
	}
	
	public ArrayList<Seller_Books> getAllBooksDetailslimited () throws SQLException
	{
		Connection conn = DBConnect.connct();
		
		String sql = "select *from seller_books_log limit 3";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		
		ArrayList<Seller_Books> allBooks = new ArrayList<>();
		
		while(rs.next())
		{
			Seller_Books sb = new Seller_Books();
			
			sb.setS_bookid(rs.getInt("s_book_id"));
			sb.setS_bookname(rs.getString("s_book_name"));
			sb.setS_arthur(rs.getString("s_book_arthur"));
			sb.setS_price(rs.getInt("s_book_price"));
			sb.setSeller_avl_stock(rs.getInt("avl_stock"));
			sb.setS_book_photo(rs.getString("s_book_photo"));
			
			allBooks.add(sb);
		}
		conn.close();
		
		return allBooks;
	}
	public ArrayList<Seller_Books> getAllBooksDetails() throws SQLException
	{
		Connection conn = DBConnect.connct();
		
		String sql = "select *from seller_books_log";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		
		ArrayList<Seller_Books> allBooks = new ArrayList<>();
		
		while(rs.next())
		{
			Seller_Books sb = new Seller_Books();
			
			sb.setS_bookid(rs.getInt("s_book_id"));
			sb.setS_bookname(rs.getString("s_book_name"));
			sb.setS_arthur(rs.getString("s_book_arthur"));
			sb.setS_price(rs.getInt("s_book_price"));
			sb.setSeller_avl_stock(rs.getInt("avl_stock"));
			sb.setS_book_photo(rs.getString("s_book_photo"));
			
			allBooks.add(sb);
		}
		conn.close();
		
		return allBooks;
	}
	
	public ArrayList<Seller_Books> getAllBooksBySellerId() throws SQLException{
		Connection conn = DBConnect.connct();
		
		String sql = "select *from seller_books_log where s_userid =?";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, seller_id);
		
		ResultSet rs = ps.executeQuery();
		
		ArrayList<Seller_Books> sellerBooks = new ArrayList<>();
		
		while(rs.next())
		{
			Seller_Books sb = new Seller_Books();
			
			sb.setS_bookid(rs.getInt("s_book_id"));
			sb.setS_bookname(rs.getString("s_book_name"));
			sb.setS_arthur(rs.getString("s_book_arthur"));
			sb.setS_price(rs.getInt("s_book_price"));
			sb.setSeller_avl_stock(rs.getInt("avl_stock"));
			sb.setS_book_photo(rs.getString("s_book_photo"));
			
			sellerBooks.add(sb);
		}
		
		return sellerBooks;
		
	}
	
	public Seller_Books getBooksById() throws SQLException
	{
		Connection conn = DBConnect.connct();
		
		String sql = "select *from seller_books_log where s_book_id=?";
		
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setInt(1, s_bookid);
		
		ResultSet rs = ps.executeQuery();
		
		Seller_Books sb= new Seller_Books();
		
		while(rs.next())
		{
			sb.setS_bookid(rs.getInt("s_book_id"));
			sb.setS_bookname(rs.getString("s_book_name"));
			sb.setS_arthur(rs.getString("s_book_arthur"));
			sb.setS_price(rs.getInt("s_book_price"));
			sb.setSeller_avl_stock(rs.getInt("avl_stock"));
			sb.setS_book_photo(rs.getString("s_book_photo"));
		}
		conn.close();
		return sb;
	}
	
	public int DeleteBooks() throws SQLException
	{
		Connection conn =DBConnect.connct();
		
		 String sql = "delete from seller_books_log where s_book_id =?";
		 
		 PreparedStatement ps = conn.prepareStatement(sql);
			    
		ps.setInt(1, s_bookid);	
	
		int response = ps.executeUpdate();
		conn.close();
		
		return response;
	}
	
	public int UpdateAvlStock() throws SQLException{
		Connection conn = DBConnect.connct();
		
		String sql = "update seller_books_log set avl_stock=? where s_book_id =?";
		
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, seller_avl_stock);
		ps.setInt(2, s_bookid);
		
		int response=ps.executeUpdate();
		conn.close();
		
		return response;
		
		
	}
	
	
}
