<%@page import="bean.Buyers"%>
<%@page import="bean.Seller_Books"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.AddToCart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>confirm-buy-now-page</title>
 <jsp:include page="buyercsslink.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="buyer_header.jsp"></jsp:include>
	
	<hr>
		<a href="buyer_viewcart.jsp" class="btn btn-danger" style="margin-left: 5%;">Back</a>	
	<hr>
	<div>
		<h3 id="display"></h3>
	</div>
		<div class="col-md-12" >
		    <div class="panel panel-default">
				 <div class="panel-body">
					<div class="table-responsive">
				       <table class="table table-striped table-bordered table-hover"
				           id="dataTables-example">
				           <thead>
				               <tr>
				               	   <th>Cart Id</th>
				                   <th>Book Id</th>
				                   <th>Book Name</th>
				                   <th>Author Name</th>
				                   <th>Price</th>
				                   <th>Stock</th>
				                   <th>Item Total</th>
				               </tr>
				           </thead>
				           <tbody>
				               <%
				               
				              HttpSession session2 = request.getSession();
				               String buyer_id =(String)session2.getAttribute("buyer_userid");
				               
				               Buyers b = new Buyers();
				               b.setBuyer_userid(buyer_id);
				               
				               Buyers bdetails = b.getBuyerById();
				               
				               AddToCart act = new AddToCart();
				               act.setBuyer_id(buyer_id);
				              ArrayList<AddToCart> allcartdetails = act.getAllCartBookDetails();
				              int total = 0;
				              int count=0;
				              for(AddToCart ac : allcartdetails)
				              {
				            	  int book_id = ac.getBook_id();
				            	  
				            	  Seller_Books sb = new Seller_Books();
				            	  sb.setS_bookid(book_id);
				            	  
				            	  Seller_Books details = sb.getBooksById();
				            	  total = total + (details.getS_price()*ac.getStock());
				            	  
				            	  count =count+1;
				            	  
				            	  	 out.println("<tr>");
				            	  	 out.println("<td>");
				            	  	 	out.println(ac.getCart_id());
				            	  	 out.println("</td>");
									 out.println("<td>");
									 	out.println(details.getS_bookid());
									 out.println("</td>");
									 out.println("<td>");
									 	out.println(details.getS_bookname());
									 out.println("</td>");
									 out.println("<td>");
									 	out.println(details.getS_arthur());
									 out.println("</td>");
									 out.println("<td>");
									 	out.println(details.getS_price());
									 out.println("</td>");
									 out.println("<td>");
										out.println(ac.getStock());
									 out.println("</td>");
									 out.println("<td><span id='showtotal'>"+(details.getS_price()*ac.getStock())+"</span></td>");
									 out.println("</tr>");
				              }		
				              
				                %>                                          
					     </tbody>
					  </table>
					</div>
				</div>
			</div>
			<div><h3 style="margin-left:81%;"> Total: <span style="color: red;"><%out.println(total); %>.00</span></h3></div>
		</div>	
	<hr>
		<div class="row">
			 <div class="col-md-6" style="margin-left: 5%;">
                 <label for="inputAddress">Enter Full Address</label>
                 <input class="form-control"  type="text" name="address" id="faddress" placeholder="Street, City, State, country,PIN," value="<%=bdetails.getBuyer_address()%>">
             </div>
		</div>
	<hr>
	
	<div class="row" style="margin-left: 47%;">
		<a onclick="paynow(<%=total%>)" class="btn btn-lg btn-success">Pay Now</a>
	</div>
	<br>
	<br>
	<hr>
	
	
	<jsp:include page="buyer_footer.jsp"></jsp:include>
	<jsp:include page="buyerjslink.jsp"></jsp:include>
	
 <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>      
 <script src="https://checkout.razorpay.com/v1/checkout.js"></script>      
 <script type="text/javascript">
  	document.getElementById("faddress").onchange =function() {myFunction()};
  	
  	function myFunction()
  	{
  		var x = document.getElementById("faddress").value;
  		
  		$.ajax({
  			url:"confirmAddress",
  			method:"post",
  			data:{"address":x},
  			success:function(response)
  			{
  				window.location.href=" ";

  			}
  			
  		})
  		
  	}
  	
  	
  	function paynow(total)
 	{
  		
  		/*$.ajax({
  			url:"buynow",
  			method:"post",
  			data:{"amount":total},
  			success:function(response)
  			{
  				alert("response : "+response);
  			}
  			
  		})*/
  		
  	var options = {
  		        "key": "rzp_test_896KmNhaI7TPe1", // Enter the Key ID generated from the Dashboard
  		        "amount": total*100, // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
  		        "currency": "INR",
  		        "name": "Book Market", //your business name
  		        "description": "Membership Subscription",
  		        "image": "https://w7.pngwing.com/pngs/232/270/png-transparent-credit-card-computer-icons-payment-card-bank-payment-text-payment-logo.png",
  		        "handler": function (response){
  		            alert(response.razorpay_payment_id);
  		            if(response.razorpay_payment_id != null)
		            	{
	 		            	 $.ajax({
	 	  		            	url:"buynow",
	 	  		            	method:"post",
	 	  		            	data:{"trans_id":response.razorpay_payment_id, "total": total},
	 	  		            	success:function(response)
	 	  		            	{
	 	  		            		alert(response);
	 	  		            		window.location.href="buyer_orders.jsp";
	 	  		            	}
	 	  		            	
	 	  		            })
		            	}
  		            else
  		            	{
  		            		document.ElementById("display")="Payment Not Complete";
  		            	}
  		            
  		            
  		            
  		           
  		        },
		  		"prefill": {
		  	        "name": "Tanmoy Das",
		  	        "email": "tanmoy1@gmail.com",
		  	        "contact": "6295100775"
		  	    }
  		    };
  		    var rzp1 = new Razorpay(options);
  		    rzp1.open();
  		
 	}
 </script>
</body>
</html>