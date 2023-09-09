<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>seller-dashboard-page</title>
<jsp:include page="csslink.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="side_bar.jsp"></jsp:include>
	
	<%
		
	
	
	%>
	<div id="wrapper">
		  <div id="page-wrapper">
		       <div id="page-inner">
		           <div class="row">
		               <div class="col-md-12">
		                   <h2>Dashboard</h2>
		                   <h4 style="color: 2px solid black;">Welcome <span>Tanmoy</span> , Love to see you back. </h4>
		               </div>
		           </div>
		           <hr />
		           <div class="row">
		           	<div class="col-md-3 col-sm-6 col-xs-6">
		           		<div class="panel panel-back noti-box">
		           			<span class="icon-box bg-color-red set-icon">
		           				<i class="fa fa-book"></i>
		           			</span>
		           			<div class="text-box">
		           				<p class="main-text"><span id="count_books"></span> Books</p>
		           				<p class="text-muted">Total</p>
		           			</div>
		           		</div>
		           	</div>
		           	<div class="col-md-3 col-sm-6 col-xs-6">
		           		<div class="panel panel-back noti-box">
		           			<span class="icon-box bg-color-green set-icon">
		           				<i class="fa fa-shopping-cart"></i>
		           			</span>
		           			<div class="text-box">
		           				<p class="main-text">100 Books </p>
		           				<p class="text-muted">Sell</p>
		           			</div>
		           		</div>
		           	</div>
		           	<div class="col-md-3 col-sm-6 col-xs-6">
		           		<div class="panel panel-back noti-box">
		           			<span class="icon-box bg-color-brown set-icon">
		           				<i class="fa fa-rocket"></i>
		           			</span>
		           			<div class="text-box">
		           				<p class="main-text">5 orders</p>
		           				<p class="text-muted">Pending</p>
		           			</div>
		           		</div>
		           	</div>
		           	<div class="col-md-3 col-sm-6 col-xs-6">
						<div class="panel panel-back noti-box">
							<span class="icon-box bg-color-blue set-icon">
								<i class="fa fa-bell-o"></i>
							</span>
							<div class="text-box">
								<p class="main-text">240 New</p>
								<p class="text-muted">Notifications</p>
							</div>
						</div>
					</div>	
		           </div> 
		           <!-- /.ROW End --> 
		           <hr />
		          <!-- Chart Start --> 
		          <div class="row">
		          	<div class="col-md-6 col-sm-12 col-xs-12">
		          		<div class="panel panel-default">
		          			<div class="panel-heading">
		          				 Sells Chart
		          			</div>
		          			<div class="panel-body">
		          				<div id="morris-donut-chart"></div>
		          			</div>
		          		</div>
		          	</div>
		          </div>                        
		       </div>
		       
		       
		   	</div>
		</div>
	</div>	
	
	
	
    <jsp:include page="jslink.jsp"></jsp:include>
       
</body>
</html>