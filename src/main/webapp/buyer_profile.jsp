<%@page import="bean.Buyers"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>buyer-profile</title>
 <jsp:include page="buyercsslink.jsp"></jsp:include>
 <style type="text/css">
 .input-div{
 	border: 2x solid black;
 	margin-top: 30px;
 	
 }
 </style>
 
</head>
<body>
	<jsp:include page="buyer_header.jsp"></jsp:include>
	
	<%
		HttpSession session2 = request.getSession();
		String buyer_id=(String) session.getAttribute("buyer_userid");
		
		Buyers b = new Buyers();
		b.setBuyer_userid(buyer_id);
		Buyers details = b.getBuyerById();		
	%>
	
<div class="container-xl px-4 mt-4">
    <!-- Account page navigation-->
    <hr class="mt-0 mb-4">
    <form action="updatebuyer" method="post" enctype = "multipart/form-data">
    <div class="row">
        <div class="col-xl-4">
            <!-- Profile picture card-->
            <div class="card mb-4 mb-xl-0">
                <div class="card-header">Profile Picture</div>
                <div class="card-body text-center">
                    <!-- Profile picture image-->
                    <img class="img-account-profile rounded-circle mb-2" alt="no_image" src="<%=details.getBuyer_photograph()%>">
                    <!-- Profile picture help block-->
                    <div class="small font-italic text-muted mb-4">JPG or PNG no larger than 5 MB</div>
                    <!-- Profile picture upload button-->
                    <input type="file" name="photo" value="<%=details.getBuyer_photograph()%>">
                </div>
            </div>
        </div>
        <div class="col-xl-8">
            <!-- Account details card-->
            <div class="card mb-4">
                <div class="card-header">Account Details</div>
                <div class="card-body">
                        <!-- Form Group (username)-->
                        <div class="mb-3">
                            <label class="small mb-1" for="inputUsername">UserId</label>
                            <input class="form-control" type="text" name="userid"  placeholder="Enter your username" readonly="readonly" value="<%=details.getBuyer_userid()%>">
                        </div>
                        <!-- Form Row-->
                        <div class="row gx-3 mb-3">
                            <!-- Form Group (first name)-->
                            <div class="col-md-12">
                                <label class="small mb-1" for="inputName">Buyer Name</label>
                                <input class="form-control"  type="text" placeholder="Enter your  name" name="name" value="<%=details.getBuyer_name()%>">
                            </div>
                        </div>
                        <!-- Form Row        -
                        <!-- Form Group (address)-->
                        <div class="mb-3">
                            <label class="small mb-1" for="inputAddress">Address</label>
                            <input class="form-control"  type="text" name="address"  placeholder="Address" value="<%=details.getBuyer_address()%>">
                        </div>
                        <!-- Form Row-->
                        <div class="row gx-3 mb-3">
                            <!-- Form Group (phone number)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputPhone">Phone number</label>
                                <input class="form-control"  type="tel" placeholder="Enter your phone number" name="mobile"  value="<%=details.getBuyer_mobile_no()%>">
                            </div>
                            <!-- Form Group (birthday)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputPassword">Password</label>
                                <input class="form-control"  type="text"  name="pass"  placeholder="Password" value="<%=details.getBuyer_password()%>">
                            </div>
                        </div>
                        <!-- Save changes button-->
                        <button class="btn btn-primary "  data-toggle="modal" data-target="#myModal" >
                        	Save changes
                        </button>
                </div>
            </div>
        </div>
    </div>
  </form>
</div>

<hr>
	
	
	
	<jsp:include page="buyer_footer.jsp"></jsp:include>
	<jsp:include page="buyerjslink.jsp"></jsp:include>
       
</body>
</html>