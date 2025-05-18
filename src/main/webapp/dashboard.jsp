<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*, jakarta.servlet.*, jakarta.servlet.http.*" %>
<%@ page session="true" %>
<% String username=(String) session.getAttribute("username"); if (username==null) {
  response.sendRedirect("login.jsp"); return; } %>
<!DOCTYPE html>
<html>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>Dashboard | Rent C</title>

  <!-- slider stylesheet -->
  <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

  <!-- fonts style -->
  <link
          href="https://fonts.googleapis.com/css?family=Open+Sans:400,700|Poppins:400,600,700&display=swap"
          rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="css/responsive.css" rel="stylesheet" />
</head>

<body>
<div class="hero_area">
  <!-- header section strats -->
  <header class="header_section">
    <div class="container-fluid">
      <nav class="navbar navbar-expand-lg custom_nav-container">
        <a class="navbar-brand" href="dashboard.jsp">
                                        <span>
                                            Rent C
                                        </span>
        </a>

        <div class="navbar-collapse" id="">
          <div class="user_option">
            <a href="userAccount.jsp" style="color:white; margin-right: 15px;">My Account</a>
            <form action="logout" method="post" style="display:inline;">
              <button type="submit" class="btn btn-danger">Logout</button>
            </form>
          </div>
          <div class="custom_menu-btn">
            <button onclick="openNav()">
              <span class="s-1"> </span>
              <span class="s-2"> </span>
              <span class="s-3"> </span>
            </button>
          </div>
          <div id="myNav" class="overlay">
            <div class="overlay-content">
              <a href="dashboard.jsp">Dashboard</a>
              <a href="about.html">About</a>
              <a></a>
            </div>
          </div>
        </div>
      </nav>
    </div>
  </header>
  <!-- end header section -->



  <!-- slider section -->
  <section class=" slider_section position-relative">
    <div class="slider_container">
      <div class="img-box">
        <img src="images/hero-img.jpg" alt="">
      </div>
      <div class="detail_container">
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
          <div class="carousel-inner">
            <div class="carousel-item active">
              <div class="detail-box">
                <h1>
                  Rent Car <br>
                  Experts <br>
                  Service
                </h1>
                <a href="">
                  Contact Us
                </a>
              </div>
            </div>
            <div class="carousel-item">
              <div class="detail-box">
                <h1>
                  Rent Car <br>
                  Experts <br>
                  Service
                </h1>
                <a href="">
                  Contact Us
                </a>
              </div>
            </div>
            <div class="carousel-item">
              <div class="detail-box">
                <h1>
                  Rent Car <br>
                  Experts <br>
                  Service
                </h1>
                <a href="">
                  Contact Us
                </a>
              </div>
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleControls" role="button"
             data-slide="prev">
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleControls" role="button"
             data-slide="next">
            <span class="sr-only">Next</span>
          </a>
        </div>

      </div>
    </div>
  </section>
  <!-- end slider section -->
</div>

<!-- car section -->

<section class="car_section layout_padding2-top layout_padding-bottom">
  <div class="container">
    <div class="heading_container">
      <h2>
        Better Way For Find Your Favourite Cars
      </h2>
      <p>
        A Smarter Way to Discover Your Dream Car
      </p>
    </div>
    <div class="car_container">
      <div class="box">
        <div class="img-box">
          <img src="images/c-1.png" alt="">
        </div>
        <div class="detail-box">
          <h5>
            Choose Your Car
          </h5>
          <p>
            Browse through our wide range of vehicles and pick the one that suits your needs, lifestyle, and budget.
          </p>
        </div>
      </div>
      <div class="box">
        <div class="img-box">
          <img src="images/c-2.png" alt="">
        </div>
        <div class="detail-box">
          <h5>
            Get Your Car
          </h5>
          <p>
            Enjoy a smooth booking process with fast delivery or pickup. No long waits or hidden steps.
          </p>
        </div>
      </div>
      <div class="box">
        <div class="img-box">
          <img src="images/c-3.png" alt="">
        </div>
        <div class="detail-box">
          <h5>
            Contact Your Dealer
          </h5>
          <p>
            Need help or have questions? Our friendly dealers are just a call or message away.
          </p>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- end car section -->

<!-- about section -->

<section class="about_section layout_padding-bottom">
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-7 px-0">
        <div class="img-box">
          <img src="images/about-img.png" alt="">
        </div>
      </div>
      <div class="col-md-4 col-lg-3">
        <div class="detail-box">
          <h2>
            About Our Cars
          </h2>
          <p>
            Cars That Fit Every Drive
            We provide reliable, comfortable, and well-maintained cars that are ready for any journey. Whether it’s for daily commutes or weekend adventures, we’ve got you covered.
          </p>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- end about section -->


