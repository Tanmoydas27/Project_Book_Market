<%@page import="java.util.ArrayList"%>
<%@page import="bean.Seller_Books"%>
<%@page import="bean.Sellers"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>seller-books-page</title>
<jsp:include page="csslink.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="side_bar.jsp"></jsp:include>
	
	<div id="wrapper">
		<div id="page-wrapper">
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-4">
                        <h2>Book Details</h2>
                    </div>
                </div>
                <hr />
                <div class="row">
                	<div class="col-md-6" style="margin-bottom: 15px;">
                		<a href="seller_add_book.jsp" class="btn btn-primary btn-lg">Add Book</a>
                	</div>
	            	<div class="col-md-3" style="font-size: 150%;">
                		${requestScope['message']} 
                		
                	</div>
                	<div class="col-md-3" style="font-size: 150%;">
                		<h3 id="display"></h3>
                	</div>
                    <div class="col-md-12">
                        <!-- Advanced Tables -->
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                All Books Details
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover"
                                        id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th>Book Id</th>
                                                <th>Book Name</th>
                                                <th>Author Name</th>
                                                <th>Price</th>
                                                <th>Avl Stock</th>
                                                <th colspan="2">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                            	HttpSession session2 = request.getSession();
                                            	String seller_id = (String) session2.getAttribute("userid");
                                            	
                                            	Seller_Books sb = new Seller_Books();
                                            	sb.setSeller_id(seller_id);
                                           		ArrayList<Seller_Books> sellerBooks = sb.getAllBooksBySellerId();
                                           		
                                           		for(Seller_Books seb : sellerBooks)
                                           		{
                                           			 out.println("<tr>");
	                       							 out.println("<td>"+seb.getS_bookid()+"</td>");
	                       							 out.println("<td>"+seb.getS_bookname()+"</td>");
	                       							 out.println("<td>"+seb.getS_arthur()+"</td>");
	                       							 out.println("<td>"+seb.getS_price()+"</td>");
	                       							 out.println("<td>"+seb.getSeller_avl_stock()+"</td>");
	                       							 out.println("<td><a href='seller_book_update.jsp?bid="+seb.getS_bookid()+"'>Edit</td>");
	                       							 out.println("<td><a onclick='delete_book("+seb.getS_bookid()+")'>Delete</td>");
	                       							 out.println("</tr>");
	                                           	}
                                             %>                                           
                                        </tbody>
                                    </table>
                                </div> <a></a>

                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
	</div>	
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<script type="text/javascript">
	function delete_book(s_book_id)
	{
		if(confirm("Are you Sure to Delete the Book Record ?"))
		{
			$.ajax({
				url:"deletebook",
				method:"post",
				data:{"book_id":s_book_id},
				success:function(response)
				{
						document.getElementById('display').innerHTML=response;
						window.location.href = "";
					
				}
			})
		}
	}

</script>
<jsp:include page="jslink.jsp"></jsp:include>
       
</body>
</html>