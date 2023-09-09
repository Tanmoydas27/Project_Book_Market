<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seller_register-page</title>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="./style.css">
<jsp:include page="csslink.jsp"></jsp:include>
<style type="text/css">
	.login{
		width: 60%;
		margin-left: 20%;
		
	}
</style>
</head>
<body>
	<div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="all_login.jsp">Book Market</a> 
            </div>
          </nav>
      </div>
	<div class="panel panel-deafult">
                  <div class="panel-heading bg-default">
                      <span class="text-light">Seller Registration</span>
                  </div>
                  <div class="panel-body login" >
                      <div class="row">
                          <div class="col-md-6">
                              <h3>Registration Form</h3>
                              <form onsubmit="event.preventDefault(); Submit();">
                                  <div class="form-group">
                                      <label>Username:</label>
                                      <input type="email" class="form-control" placeholder="Enter Your Email"  id="username"/>
                                  </div>
                                  <div class="form-group">
                                      <label>Seller Name:</label>
                                      <input type="text" class="form-control" placeholder="Enter Seller name" id="s_name" />
                                  </div>
								<div class="form-group">
                                      <label>Mobile No:</label>
                                      <input type="text" class="form-control" placeholder="Enter mobileno" id="s_mobile"/>
                                  </div>
                                  <div class="form-group">
                                      <label>Address:</label>
                                      <input type="text" class="form-control" placeholder="Enter Address" id="s_address"/>
                                  </div>
                                  <div class="form-group">
                                      <label>Password</label>
                                      <input type="password" class="form-control" placeholder="Enter Password" id="password"/>
                                  </div>
                                  <div class="form-group">
                                      <label>Confirm Password</label>
                                      <input type="password" class="form-control" placeholder="Confirm Password" id="conf_password"/>
                                  </div>
                                  <button type="submit" class="btn btn-default">Submit</button>
                                  <button type="reset" class="btn btn-primary">Reset</button>
                                    
                               </form> 
                               <br>
                               
                               Already Registered?<a href="seller_login.jsp">   Login Now</a> 
                               <br>
                               <div>
						           		<h1 id="display" class=""></h1>
						       </div>
                      	</div>
                      	
                  	</div>
              	</div>
		</div>
		
		
		<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
		<script type="text/javascript">
			
		function Submit()
		{
			var userid = document.getElementById("username").value;
			var s_name = document.getElementById("s_name").value;
			var s_mobile = document.getElementById("s_mobile").value;
			var s_address = document.getElementById("s_address").value;
			var pass = document.getElementById("password").value;
			var conf_pass = document.getElementById("conf_password").value;
			
			if(pass == conf_pass)
				{
					$.ajax({
						url:"seller_signup",
						method:"post",
						data:{"username":userid,"s_name":s_name,"s_mobile":s_mobile,"s_address":s_address,"password":pass},
						success :function(response)
						{
							if(response ==="1")
								{
									document.getElementById('display').innerHTML="Registration Successfully.";
								}
							else
								{
									document.getElementById('display').innerHTML=" Not Registered.";
								}
						}
					})
				
				
				}
			else
				{
					alert("Password MisMatch");
				}
		}
		
		</script>
</body>
</html>