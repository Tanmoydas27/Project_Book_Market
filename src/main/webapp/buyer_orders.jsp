<%@page import="com.razorpay.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.Orders"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>buyer-orders</title>
 <jsp:include page="buyercsslink.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="buyer_header.jsp"></jsp:include>
	<hr>
	
	<div class="container">
      <div class="heading_container heading_center">
        <h2 style="margin-top: 20px;">
          Orders
        </h2>
      </div>
   	</div>
   	<hr>
      <div class="col-md-12">
          <!--   Kitchen Sink -->
          <div class="panel panel-default">
              <div class="panel-heading">
                  Order Items : 
              </div>
              <div class="panel-body">
                  <div class="table-responsive">
                      <table class="table table-striped table-bordered table-hover">
                          <thead>
                              <tr>
                                  <th>Order Id</th>
                                  <th>Trans Id</th>
                                  <th>Buyer Id</th>
                                  <th>No Of Books</th>
                                  <th>Total Price</th>
                                  <th>Date</th>
                                  <th>Action</th>
                              </tr>
                          </thead>
                          <tbody>
                          <%
                          	HttpSession session2 = request.getSession();
                            String buyer_id = (String) session2.getAttribute("buyer_userid");
                            
                            Orders ords = new Orders();
                            ords.setBuyer_id(buyer_id);
                            
                            ArrayList<Orders> allOrders = ords.getAllOrders();
                            for(Orders or : allOrders)
                            {
                            	
                            	out.println("<tr>");
		                          out.println("<td>");
		                          out.println(or.getOrder_id());
		                          out.println("</td>");
								  out.println("<td>");
		                          out.println(or.getTrans_id());
		                          out.println("</td>");
								  out.println("<td>");
		                          out.println(or.getBuyer_id());
		                          out.println("</td>");
                                  out.println("<td>");
		                          out.println(or.getNo_of_products());
		                          out.println("</td>");
                                  out.println("<td>");
		                          out.println(or.getTotal());
		                          out.println("</td>");
                                  out.println("<td>");
		                          out.println(or.getDate());
		                          out.println("</td>");
		                          out.println("<td>");
		                          out.println("<a href='buyer_order_details.jsp?order_id="+or.getOrder_id()+"' class='btn btn-danger btn-sm'>View</a>");
		                          out.println("</td");
	                      	   out.println("</tr>");
                            }
                          
	                          
                          
                          
                          
                          %>
                              
                              
                          </tbody>
                      </table>
                  </div>
              </div>
          </div>
          <!-- End  Kitchen Sink -->
      </div>
	
	
	
	
	
	<hr>
	<jsp:include page="buyer_footer.jsp"></jsp:include>
	<jsp:include page="buyerjslink.jsp"></jsp:include>
       
</body>
</html>