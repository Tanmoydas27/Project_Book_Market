<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>buyer-about</title>
<jsp:include page="buyercsslink.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="buyer_header.jsp"></jsp:include>
	
	<section class="contact_section layout_padding">
    <div class="container px-0">
      <div class="heading_container ">
        <h2 class="">
          Contact Us
        </h2>
      </div>
    </div>
    <div class="container container-bg">
      <div class="row">
        <div class="col-lg-7 col-md-6 px-0">
          <div class="map_container">
            <div class="map-responsive">
            	<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d230.119373371113!2d88.39237111934759!3d22.65714494297568!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39f89d2180ec1e1b%3A0xa53c72706cd27c4b!2sPriyajan%20Apartment!5e0!3m2!1sen!2sin!4v1690537629451!5m2!1sen!2sin" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-5 px-0">
          <form action="#">
            <div>
              <input type="text" placeholder="Name" />
            </div>
            <div>
              <input type="email" placeholder="Email" />
            </div>
            <div>
              <input type="text" placeholder="Phone" />
            </div>
            <div>
              <input type="text" class="message-box" placeholder="Message" />
            </div>
            <div class="d-flex ">
              <button>
                SEND
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </section>
	
	
	<jsp:include page="buyer_footer.jsp"></jsp:include>
	<jsp:include page="buyerjslink.jsp"></jsp:include>
</body>
</html>