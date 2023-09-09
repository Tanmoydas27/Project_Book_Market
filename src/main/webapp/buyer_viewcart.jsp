<%@page import="java.util.ArrayList"%>
<%@page import="bean.AddToCart"%>
<%@page import="bean.Seller_Books"%>
<%@page import="bean.Buyers"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>buyer-view-to-cart</title>
 <jsp:include page="buyercsslink.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="buyer_header.jsp"></jsp:include>
	
	<div class="container">
      <div class="heading_container heading_center">
        <h2 style="margin-top: 20px;">
          View Cart Product
        </h2>
      </div>
   	</div>
     <hr/>
     <div class="col-md-3" style="font-size: 150%;">
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
				                   <th>Action</th>
				               </tr>
				           </thead>
				           <tbody>
				               <%
				               
				              HttpSession session2 = request.getSession();
				               String buyer_id =(String)session2.getAttribute("buyer_userid");
				               
				               AddToCart act = new AddToCart();
				               act.setBuyer_id(buyer_id);
				              ArrayList<AddToCart> allcartdetails = act.getAllCartBookDetails();
				              int total = 0;
				              int count =0;
				              for(AddToCart ac : allcartdetails)
				              {
				            	  int book_id = ac.getBook_id();
				            	  
				            	  Seller_Books sb = new Seller_Books();
				            	  sb.setS_bookid(book_id);
				            	  
				            	  Seller_Books details = sb.getBooksById();
				            	  int avl_stock =details.getSeller_avl_stock();
				            	  total = total + (details.getS_price()*ac.getStock());
				            	  count = count+1;
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
											out.println("<select onchange='myFunction(this.value,"+ac.getCart_id()+")' class='form-select form-select-lg mb-3' aria-label='Default select example' required>");

										  if(ac.getStock()== 1)
										  {
											  
											  out.println("<option selected value='1'>1</option>");
											  out.println("<option  value='2'>2</option>");
											  out.println("<option  value='3'>3</option>");
											  out.println("<option  value='4'>4</option>");
											  out.println("<option  value='5'>5</option>");
										  }
										  
										  else if(ac.getStock()== 2)
										  {
											  out.println("<option  value='1'>1</option>");
											  out.println("<option selected value='2'>2</option>");
											  out.println("<option  value='3'>3</option>");
											  out.println("<option  value='4'>4</option>");
											  out.println("<option  value='5'>5</option>");
										  }
										  
										  else if(ac.getStock()== 3)
										  {
											  out.println("<option  value='1'>1</option>");
											  out.println("<option  value='2'>2</option>");
											  out.println("<option selected value='3'>3</option>");
											  out.println("<option  value='4'>4</option>");
											  out.println("<option  value='5'>5</option>");
										  }
										  else if(ac.getStock()==4)
										  {
											  out.println("<option value='1'>1</option>");
											  out.println("<option  value='2'>2</option>");
											  out.println("<option  value='3'>3</option>");
											  out.println("<option selected  value='4'>4</option>");
											  out.println("<option  value='5'>5</option>");
										  }
										  
										  else if(ac.getStock()==5)
										  {
											  out.println("<option value='1'>1</option>");
											  out.println("<option  value='2'>2</option>");
											  out.println("<option  value='3'>3</option>");
											  out.println("<option  value='4'>4</option>");
											  out.println("<option selected  value='5'>5</option>");
										  }
										    
										  else
										  {
											  out.println("<option selected >select</option>");
											  out.println("<option value='1'>1</option>");
											  out.println("<option  value='2'>2</option>");
											  out.println("<option  value='3'>3</option>");
											  out.println("<option  value='4'>4</option>");
											  out.println("<option  value='5'>5</option>");
										  }
										  out.println("</select>");
									 out.println("</td>");
									 out.println("<td><span id='showtotal'>"+(details.getS_price()*ac.getStock())+"</span></td>");
									 out.println("<td><a class='btn btn-default btn-xs' onclick='delete_cart("+ac.getCart_id()+")'><i class='fa fa-lg fa-times-circle-o' aria-hidden='true'></i></td>");
									 out.println("</tr>");
				              }		
				              
				                %>                                          
					     </tbody>
					  </table>
					</div>
				</div>
			</div>
			<div>
			<%
			if(count == 0)
			{
				out.println("<h3 style='margin-left:67%;'>Grand Total: <span style='color: red;'>"+total+".00</span><a  href='javascript:void(0)' class='btn btn-success btn-xs' style='margin-left: 92px;' >Buy Now</a></h3>");
			}
			else
			{
				out.println("<h3 style='margin-left:67%;'>Grand Total: <span style='color: red;'>"+total+".00</span><a  href='BuyerBuyNow.jsp' class='btn btn-success btn-xs' style='margin-left: 92px;'>Buy Now</a></h3>");				
			}
			%>
			</div>
		</div>
		<hr>
								
	<jsp:include page="buyer_footer.jsp"></jsp:include>
	<jsp:include page="buyerjslink.jsp"></jsp:include>
 <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>      
 <script>
 	function delete_cart(cart_id)
 	{
 		if(confirm("Are you Sure to Delete the Cart Record ?"))
 			{
 				$.ajax({
 					url:"deletecart",
 					method:"post",
 					data:{"cart_id":cart_id},
 					success:function(response)
 					{
 						document.getElementById('display').innerHTML=response;
 						window.location.href = "";
 						
 					}
 				})
 			}
 		
 	}
 	
 	function myFunction(value,cart_id)
 	{
		
		$.ajax({
			url:"calculatecart",
			method:"post",
			data:{"stock":value,"cart_id":cart_id},
			success:function(response)
			{
				window.location.href="";
			}
		})

 	}
 	
 	
 	
 </script>
</body>
</html>