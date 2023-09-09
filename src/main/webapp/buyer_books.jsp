<%@page import="java.util.ArrayList"%>
<%@page import="bean.Seller_Books"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>buyer-shop</title>
<jsp:include page="buyercsslink.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="buyer_header.jsp"></jsp:include>
    <jsp:include page="buyerjslink.jsp"></jsp:include>
    <div>
    	<h2 style="text-align: center;color: red;" id="display">
    	</h2>
    </div>
    
       
  <section class="shop_section layout_padding">
    <div class="container">
      <div class="heading_container heading_center">
        <h2>
          Latest Products
        </h2>
      </div>
      <div class="row">
      
	      <%
	      HttpSession session2 = request.getSession();
	      String b_id = (String) session2.getAttribute("buyer_userid");
	      
	      
	      Seller_Books s = new Seller_Books();
	      ArrayList<Seller_Books>  allbooks= s.getAllBooksDetails();
	      
	      for(Seller_Books book: allbooks)
	      {
	    	  out.println("<div class='col-sm-4 col-md-4 col-lg-4'>");
	    	  out.println("<div class='box'>");
	    	  	out.println("<a href=''>");
	              out.println("<div class='img-box'>");
	                out.println("<img src='"+book.getS_book_photo()+"' alt='no'>");
	              out.println("</div>");
	              out.println("<div class='detail-box'>");
	                out.println("<h6>");
	                  out.println(book.getS_bookname());
	                  out.println("<p style='color:grey;'>");
	                  	out.println(book.getS_arthur());
	                  out.println("</p>");
	                out.println("</h6>");
	                out.println("<h6>");
	                  out.println("Price");
	                  out.println("<span>");
	                    out.println("RS "+book.getS_price());
	                  out.println("</span>");
	                out.println("</h6>");          	
	              out.println("</div>");
	              out.println("<div class='detail-box'>");
	              	out.println("<h6>");
		          		out.println("<a onclick='addToCart("+book.getS_bookid()+")'class='btn btn-success btn-sm'>Add To Cart</a>");
		          	out.println("</h6>");
		          	out.println("<h6>");
		          		out.println("<a href=''#' class='btn btn-warning btn-sm'>Buy Now</a>");
		          	out.println("</h6>");
	              out.println("</div>");
	              out.println("<div class='new'>");
	                out.println("<span>");
	                  out.println("New");
	                out.println("</span>");
	              out.println("</div>");
	            out.println("</a>");
	          out.println("</div>");
	        out.println("</div>");
	      }
	      %>
      </div>
    </div>
  </section>
   
  <jsp:include page="buyer_footer.jsp"></jsp:include>  
   <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>      
  
  <script>
  function addToCart(s_book_id)
  {
		$.ajax({
			url:"addtocart",
			method:"post",
			data:{"book_id":s_book_id},
			success:function(response)
			{
				
					if(response == 1)
					{
						
						document.getElementById('display').innerHTML="Product Added Cart Successfully.....";
						window.location.href = "";
					}
					else if(response == 2)
					{
						var temp = "Product Already added into cart...!!<br>";
						temp += "<a href='buyer_viewcart.jsp'>View Product</a>";
						document.getElementById('display').innerHTML=temp;
					}
					else if(response == 3)
					{
						alert("Product is Out Of Stock");
					}
					else if(response ==4)
					{
						alert("Need Login First");
						window.location.href="buyer_login.jsp";
					}
					else
					{
						document.getElementById('display').innerHTML="Not Added ,Problem Occur Please try Again.....";	
					}
					
			}
				
		})  
  }
  </script>
</body>
</html>