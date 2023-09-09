 <%@page import="bean.Sellers"%>
<%
HttpSession session2 =request.getSession();
String userid = (String) session2.getAttribute("userid");

String url = request.getRequestURL().toString();
 url = url.substring(url.lastIndexOf("/")+1);
 
 Sellers s = new Sellers();
 s.setS_userid(userid);
 Sellers details =s.getSellerById();
%>
 <div id="wrapper">    <!-- /. NAV TOP  -->
	<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">
					<li class="text-center">
						<img src="assets/img/find_user.png" class="user-image img-responsive" />
					</li>
					<%
						
						if(url.equals("seller_index.jsp") || url.equals("seller_dashboard.jsp"))
						{
							out.println("<li>");
							out.println("<a  href='seller_dashboard.jsp' class='active-menu'><i class='fa fa-dashboard fa-3x'></i><span style='font-size: 150%;'>Dashboard</span></a>");
							out.println("</li>");
							
					
							
							out.println("<li>");
								out.println("<a href='seller_profile.jsp' ><i class='fa fa-user fa-3x'></i><span style='font-size: 150%; margin-left: 15px;''>Profile</span></a>");
							out.println("</li>");
							
							out.println("<li>");
								out.println("<a href='seller_book.jsp'><i class='fa fa-book fa-3x'></i><span style='font-size: 150%;''> Books</span></a>");
							out.println("</li>");
							
							out.println("<li>");
								out.println("<a href=''><i class='fa fa-shopping-cart fa-3x'></i> <span style='font-size: 150%;margin-left: 15px;'>Sell</span></a>");
							out.println("</li>");
							
							out.println("<li>");
								out.println("<a href='seller_login.jsp'><i class='fa fa-sign-out fa-3x'></i><span style='font-size: 150%; margin-left:15px;''>Logout</span></a>");
							out.println("</li>");
						}
						else if(url.equals("seller_profile.jsp"))
						{
							out.println("<li>");
							out.println("<a  href='seller_dashboard.jsp' ><i class='fa fa-dashboard fa-3x'></i><span style='font-size: 150%;'>Dashboard</span></a>");
							out.println("</li>");
							
							out.println("<li>");
								out.println("<a href='seller_profile.jsp' class='active-menu' ><i class='fa fa-user fa-3x'></i><span style='font-size: 150%; margin-left: 15px;''>Profile</span></a>");
							out.println("</li>");
							
							out.println("<li>");
								out.println("<a href='seller_book.jsp'><i class='fa fa-book fa-3x'></i><span style='font-size: 150%;''> Books</span></a>");
							out.println("</li>");
							
							out.println("<li>");
								out.println("<a href=''><i class='fa fa-shopping-cart fa-3x'></i> <span style='font-size: 150%;margin-left: 15px;'>Sell</span></a>");
							out.println("</li>");
							
							out.println("<li>");
								out.println("<a href='seller_login.jsp'><i class='fa fa-sign-out fa-3x'></i><span style='font-size: 150%; margin-left:15px;''>Logout</span></a>");
							out.println("</li>");
						}
						else if(url.equals("seller_book.jsp"))
						{
							out.println("<li>");
							out.println("<a  href='seller_dashboard.jsp' ><i class='fa fa-dashboard fa-3x'></i><span style='font-size: 150%;'>Dashboard</span></a>");
							out.println("</li>");
							
							out.println("<li>");
								out.println("<a href='seller_profile.jsp' ><i class='fa fa-user fa-3x'></i><span style='font-size: 150%; margin-left: 15px;''>Profile</span></a>");
							out.println("</li>");
							
							out.println("<li>");
								out.println("<a href='seller_book.jsp' class='active-menu'><i class='fa fa-book fa-3x'></i><span style='font-size: 150%;''> Books</span></a>");
							out.println("</li>");
							
							out.println("<li>");
								out.println("<a href=''><i class='fa fa-shopping-cart fa-3x'></i> <span style='font-size: 150%;margin-left: 15px;'>Sell</span></a>");
							out.println("</li>");
							
							out.println("<li>");
								out.println("<a href='slogout'><i class='fa fa-sign-out fa-3x'></i><span style='font-size: 150%; margin-left:15px;''>Logout</span></a>");
							out.println("</li>");
						}
						
					%>
				</ul>
			</div>
	</nav> 
</div>
