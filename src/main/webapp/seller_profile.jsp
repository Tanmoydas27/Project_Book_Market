<%@page import="javax.swing.filechooser.FileNameExtensionFilter"%>
<%@page import="bean.Sellers"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>seller-profile-page</title>
<jsp:include page="csslink.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="side_bar.jsp"></jsp:include>
	
	
<%

	HttpSession session2 =request.getSession();
	String userid = (String) session2.getAttribute("userid");
	
	Sellers s = new Sellers();
	
	s.setS_userid(userid);
	Sellers details = s.getSellerById();
%>
	<div id="wrapper">
		<div id="page-wrapper">
            <div id="page-inner">
            	<form action="updateseller" method="post" enctype = "multipart/form-data">
	                <ul class="nav" id="main-menu">
						<li class="text-center">
							<div>
								<img alt="" src="<%=details.getS_photocopy()%>" class="user-image img-responsive" />
	                       		<input type="file" name="photo"  style="margin-left: 555px;margin-bottom: 10px;" value="<%=details.getS_photocopy()%>"/>
							</div>						
						</li>						
					</ul>
					<hr/>
					
					<div class="row">
						<div class="col-md-6 col-sm-6 col-xs-6" >
							<div>
								<span style="font-size: 120%;">UserId:</span>
							</div>
							<fieldset >
								<div class="form-group input-group">
									  <span class="input-group-addon">@</span>
									  <input type="text" name="userid" class="form-control" placeholder="Userid/email" value="<%= details.getS_userid()%>" readonly="readonly"/>
								</div>
							</fieldset>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-sm-6 col-xs-6" >
							<div>
								<span style="font-size: 120%;">Seller Name:</span>
							</div>
							<div class="form-group input-group">
							  <span class="input-group-addon">N</span>
							  <input type="text" name="name" class="form-control" placeholder="Name" value="<%= details.getS_name()%>" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-sm-6 col-xs-6" >
							<div>
								<span style="font-size: 120%;">Mobile No:</span>
							</div>
							<div class="form-group input-group">
							  <span class="input-group-addon">M</span>
							  <input type="text" name="mobile" class="form-control" placeholder="Mobile No" value="<%= details.getS_mob_no()%>"/>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-sm-6 col-xs-6" >
							<div>
								<span style="font-size: 120%;">Address:</span>
							</div>
							<div class="form-group input-group">
							  <span class="input-group-addon">A</span>
							  <input type="text" name="address" class="form-control" placeholder="Address" value="<%= details.getS_address()%>"/>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-sm-6 col-xs-6" >
							<div>
								<span style="font-size: 120%;">Password:</span>
							</div>
							<div class="form-group input-group">
							  <span class="input-group-addon">P</span>
							  <input type="text" name="pass" class="form-control" placeholder="Password" value="<%= details.getS_password()%>"/>
							</div>
						</div>
					</div>
					
	              	<div class="row">
	              		<div class="panel-body">
			                <button class="btn btn-primary btn-md" data-toggle="modal" data-target="#myModal" style="margin-left: 200px;">
			                 	 Update Profile
			                </button>
		              </div>
	              	</div>
	              	<div style="font-size: 150%; margin-left: 200px;">
				           	${requestScope['message']}
				    </div>
				 </form>
            </div>
        </div>
	</div>	
    <jsp:include page="jslink.jsp"></jsp:include>
       
</body>
</html>