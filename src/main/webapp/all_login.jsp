<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All-Login-Page</title>

<jsp:include page="csslink.jsp"></jsp:include>
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
                <a class="navbar-brand" href="#">Book Market</a> 
            </div>
          </nav>
      </div>
      
      <div style="text-align: Center;margin-top: 10%;"><h1>Choose the Types Of Login</h1>
	
      
      <div class="row">
                <div class="col-md-3 col-sm-3">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             Seller Login
                         </div>
                        <div class="panel-body">
                           <a href="seller_login.jsp" class="btn btn-danger square-btn-adjust">Login</a>
                        </div>
                       <!-- 
                       <div class="panel-footer">
                            Panel Footer
                        </div>
                         --> 
                    </div>
                </div>
                <div class="col-md-3 col-sm-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Buyer Login
                        </div>
                        	
                         <div class="panel-body">
                                 <a href="buyer_index.jsp" class="btn btn-danger square-btn-adjust">Login</a>          
                        </div>
                       
                    </div>
                </div>
                <div class="col-md-3 col-sm-">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            Admin Login
                        </div>
                        <div class="panel-body">
                            <a href="#" class="btn btn-danger square-btn-adjust">Login</a>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
       
</body>
