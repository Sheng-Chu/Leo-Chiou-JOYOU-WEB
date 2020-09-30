<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta charset="UTF-8" />
    <meta name="description" content="Ogani Template" />
    <meta name="keywords" content="Ogani, unica, creative, html" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>揪遊商城</title>
    <style>
      .wrapper {
        width: 850px;
        margin: 0px auto;
      }

      .clear {
        clear: both;
      }

      .items {
        display: block;
        margin: 20px 0;
        font-weight: bold;
      }

      .item {
        text-align: center;
        background-color: #fff;
        float: left;
        margin: 0 20px 0 20px;
        width: 240px;
        padding: 10px;
        height: 360px;
      }

      .item img {
        display: block;
        margin: auto;
      }

      .add-to-cart {
        background-color: white;
        color: #000079;
        text-transform: uppercase;
        font-weight: bold;
        cursor: pointer;
      }

      .add-to-cart:hover {
        background-color: #ffd306;
        color: #000079;
        text-transform: uppercase;
        font-weight: bold;
        cursor: pointer;
      }
    </style>

    <script type="text/javascript">
    
	
	
    </script>

    <!-- Google Font -->
    <link
      href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
      rel="stylesheet"
    />

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" />
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css" />
    <link rel="stylesheet" href="css/nice-select.css" type="text/css" />
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css" />
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css" />
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css" />
    <link rel="stylesheet" href="css/style.css" type="text/css" />
  </head>
