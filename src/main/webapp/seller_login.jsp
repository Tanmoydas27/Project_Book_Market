<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>seller-login-page</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="./style.css">
<jsp:include page="csslink.jsp"></jsp:include>
<style type="text/css">
	.login{
		width: 40%;
		margin-left: 30%;
		
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
		<div class="panel panel-default" >
                  <div class="panel-heading bg-default">
                      <span class="text-light">Seller Login</span>
                  </div>
                  <div class="panel-body login">
                      <div class="row">
                          <div class="col-md-6">
                              <h3>Login</h3>
                              <form onsubmit="event.preventDefault(); Login();">
                                  <div class="form-group">
                                      <label>Username:</label>
                                      <input type="email" class="form-control" placeholder="Enter Seller Email"  id="email"/>
                                  </div>
                                  <div class="form-group">
                                      <label>Password</label>
                                      <input type="text" class="form-control" placeholder="Enter Password" id="password" />
                                  </div>
                                  <button type="submit" class="btn btn-default">Login</button>
                                  <button type="reset" class="btn btn-primary">Reset</button> 
                               </form> 
                               <br>
                               
                               Not A User?<a href="seller_signup.jsp">Register Now</a> 
                               <br>
                               <div>
                               		<h1 id="display"></h1>
                               </div>
                      	</div>
                  	</div>
              	</div>
		</div>
		
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script type="text/javascript">


	function Login()
	{
		var Username = document.getElementById("email").value;
		var Password = document.getElementById("password").value;
		
		$.ajax({
			url:"seller_login",
			method:"post",
			data:{"email":Username,"password":Password},
			success :function(response)
			{
				if(response =="1")
					{
						document.getElementById('display').innerHTML="Login Successfully.";
						window.location.href="seller_index.jsp";
					}
				else
					{
						document.getElementById('display').innerHTML=" invalid Detailes.";
					}
			}
		})
	}
	
	
</script>
  
</body>
</html>