<%@page import="bean.Seller_Books"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.Orders"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>details-of_orders</title>
 <jsp:include page="buyercsslink.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="buyer_header.jsp"></jsp:include>
	<hr>
	
	<%
		HttpSession session2 = request.getSession();
		String buyer_id = (String) session2.getAttribute("buyer_userid");
		
		int order_id = Integer.parseInt(request.getParameter("order_id"));
		
	%>
	
	<hr>
		<a href="buyer_orders.jsp" class="btn btn-danger" style="margin-left: 5%;">Back</a>	
	<hr>
	<div class="col-md-12" >
		    <div class="panel panel-default">
		    	<div class="panel-heading">
                  Order Id :<%=order_id %> 
              	</div>
				 <div class="panel-body">
					<div class="table-responsive">
				       <table class="table table-striped table-bordered table-hover"
				           id="dataTables-example">
				           <thead>
				               <tr>
				               	   <th>Orders Details Id</th>
				                   <th>Book Id</th>
				                   <th>Book Name</th>
				                   <th>Author Name</th> 
				                   <th>Price</th>
				                   <th>Quantity</th>
				               </tr>
				           </thead>
				           <tbody>
				               <%
									Orders ord = new Orders();
				               		ord.setOrder_id(order_id);
				               		
				               		ArrayList<Orders> allOrderDetails = ord.getAllOrderDetailsByorderId();
				               		
				               		for(Orders or : allOrderDetails)
				               		{
				               			
				               			Seller_Books sb = new Seller_Books();
				               			sb.setS_bookid(or.getBook_id());
				               			
				               			Seller_Books details = sb.getBooksById();
				            	  
					            	  	 out.println("<tr>");
					            	  	 out.println("<td>");
					            	  	 	out.println(or.getOrder_details_id());
					            	  	 out.println("</td>");
										 out.println("<td>");
										 	out.println(or.getBook_id());
										 out.println("</td>");
										 out.println("<td>");
					            	  	 	out.println(details.getS_bookname());
					            	  	 out.println("</td>");
					            	  	out.println("<td>");
				            	  	 	out.println(details.getS_arthur());
				            	  	 	out.println("</td>");
										 out.println("<td>");
										 	out.println(or.getPrice());
										 out.println("</td>");
										 out.println("<td>");
										 	out.println(or.getQuantity());
										 out.println("</td>");
										 out.println("</tr>");
				              		}		
				              
				                %>                                          
					     </tbody>
					  </table>
					</div>
				</div>
			</div>
		</div>
	
	<hr>
	<jsp:include page="buyer_footer.jsp"></jsp:include>
	<jsp:include page="buyerjslink.jsp"></jsp:include>
       
</body>
</html>