<!-- best section -->

<section class="best_section">
  <div class="container">
    <div class="book_now">
      <div class="detail-box">
        <h2>
          Our Best Cars Click to view Vehicles
        </h2>
        <p>

        </p>
      </div>
      <div class="btn-box">
        <a href="vehicleList" class="btn btn-danger">View Vehicles</a>

        </a>
      </div>
    </div>
  </div>
</section>

<!-- end best section -->



<!-- blog section -->

<section class="blog_section layout_padding">
  <div class="container">
    <div class="heading_container">
      <h2>
        Our Latest Blog
      </h2>
      <p>
        News, Tips & Auto Trends
        Stay updated with car news, maintenance tips, driving guides, and everything automotive. Fresh content to help you drive smart.
      </p>
    </div>
  </div>
  <div class="blog_container">
    <div class="layout_padding2-top">
      <div class="carousel-wrap ">
        <div class="owl-carousel">
          <div class="item">
            <div class="box">
              <div class="date-box">
                <h6>
                  04 Jan 2025
                </h6>
              </div>
              <div class="img-box">
                <img src="images/b-1.jpg" alt="">
              </div>
              <div class="detail-box">
                <h5>
                  Vintage
                </h5>
                <p>
                  A glamorous woman dressed in retro fashion sits behind the wheel of a vintage car. Her white scarf, chic sunglasses, and floral pastel outfit perfectly evoke a timeless era. The background bursts with natural light and greenery, enhancing the nostalgic vibe. </p>
              </div>
            </div>
          </div>
          <div class="item">
            <div class="box">
              <div class="date-box">
                <h6>
                  12 Feb 2025
                </h6>
              </div>
              <div class="img-box">
                <img src="images/b-2.jpg" alt="">
              </div>
              <div class="detail-box">
                <h5>
                  Steering wheels
                </h5>
                <p>
                  A nearly identical shot to Card 1, this image again highlights the elegance of the Mercedes-Benz interior. The luxury and comfort are accentuated by ambient lighting and the refined texture of the wheel and dashboard. </p>
              </div>
            </div>
          </div>
          <div class="item">
            <div class="box">
              <div class="date-box">
                <h6>
                  02 Mar 2025
                </h6>
              </div>
              <div class="img-box">
                <img src="images/b-3.jpg" alt="">
              </div>
              <div class="detail-box">
                <h5>
                  Buick Car
                </h5>
                <p>
                  A classic blue Buick with a white roof shines against a modern backdrop. Chrome accents, whitewall tires, and side portholes add vintage charm, set against a clean road and bright sky with blurred city elements behind. </p>
              </div>
            </div>
          </div>
          <div class="item">
            <div class="box">
              <div class="date-box">
                <h6>
                  24 Jan 2025
                </h6>
              </div>
              <div class="img-box">
                <img src="images/b-2.jpg" alt="">
              </div>
              <div class="detail-box">
                <h5>
                  Steering wheels
                </h5>
                <p>
                  A luxurious Mercedes-Benz AMG steering wheel dominates the interior view, framed by a polished dashboard and a modern digital display cluster. The hand gripping the wheel is stylishly dressed with a silver watch and a dark blue sleeve, adding a touch of elegance. </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- end blog section -->

<!-- us section -->

<section class="us_section">
  <div class="container">
    <div class="heading_container">
      <h2>
        Why choose Us
      </h2>
      <p>
        We Go the Extra Mile
      </p>
    </div>
  </div>
  <div class="us_container layout_padding2">
    <div class="content_box">
      <div class="box">
        <div class="img-box">
          <img src="images/u-1.png" alt="">
        </div>
        <div class="detail-box">
          <h5>
            Low Rent
          </h5>
        </div>
      </div>
      <div class="box">
        <div class="img-box">
          <img src="images/u-2.png" alt="">
        </div>
        <div class="detail-box">
          <h5>
            Fast Car
          </h5>
        </div>
      </div>
      <div class="box">
        <div class="img-box">
          <img src="images/u-3.png" alt="">
        </div>
        <div class="detail-box">
          <h5>
            Safe Car
          </h5>
        </div>
      </div>
      <div class="box">
        <div class="img-box">
          <img src="images/u-4.png" alt="">
        </div>
        <div class="detail-box">
          <h5>
            Quick Support
          </h5>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- end us section -->

<!-- client section -->

