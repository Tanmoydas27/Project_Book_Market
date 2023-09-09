<%
String url = request.getRequestURL().toString();
url = url.substring(url.lastIndexOf("/")+1);

HttpSession session2 = request.getSession();
String b_id = (String) session2.getAttribute("buyer_userid");
out.println(b_id);

%>

<div class="hero_area">
    <!-- header section strats -->
    <header class="header_section">
      <nav class="navbar navbar-expand-lg custom_nav-container ">
        <a class="navbar-brand" href="buyer_index.jsp">
          <span>
            Book Market
          </span>
        </a>

        
          
          <%
          
	          out.println("<div class='collapse navbar-collapse' id='navbarSupportedContent'>");
	          out.println("<ul class='navbar-nav'>");
          
          	if(url.equals("buyer_index.jsp") || url.equals("buyer_dashboard.jsp"))
          	{
          		out.println("<li class='nav-item active'>");
	                 out.println("<a class='nav-link' href='buyer_index.jsp'>Home <span class='sr-only'>(current)</span></a>");
	             out.println("</li>");
	             
	         	out.println("<li class='nav-item'>");
	            	out.println("<a class='nav-link' href='buyer_books.jsp'>");
	  					out.println("Books");
	  	   			out.println("</a>");
	  			out.println("</li>");
				if(b_id != null)
				{
					out.println("<li class='nav-item'>");
	            	out.println("<a class='nav-link' href='buyer_profile.jsp'>");
	  					out.println("Profile");
	  	   			out.println("</a>");
	  				out.println("</li>");
	  				
	  				out.println("<li class='nav-item'>");
	            	out.println("<a class='nav-link' href='buyer_orders.jsp'>");
	  					out.println("Orders");
	  	   			out.println("</a>");
	  				out.println("</li>");
				}

	  			out.println(" <li class='nav-item'>");
	            	out.println("<a class='nav-link' href='buyer_service.jsp'>");
	  					out.println("Service");
	  	   			out.println("</a>");
	  			out.println("</li>");


	  			out.println(" <li class='nav-item'>");
	            	out.println("<a class='nav-link' href='buyer_about.jsp'>");
	  					out.println("About");
	  	   			out.println("</a>");
	  			out.println("</li>");
	  			
	  			
	  			out.println("<div class='user_option'>");
	          	if(b_id != null)
	          	{
	          		out.println("<a href='blogout'>");
	                	out.println("<i class='fa fa-user' aria-hidden='true'></i>");
	                	out.println("<span>");
	                  		out.println("Logout");
	                	out.println("</span>");
	             	out.println("</a>");
	          	}
	          	else
	          	{
	          		out.println("<a href='buyer_login.jsp'>");
	            	out.println("<i class='fa fa-user' aria-hidden='true'></i>");
	            	out.println("<span>");
	              		out.println("Login");
	            	out.println("</span>");
	         		out.println("</a>");
	          	}
	          	
	          	if(b_id != null)
	          	{
	          		out.println("<a href='buyer_viewcart.jsp'>");
	            		out.println("<i class='fa fa-shopping-bag' aria-hidden='true'></i>");
	          		out.println("</a>");
	          	}
	          	else
	          	{
	          		out.println("<a href='buyer_login.jsp'>");
	            		out.println("<i class='fa fa-shopping-bag' aria-hidden='true'></i>");
	          		out.println("</a>");
	          	}
	          	
	          	out.println("<form class='form-inline'>");
	            	out.println("<button class='btn nav_search-btn' type='submit'>");
	              		out.println("<i class='fa fa-search' aria-hidden='true'></i>");
	            	out.println("</button>");
			          out.println("</form>");
			        out.println("</div>");
			    out.println("</div>");
          	}
          	else if(url.equals("buyer_books.jsp"))
          	{
          		out.println("<li class='nav-item'>");
               		 out.println("<a class='nav-link' href='buyer_index.jsp'>Home <span class='sr-only'>(current)</span></a>");
	            out.println("</li>");
	            
	        	out.println("<li class='nav-item active'>");
	           	out.println("<a class='nav-link' href='buyer_books.jsp'>");
	 					out.println("Books");
	 	   			out.println("</a>");
	 			out.println("</li>");
				
	 			if(b_id != null)
				{
					out.println("<li class='nav-item'>");
	            	out.println("<a class='nav-link' href='buyer_profile.jsp'>");
	  					out.println("Profile");
	  	   			out.println("</a>");
	  				out.println("</li>");
	  				
	  				out.println("<li class='nav-item'>");
	            	out.println("<a class='nav-link' href='buyer_orders.jsp'>");
	  					out.println("Orders");
	  	   			out.println("</a>");
	  				out.println("</li>");
				}
	
	
	 			out.println(" <li class='nav-item'>");
	           	out.println("<a class='nav-link' href='buyer_service.jsp'>");
	 					out.println("Service");
	 	   			out.println("</a>");
	 			out.println("</li>");
	
	
	
	
	 			out.println(" <li class='nav-item'>");
	           	out.println("<a class='nav-link' href='buyer_about.jsp'>");
	 					out.println("About");
	 	   			out.println("</a>");
	 			out.println("</li>");
	
	
	 			out.println("<div class='user_option'>");
	          	if(b_id != null)
	          	{
	          		out.println("<a href='blogout'>");
	                	out.println("<i class='fa fa-user' aria-hidden='true'></i>");
	                	out.println("<span>");
	                  		out.println("Logout");
	                	out.println("</span>");
	             	out.println("</a>");
	          	}
	          	else
	          	{
	          		out.println("<a href='buyer_login.jsp'>");
	            	out.println("<i class='fa fa-user' aria-hidden='true'></i>");
	            	out.println("<span>");
	              		out.println("Login");
	            	out.println("</span>");
	         		out.println("</a>");
	          	}
	          	
	          	if(b_id != null)
	          	{
	          		out.println("<a href='buyer_viewcart.jsp'>");
	            		out.println("<i class='fa fa-shopping-bag' aria-hidden='true'></i>");
	          		out.println("</a>");
	          	}
	          	else
	          	{
	          		out.println("<a href='buyer_login.jsp'>");
	            		out.println("<i class='fa fa-shopping-bag' aria-hidden='true'></i>");
	          		out.println("</a>");
	          	}
	          	
	          		out.println("<form class='form-inline'>");
		            	out.println("<button class='btn nav_search-btn' type='submit'>");
		              		out.println("<i class='fa fa-search' aria-hidden='true'></i>");
		            	out.println("</button>");
			          out.println("</form>");
			        out.println("</div>");
			      out.println("</div>");
          	}
          	else if(url.equals("buyer_service.jsp"))
          	{
          		out.println("<li class='nav-item'>");
               		 out.println("<a class='nav-link' href='buyer_index.jsp'>Home <span class='sr-only'>(current)</span></a>");
	            out.println("</li>");
	            
	        	out.println("<li class='nav-item'>");
	           	out.println("<a class='nav-link' href='buyer_books.jsp'>");
	 					out.println("Books");
	 	   			out.println("</a>");
	 			out.println("</li>");
	
	 			if(b_id != null)
				{
					out.println("<li class='nav-item'>");
	            	out.println("<a class='nav-link' href='buyer_profile.jsp'>");
	  					out.println("Profile");
	  	   			out.println("</a>");
	  				out.println("</li>");
	  				
	  				out.println("<li class='nav-item'>");
	            	out.println("<a class='nav-link' href='buyer_orders.jsp'>");
	  					out.println("Orders");
	  	   			out.println("</a>");
	  				out.println("</li>");
				}
	
	 			out.println(" <li class='nav-item active'>");
	           	out.println("<a class='nav-link' href='buyer_service.jsp'>");
	 					out.println("Service");
	 	   			out.println("</a>");
	 			out.println("</li>");
	
	
	
	
	 			out.println(" <li class='nav-item'>");
	           	out.println("<a class='nav-link' href='buyer_about.jsp'>");
	 					out.println("About");
	 	   			out.println("</a>");
	 			out.println("</li>");
	
	
	 			
	 			out.println("<div class='user_option'>");
	          	if(b_id != null)
	          	{
	          		out.println("<a href='blogout'>");
	                	out.println("<i class='fa fa-user' aria-hidden='true'></i>");
	                	out.println("<span>");
	                  		out.println("Logout");
	                	out.println("</span>");
	             	out.println("</a>");
	          	}
	          	else
	          	{
	          		out.println("<a href='buyer_login.jsp'>");
	            	out.println("<i class='fa fa-user' aria-hidden='true'></i>");
	            	out.println("<span>");
	              		out.println("Login");
	            	out.println("</span>");
	         		out.println("</a>");
	          	}
	          	
	          	if(b_id != null)
	          	{
	          		out.println("<a href='buyer_viewcart.jsp'>");
	            		out.println("<i class='fa fa-shopping-bag' aria-hidden='true'></i>");
	          		out.println("</a>");
	          	}
	          	else
	          	{
	          		out.println("<a href='buyer_login.jsp'>");
	            		out.println("<i class='fa fa-shopping-bag' aria-hidden='true'></i>");
	          		out.println("</a>");
	          	}
	          	
		          	out.println("<form class='form-inline'>");
		            	out.println("<button class='btn nav_search-btn' type='submit'>");
		              		out.println("<i class='fa fa-search' aria-hidden='true'></i>");
		            	out.println("</button>");
			          out.println("</form>");
			        out.println("</div>");
			      out.println("</div>");
	
          	}
          	else if(url.equals("buyer_about.jsp"))
          	{
          		out.println("<li class='nav-item'>");
               		 out.println("<a class='nav-link' href='buyer_index.jsp'>Home <span class='sr-only'>(current)</span></a>");
	            out.println("</li>");
	            
	        	out.println("<li class='nav-item'>");
	           	out.println("<a class='nav-link' href='buyer_books.jsp'>");
	 					out.println("Books");
	 	   			out.println("</a>");
	 			out.println("</li>");
	
	 			if(b_id != null)
				{
					out.println("<li class='nav-item'>");
	            	out.println("<a class='nav-link' href='buyer_profile.jsp'>");
	  					out.println("Profile");
	  	   			out.println("</a>");
	  				out.println("</li>");
	  				
	  				out.println("<li class='nav-item'>");
	            	out.println("<a class='nav-link' href='buyer_orders.jsp'>");
	  					out.println("Orders");
	  	   			out.println("</a>");
	  				out.println("</li>");
				}
	
	 			out.println(" <li class='nav-item'>");
	           	out.println("<a class='nav-link' href='buyer_service.jsp'>");
	 					out.println("Service");
	 	   			out.println("</a>");
	 			out.println("</li>");
	
	 			out.println(" <li class='nav-item active'>");
	           	out.println("<a class='nav-link' href='buyer_about.jsp'>");
	 					out.println("About");
	 	   			out.println("</a>");
	 			out.println("</li>");
	 			
	 			
	 			out.println("<div class='user_option'>");
	          	if(b_id != null)
	          	{
	          		out.println("<a href='blogout'>");
	                	out.println("<i class='fa fa-user' aria-hidden='true'></i>");
	                	out.println("<span>");
	                  		out.println("Logout");
	                	out.println("</span>");
	             	out.println("</a>");
	          	}
	          	else
	          	{
	          		out.println("<a href='buyer_login.jsp'>");
	            	out.println("<i class='fa fa-user' aria-hidden='true'></i>");
	            	out.println("<span>");
	              		out.println("Login");
	            	out.println("</span>");
	         		out.println("</a>");
	          	}
	          	
	          	if(b_id != null)
	          	{
	          		out.println("<a href='buyer_viewcart.jsp'>");
	            		out.println("<i class='fa fa-shopping-bag' aria-hidden='true'></i>");
	          		out.println("</a>");
	          	}
	          	else
	          	{
	          		out.println("<a href='buyer_login.jsp'>");
	            		out.println("<i class='fa fa-shopping-bag' aria-hidden='true'></i>");
	          		out.println("</a>");
	          	}
	          	
		          	out.println("<form class='form-inline'>");
		            	out.println("<button class='btn nav_search-btn' type='submit'>");
		              		out.println("<i class='fa fa-search' aria-hidden='true'></i>");
			            out.println("</button>");
			          out.println("</form>");
			        out.println("</div>");
			      out.println("</div>");
          	}
          	else if(url.equals("buyer_profile.jsp"))
          	{
          		out.println("<li class='nav-item'>");
               		 out.println("<a class='nav-link' href='buyer_index.jsp'>Home <span class='sr-only'>(current)</span></a>");
	            out.println("</li>");
	            
	        	out.println("<li class='nav-item'>");
	           	out.println("<a class='nav-link' href='buyer_books.jsp'>");
	 					out.println("Books");
	 	   			out.println("</a>");
	 			out.println("</li>");
	
	 			if(b_id != null)
				{
					out.println("<li class='nav-item active'>");
	            	out.println("<a class='nav-link' href='buyer_profile.jsp'>");
	  					out.println("Profile");
	  	   			out.println("</a>");
	  				out.println("</li>");
	  				
	  				out.println("<li class='nav-item'>");
	            	out.println("<a class='nav-link' href='buyer_orders.jsp'>");
	  					out.println("Orders");
	  	   			out.println("</a>");
	  				out.println("</li>");
				}
	
	 			out.println(" <li class='nav-item'>");
	           	out.println("<a class='nav-link' href='buyer_service.jsp'>");
	 					out.println("Service");
	 	   			out.println("</a>");
	 			out.println("</li>");
	
	 			out.println(" <li class='nav-item'>");
	           	out.println("<a class='nav-link' href='buyer_about.jsp'>");
	 					out.println("About");
	 	   			out.println("</a>");
	 			out.println("</li>");
	 			
	 			
	 			out.println("<div class='user_option'>");
	          	if(b_id != null)
	          	{
	          		out.println("<a href='blogout'>");
	                	out.println("<i class='fa fa-user' aria-hidden='true'></i>");
	                	out.println("<span>");
	                  		out.println("Logout");
	                	out.println("</span>");
	             	out.println("</a>");
	          	}
	          	else
	          	{
	          		out.println("<a href='buyer_login.jsp'>");
	            	out.println("<i class='fa fa-user' aria-hidden='true'></i>");
	            	out.println("<span>");
	              		out.println("Login");
	            	out.println("</span>");
	         		out.println("</a>");
	          	}
	          	
	          	if(b_id != null)
	          	{
	          		out.println("<a href='buyer_viewcart.jsp'>");
	            		out.println("<i class='fa fa-shopping-bag' aria-hidden='true'></i>");
	          		out.println("</a>");
	          	}
	          	else
	          	{
	          		out.println("<a href='buyer_login.jsp'>");
	            		out.println("<i class='fa fa-shopping-bag' aria-hidden='true'></i>");
	          		out.println("</a>");
	          	}
	          	
	          		out.println("<form class='form-inline'>");
		            	out.println("<button class='btn nav_search-btn' type='submit'>");
		              		out.println("<i class='fa fa-search' aria-hidden='true'></i>");
		            	out.println("</button>");
		          	out.println("</form>");
		        out.println("</div>");
	      		out.println("</div>");
          	}
          	else if(url.equals("buyer_orders.jsp"))
          	{
          		out.println("<li class='nav-item'>");
               		 out.println("<a class='nav-link' href='buyer_index.jsp'>Home <span class='sr-only'>(current)</span></a>");
	            out.println("</li>");
	            
	        	out.println("<li class='nav-item'>");
	           	out.println("<a class='nav-link' href='buyer_books.jsp'>");
	 					out.println("Books");
	 	   			out.println("</a>");
	 			out.println("</li>");
	
	 			if(b_id != null)
				{
					out.println("<li class='nav-item'>");
	            	out.println("<a class='nav-link' href='buyer_profile.jsp'>");
	  					out.println("Profile");
	  	   			out.println("</a>");
	  				out.println("</li>");
	  				
	  				out.println("<li class='nav-item active'>");
	            	out.println("<a class='nav-link' href='buyer_orders.jsp'>");
	  					out.println("Orders");
	  	   			out.println("</a>");
	  				out.println("</li>");
				}
	
	 			out.println(" <li class='nav-item'>");
	           	out.println("<a class='nav-link' href='buyer_service.jsp'>");
	 					out.println("Service");
	 	   			out.println("</a>");
	 			out.println("</li>");
	
	 			out.println(" <li class='nav-item'>");
	           	out.println("<a class='nav-link' href='buyer_about.jsp'>");
	 					out.println("About");
	 	   			out.println("</a>");
	 			out.println("</li>");
	 			
	 			
	 			out.println("<div class='user_option'>");
	          	if(b_id != null)
	          	{
	          		out.println("<a href='blogout'>");
	                	out.println("<i class='fa fa-user' aria-hidden='true'></i>");
	                	out.println("<span>");
	                  		out.println("Logout");
	                	out.println("</span>");
	             	out.println("</a>");
	          	}
	          	else
	          	{
	          		out.println("<a href='buyer_login.jsp'>");
	            	out.println("<i class='fa fa-user' aria-hidden='true'></i>");
	            	out.println("<span>");
	              		out.println("Login");
	            	out.println("</span>");
	         		out.println("</a>");
	          	}
	          	
	          	if(b_id != null)
	          	{
	          		out.println("<a href='buyer_viewcart.jsp'>");
	            		out.println("<i class='fa fa-shopping-bag' aria-hidden='true'></i>");
	          		out.println("</a>");
	          	}
	          	else
	          	{
	          		out.println("<a href='buyer_login.jsp'>");
	            		out.println("<i class='fa fa-shopping-bag' aria-hidden='true'></i>");
	          		out.println("</a>");
	          	}
	          	
	          	out.println("<form class='form-inline'>");
	            	out.println("<button class='btn nav_search-btn' type='submit'>");
	              		out.println("<i class='fa fa-search' aria-hidden='true'></i>");
		            out.println("</button>");
		          out.println("</form>");
			       out.println("</div>");
			    out.println("</div>");
          	}
          	else if(url.equals("buyer_viewcart.jsp"))
          	{
          		out.println("<li class='nav-item'>");
          		 out.println("<a class='nav-link' href='buyer_index.jsp'>Home <span class='sr-only'>(current)</span></a>");
		        out.println("</li>");
		           
		       		out.println("<li class='nav-item'>");
		          		out.println("<a class='nav-link' href='buyer_books.jsp'>");
							out.println("Books");
			   			out.println("</a>");
					out.println("</li>");
		
					if(b_id != null)
					{
						out.println("<li class='nav-item'>");
		           			out.println("<a class='nav-link' href='buyer_profile.jsp'>");
		 						out.println("Profile");
		 	   				out.println("</a>");
		 				out.println("</li>");
		 				
		 				out.println("<li class='nav-item'>");
			           		out.println("<a class='nav-link' href='buyer_orders.jsp'>");
			 					out.println("Orders");
			 	   			out.println("</a>");
		 				out.println("</li>");
					}
		
					out.println(" <li class='nav-item'>");
		          	out.println("<a class='nav-link' href='buyer_service.jsp'>");
							out.println("Service");
			   			out.println("</a>");
					out.println("</li>");
		
					out.println(" <li class='nav-item'>");
		          	out.println("<a class='nav-link' href='buyer_about.jsp'>");
							out.println("About");
			   			out.println("</a>");
					out.println("</li>");
					
					
					out.println("<div class='user_option'>");
		         	if(b_id != null)
		         	{
		         		out.println("<a href='blogout'>");
		               	out.println("<i class='fa fa-user' aria-hidden='true'></i>");
		               	out.println("<span>");
		                 		out.println("Logout");
		               	out.println("</span>");
		            	out.println("</a>");
		         	}
		         	else
		         	{
		         		out.println("<a href='buyer_login.jsp'>");
		           	out.println("<i class='fa fa-user' aria-hidden='true'></i>");
		           	out.println("<span>");
		             		out.println("Login");
		           	out.println("</span>");
		        		out.println("</a>");
		         	}
		         	
		         	if(b_id != null)
		         	{
	         		
		         		out.println("<a href='buyer_viewcart.jsp' class='nav-item active'>");
		           			out.println("<i class='fa fa-shopping-bag' aria-hidden='true'></i>");
		         		out.println("</a>");
		         	}
		         	else
		         	{
		         		out.println("<a href='buyer_login.jsp'>");
		           			out.println("<i class='fa fa-shopping-bag' aria-hidden='true'></i>");
		         		out.println("</a>");
		         	}
		         	
		         	out.println("<form class='form-inline'>");
		           	out.println("<button class='btn nav_search-btn' type='submit'>");
		             		out.println("<i class='fa fa-search' aria-hidden='true'></i>");
			            out.println("</button>");
			          out.println("</form>");
				       out.println("</div>");
				    out.println("</div>");
          	}
          out.println("</ul>");
          
          %>            
            
      </nav>
    </header>
 </div>