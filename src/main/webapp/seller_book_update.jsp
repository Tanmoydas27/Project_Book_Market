<%@page import="bean.Seller_Books"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>seller-book-update</title>
<jsp:include page="csslink.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="side_bar.jsp"></jsp:include>
	
<%
	HttpSession session2 = request.getSession();
	String seller_id = (String) session2.getAttribute("userid");
	
	
	int bid = Integer.parseInt(request.getParameter("bid"));
	out.println(bid);
	Seller_Books sb = new Seller_Books();
	sb.setS_bookid(bid);
	Seller_Books details = sb.getBooksById();
	
%>
	<div id="wrapper">
		<div id="page-wrapper">
            <div id="page-inner">
            	<form action="updatebook" method="post">
	            	<div class="row">
	                    <div class="col-md-12">
	                        <h2>Update Book</h2>
	                    </div>
	                </div>
	                <hr />
	                	<div class="row">
							<div class="col-md-6 col-sm-6 col-xs-6" >
								<div class="form-group input-group">
									  <span class="input-group-addon">Book Id:</span>
									  <input type="number" name="book_id" class="form-control" placeholder="Bookid"  readonly="readonly" value="<%=details.getS_bookid()%>"/>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 col-sm-6 col-xs-6" >
								<div class="form-group input-group">
								  <span class="input-group-addon">Book Name:</span>
								  <input type="text" name="book_name" class="form-control" placeholder="Enter Book Name" value="<%=details.getS_bookname()%>" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 col-sm-6 col-xs-6" >
								<div class="form-group input-group">
								  <span class="input-group-addon ">Arthur Name:</span>
								  <input type="text" name="arthur_name" class="form-control" placeholder="Enter Arthur Name" value="<%=details.getS_arthur()%>"/>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 col-sm-6 col-xs-6" >
								<div class="form-group input-group">
								  <span class="input-group-addon">Book Price:</span>
								  <input type="number" name="b_price" class="form-control" placeholder="Enter Book price" value="<%=details.getS_price()%>"/>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 col-sm-6 col-xs-6" >
								<div class="form-group input-group">
								  <span class="input-group-addon">Book Avl Stock:</span>
								  <input type="number" name="b_avl_stock" class="form-control" placeholder="Enter Books Stock Size" value="<%=details.getSeller_avl_stock()%>"/>
								</div>
							</div>
						</div>
		              	<div class="row">
		              		<div class="panel-body">
				                <button class="btn btn-primary btn-md" data-toggle="modal" data-target="#myModal" style="margin-left: 200px;">
				                 	 Update Book
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