package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


public class Orders {
	private int book_id;
	private int cart_id;
	private String buyer_id ;
	private int stock;
	private String buyer_address;
	private int order_details_id;
	private int price;
	private int quantity;
	private String trans_id;
	private int total;
	private int no_of_products;
	private int order_id;
	private String date;
	public int getOrder_details_id() {
		return order_details_id;
	}
	public void setOrder_details_id(int order_details_id) {
		this.order_details_id = order_details_id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getNo_of_products() {
		return no_of_products;
	}
	public void setNo_of_products(int no_of_products) {
		this.no_of_products = no_of_products;
	}
	public String getTrans_id() {
		return trans_id;
	}
	public void setTrans_id(String trans_id) {
		this.trans_id = trans_id;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
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
	
	public int addToOrders() throws SQLException{
		Connection conn = DBConnect.connct();
		
		String sql = "insert into orders (trans_id,buyer_id,no_of_products,total_price) values(?,?,?,?)";
		PreparedStatement ps = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
		
		ps.setString(1,trans_id);
		ps.setString(2,buyer_id);
		ps.setInt(3, no_of_products);
		ps.setInt(4, total);

		int response = ps.executeUpdate();
		
		
		int ordid = 0;
		
		ResultSet rs = ps.getGeneratedKeys();
		
		rs.next();
		ordid = rs.getInt(1);
		
		conn.close();
		
		return ordid;
		
	}
	
	
	public int addToOrderDetails() throws SQLException{
		Connection conn = DBConnect.connct();
		
		String sql ="insert into order_details(order_id,book_id,price,quantity) values (?,?,?,?)";
		
		PreparedStatement ps =conn.prepareStatement(sql);
		
		ps.setInt(1,order_id);
		ps.setInt(2, book_id);
		ps.setInt(3, price);
		ps.setInt(4, quantity);
		
		int response = ps.executeUpdate();
		
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
	
	public int DeleteFromCart() throws SQLException{
		Connection conn =  DBConnect.connct();
		
		String sql = "delete from cart_details where cart_id =?";
		
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setInt(1, cart_id);
		
		int response = ps.executeUpdate();
		return response;
		
	}
	public ArrayList<Orders> getAllOrders() throws SQLException
	{
		Connection conn = DBConnect.connct();
		
		String sql = "select *from orders where buyer_id =?";
		
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, buyer_id);
		ResultSet rs = ps.executeQuery();
		
		ArrayList<Orders> allorders = new ArrayList<>();
		
		while(rs.next())
		{
			Orders ord = new Orders();
			
			ord.setOrder_id(rs.getInt("order_id"));
			ord.setTrans_id(rs.getString("trans_id"));
			ord.setBuyer_id(rs.getString("buyer_id"));
			ord.setNo_of_products(rs.getInt("no_of_products"));
			ord.setTotal(rs.getInt("total_price"));
			ord.setDate(rs.getString("order_date"));
			
			allorders.add(ord);
		}
		conn.close();
		
		return allorders;
	}
	
	
	public ArrayList<Orders> getAllOrderDetailsByorderId() throws SQLException
	{
		Connection conn = DBConnect.connct();
		
		String sql = "select *from order_details where order_id =?";
		
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, order_id);
		ResultSet rs = ps.executeQuery();
		
		ArrayList<Orders> allorderdetails = new ArrayList<>();
		
		while(rs.next())
		{
			Orders ord = new Orders();
			
			ord.setOrder_details_id(rs.getInt("order_details_id"));
			ord.setOrder_id(rs.getInt("order_id"));
			ord.setBook_id(rs.getInt("book_id"));
			ord.setPrice(rs.getInt("price"));
			ord.setQuantity(rs.getInt("quantity"));
			
			allorderdetails.add(ord);
		}
		conn.close();
		
		return allorderdetails;
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