<body>
    <jsp:include page="header.jsp" />

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <div class="breadcrumb__text">
              <h2>好友專區</h2>
              <div class="breadcrumb__option">
                <!-- <span>WELCOME</span> -->
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
      <div class="container">
        <div class="row">
          <div class="col-lg col-md">
            <div class="product__discount">
              <div class="section-title product__discount__title">
                <h2>好友列表</h2>
              </div>

              <div id="saleProduct"></div>
              <!-- 特價區 -->
            </div>
            <div class="filter__item">
              <div class="row">
                <div class="col-lg-4 col-md-5"></div>
                <div class="col-lg-4 col-md-4">
                  <div class="filter__found"></div>
                </div>
                <div class="col-lg-4 col-md-3">
                  <div class="filter__option">
                    <span class="icon_grid-2x2"></span>
                    <span class="icon_ul"></span>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-4 col-md-4 col-lg-4 col-xxl-2 mb-1">
                <div class="bg-white p-3 h-100">
                  <a href="FriendDetail.jsp">
                  <img class="img-thumbnail img-fluid rounded-circle mb-3 shadow-sm"
                      src="img/friendstest/friendtest01.jpg"
                      alt=""
                      width="100"></a>
                  <h4 class="mb-1">
                  <a href="FriendDetail.jsp">
                    <font color="black">多拉A夢</font></a>
                  </h4>
                  
                </div>
              </div>
              <div class="col-4 col-md-4 col-lg-4 col-xxl-2 mb-1">
                <div class="bg-white p-3 h-100">
                  <a href="FriendDetail02.jsp"
                    ><img
                      class="img-thumbnail img-fluid rounded-circle mb-3 shadow-sm"
                      src="img/friendstest/friendtest02.jpg"
                      alt=""
                      width="100"
                  /></a>
                  <h4 class="mb-1">
                    <a href="FriendDetail02.jsp"
                      ><font color="black">大象</font></a
                    >
                  </h4>
                </div>
              </div>
              <div class="col-4 col-md-4 col-lg-4 col-xxl-2 mb-1">
                <div class="bg-white p-3 h-100">
                  <a href="FriendDetail03.jsp"
                    ><img
                      class="img-thumbnail img-fluid rounded-circle mb-3 shadow-sm"
                      src="img/friendstest/friendtest03.jpg"
                      alt=""
                      width="100"
                  /></a>
                  <h4 class="mb-1">
                    <a href="FriendDetail03.jsp"
                      ><font color="black">迷你鼠</font></a
                    >
                  </h4>
                </div>
              </div>
              <div class="col-4 col-md-4 col-lg-4 col-xxl-2 mb-1">
                <div class="bg-white p-3 h-100">
                  <a href="FriendDetail04.jsp"
                    ><img
                      class="img-thumbnail img-fluid rounded-circle mb-3 shadow-sm"
                      src="img/friendstest/friendtest04.jpg"
                      alt=""
                      width="100"
                  /></a>
                  <h4 class="mb-1">
                    <a href="FriendDetail04.jsp"
                      ><font color="black">派大星</font></a
                    >
                  </h4>
                </div>
              </div>
               <div class="col-4 col-md-4 col-lg-4 col-xxl-2 mb-1">
                <div class="bg-white p-3 h-100">
                  <a href="FriendDetail05.jsp"
                    ><img
                      class="img-thumbnail img-fluid rounded-circle mb-3 shadow-sm"
                      src="img/friendstest/friendtest05.jpg"
                      alt=""
                      width="100"
                  /></a>
                  <h4 class="mb-1">
                    <a href="FriendDetail05.jsp"
                      ><font color="black">野餐</font></a
                    >
                  </h4>
                </div>
              </div>
               <div class="col-4 col-md-4 col-lg-4 col-xxl-2 mb-1">
                <div class="bg-white p-3 h-100">
                  <a href="FriendDetail06.jsp"
                    ><img
                      class="img-thumbnail img-fluid rounded-circle mb-3 shadow-sm"
                      src="img/friendstest/friendtest06.jpg"
                      alt=""
                      width="100"
                  /></a>
                  <h4 class="mb-1">
                    <a href="FriendDetail06.jsp"
                      ><font color="black">白熊問號</font></a
                    >
                  </h4>
                </div>
              </div>
              

              <!-- </div> -->
            </div>
            <div class="filter__item"></div>
            <div class="product__discount">
              <div class="section-title product__discount__title">
                <p class="precomm">推薦好友</p>
              </div>
            </div>
            <div class="row">
              <div class="col-4 col-md-4 col-lg-4 col-xxl-2 mb-1">
                <div class="bg-white p-3 h-100">
                  <a href="FriendDetail07.jsp"
                    ><img
                      class="img-thumbnail img-fluid rounded-circle mb-3 shadow-sm"
                      src="img/friendstest/friendtest07.jpg"
                      alt=""
                      width="100"
                  /></a>
                  <h4 class="mb-1">
                    <a href="FriendDetail07.jsp"
                      ><font color="black">無奈</font></a
                    >
                  </h4>
                </div>
              </div>
              <div class="col-4 col-md-4 col-lg-4 col-xxl-2 mb-1">
                <div class="bg-white p-3 h-100">
                  <a href="FriendDetail08.jsp"
                    ><img
                      class="img-thumbnail img-fluid rounded-circle mb-3 shadow-sm"
                      src="img/friendstest/friendtest08.jpg"
                      alt=""
                      width="100"
                  /></a>
                  <h4 class="mb-1">
                    <a href="FriendDetail08.jsp"
                      ><font color="black">皮卡皮卡</font></a
                    >
                  </h4>
                </div>
              </div>
              <div class="col-4 col-md-4 col-lg-4 col-xxl-2 mb-1">
                <div class="bg-white p-3 h-100">
                  <a href="FriendDetail09.jsp"
                    ><img
                      class="img-thumbnail img-fluid rounded-circle mb-3 shadow-sm"
                      src="img/friendstest/friendtest09.jpg"
                      alt=""
                      width="100"
                  /></a>
                  <h4 class="mb-1">
                    <a href="FriendDetail09.jsp"
                      ><font color="black">汪醬</font></a
                    >
                  </h4>
                </div>
              </div>
            </div>

            <div style="margin-left: 250px; margin-top: 50px"></div>
          </div>
        </div>
      </div>
    </section>

    <footer class="footer spad">
      <div class="container">
        <div class="row">
          <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="footer__about">
              <div class="footer__about__logo">
                <a href="./index.html"><img src="img/logo.png" alt="" /></a>
              </div>
              <ul>
                <li>Address: 60-49 Road 11378 New York</li>
                <li>Phone: 02-28825252</li>
                <li>Email: hello@colorlib.com</li>
              </ul>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
            <div class="footer__widget">
              <h6>Useful Links</h6>
              <ul>
                <li><a href="#">About Us</a></li>
                <li><a href="#">About Our Shop</a></li>
                <li><a href="#">Secure Shopping</a></li>
                <li><a href="#">Delivery infomation</a></li>
                <li><a href="#">Privacy Policy</a></li>
                <li><a href="#">Our Sitemap</a></li>
              </ul>
              <ul>
                <li><a href="#">Who We Are</a></li>
                <li><a href="#">Our Services</a></li>
                <li><a href="#">Projects</a></li>
                <li><a href="#">Contact</a></li>
                <li><a href="#">Innovation</a></li>
                <li><a href="#">Testimonials</a></li>
              </ul>
            </div>
          </div>
          <div class="col-lg-4 col-md-12">
            <div class="footer__widget">
              <h6>Join Our Newsletter Now</h6>
              <p>
                Get E-mail updates about our latest shop and special offers.
              </p>
              <form action="#">
                <input type="text" placeholder="Enter your mail" />
                <button type="submit" class="site-btn">Subscribe</button>
              </form>
              <div class="footer__widget__social">
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-instagram"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-pinterest"></i></a>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <div class="footer__copyright"></div>
          </div>
        </div>
      </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>
