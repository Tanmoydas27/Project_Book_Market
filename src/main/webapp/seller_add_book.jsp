<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add-book-seller</title>
<jsp:include page="csslink.jsp"></jsp:include>
</head>
<body>

	<%
		HttpSession session2 = request.getSession();
		String userid = (String) session2.getAttribute("userid");
	%>

	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="side_bar.jsp"></jsp:include>
	
	<div id="wrapper">
		<div id="page-wrapper">
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <h2>Add Book</h2>
                    </div>
                </div>
                <hr />
               <form role = "form" action="addbook" method="post" enctype = "multipart/form-data">
               	  <input type="hidden" class="form-control" name="userid" value="<%out.print(userid);%>">
               	  <div class="row">
               	  		<div class="col-md-4" style="text-align: center; margin-left: 20%;">
               	  		   <h3>Book Photo</h3>
                           <div class="form-group">
                               <input class="form-control"  type="file"  name="photo" required="required" />
                           </div>
               	  		</div>
               	  </div>
	                <div class="row">
	                	<div class="col-md-4">	                       	
	                      		<h3>Book Name</h3>
	                           <div class="form-group">
	                               <input class="form-control"  type="text"  name="book_name" placeholder="Enter Book Name"/>
	                           </div>                       
	            		</div>
	            		<div class="col-md-4">	                       	
	                      		<h3> Author Name</h3>
	                           <div class="form-group">
	                               <input class="form-control"  type="text" name="arthur_name" placeholder="Enter Arthur Name"/>
	                           </div>                       
	            		</div>
	            		<div class="col-md-4">	                       	
	                      		<h3> Price</h3>
	                           <div class="form-group">
	                               <input class="form-control"  type="text" name="book_price" placeholder="Enter Book Prices"/>
	                           </div>                       
	            		</div>
	            		<div class="col-md-4">	                       	
	                      		<h3> Stock</h3>
	                           <div class="form-group">
	                               <input class="form-control"  type="text" name="book_stock" placeholder="Enter Book Stocks Size"/>
	                           </div>                       
	            		</div>
	            	</div>
	            	<div class="row">
	            		<div class="col-md-6" style="margin-left: 400px;">
	            			<button class="btn btn-primary btn-lg">
	            				Add
	            			</button>
	            		</div>
	            	</div>
	            </form>
        	</div>
		</div>	
	</div>
	
	
    <jsp:include page="jslink.jsp"></jsp:include>
       
</body>
</html>