<section class="client_section layout_padding">
  <div class="container">
    <div class="heading_container">
      <h2>
        What Is say Customer
      </h2>
      <p>
        Loved by Our Customers
        Don’t just take our word for it. Hear what real customers say about their experience with Rent C. Reliable service. Happy drivers.
      </p>
    </div>
    <div class="layout_padding2-top">
      <div class="carousel-wrap ">
        <div class="owl-carousel">
          <div class="item">
            <div class="box">
              <div class="detail-box">
                <p>
                  "I had a fantastic experience with Rent C. The booking was easy and the car was in perfect condition. I’ll definitely use this service again!"
                </p>
              </div>
              <div class="client_id">
                <div class="img-box">
                  <img src="images/client-1.png" alt="" class="img-1">
                  <img src="images/client-1-white.png" alt="" class="img-2">
                </div>
                <div class="name">
                  <h6>
                    Jerad
                  </h6>
                  <p>
                    by the readable
                  </p>
                </div>
              </div>
            </div>
          </div>
          <div class="item">
            <div class="box">
              <div class="detail-box">
                <p>
                  "This was my first time using Rent C, and it won’t be my last. The vehicle was clean and ran perfectly. I had a stress-free journey thanks to their great service."
                </p>
              </div>
              <div class="client_id">
                <div class="img-box">
                  <img src="images/client-2.png" alt="" class="img-1">
                  <img src="images/client-2-white.png" alt="" class="img-2">
                </div>
                <div class="name">
                  <h6>
                    Chethana
                  </h6>
                  <p>
                    by the readable
                  </p>
                </div>
              </div>
            </div>
          </div>
          <div class="item">
            <div class="box">
              <div class="detail-box">
                <p>
                  "Really impressed with how quickly I was able to get my car. It drove smoothly and had no issues. Will be renting again soon!"
                </p>
              </div>
              <div class="client_id">
                <div class="img-box">
                  <img src="images/client-1.png" alt="" class="img-1">
                  <img src="images/client-1-white.png" alt="" class="img-2">
                </div>
                <div class="name">
                  <h6>
                    Nadeesha
                  </h6>
                  <p>
                    by the readable
                  </p>
                </div>
              </div>
            </div>
          </div>
          <div class="item">
            <div class="box">
              <div class="detail-box">
                <p>
                  "Rent C made my trip so much better. The car was in great condition and perfect for long drives. I’ll recommend this to my friends for sure.
                </p>
              </div>
              <div class="client_id">
                <div class="img-box">
                  <img src="images/client-1.png" alt="" class="img-1">
                  <img src="images/client-1-white.png" alt="" class="img-2">
                </div>
                <div class="name">
                  <h6>
                    Kavindu
                  </h6>
                  <p>
                    by the readable
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>
</section>

<!-- end client section -->

<!-- contact section -->

<section class="contact_section layout_padding">
  <div class="container">
    <div class="heading_container">
      <h2>
        Contact Us for More Details
      </h2>
    </div>

    <div class="contact_items">

      <a>
        <div class="img-box">
          <img src="images/location.png" alt="">
        </div>
        <h6>
          Rental C, Pittugala, Kaduwela
        </h6>
      </a>
      <a>
        <div class="img-box">
          <img src="images/call.png" alt="">
        </div>
        <h6>
          (+94) 112 558 558
        </h6>
      </a>
      <a>
        <div class="img-box">
          <img src="images/mail.png" alt="">
        </div>
        <h6>
          rentalc@gmail.com
        </h6>
      </a>

    </div>
    <div class="social_container">
      <div class="social-box">
        <div>
          <a href="">
            <img src="images/fb.png" alt="">
          </a>
        </div>
        <div>
          <a href="">
            <img src="images/twitter.png" alt="">
          </a>
        </div>
        <div>
          <a href="">
            <img src="images/linkedin.png" alt="">
          </a>
        </div>
        <div>
          <a href="">
            <img src="images/insta.png" alt="">
          </a>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- end contact section -->

<!-- map section -->

<section class="map_section">
  <!-- map section -->
  <div class="map_container">
    <div class="map-responsive">
      <iframe
              src="https://www.google.com/maps/embed/v1/place?key=AIzaSyA0s1a7phLN0iaD6-UE7m4qP-z21pH0eSc&q=SLIIT+Malabe+Campus,Sri+Lanka"
              width="600" height="300" frameborder="0" style="border:0; width: 100%; height:100%"
              allowfullscreen>
      </iframe>
    </div>
  </div>
  <!-- end map section -->
</section>



<!-- end map section -->

<!-- footer section -->
<footer class="container-fluid footer_section">
  <p>
    Copyright &copy; 2025 All Rights Reserved. Design by Design by P062 Group
  </p>
</footer>
<!-- footer section -->

<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
</script>
<script src="js/custom.js"></script>


<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<script src="js/custom.js"></script>



</body>

</html>