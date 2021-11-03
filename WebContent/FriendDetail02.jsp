<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="zxx">
  <head>
    <meta charset="UTF-8" />
    <meta name="description" content="Ogani Template" />
    <meta name="keywords" content="Ogani, unica, creative, html" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>好友資料</title>
    <script
      type="text/javascript"
      src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"
    ></script>
        <script type="text/javascript">
	window.onload = function() {
	
		var inputValue = document.getElementById('TestGameTypeTxt');
		var searchxhr = new XMLHttpRequest();


		var xhr2 = new XMLHttpRequest();


		inputValue.onclick = function() {
			//				window.alert(999);
			searchxhr.onreadystatechange = function() {
				if (searchxhr.readyState == 4 && searchxhr.status == 200) {
					displaySearchProducts(searchxhr.responseText);
				}
			}
			searchxhr.open("GET",
					"<c:url value='/FriendsRecommendServlet.do' />"
							+ "?TestGameTypeTxt=" + inputValue.value, true);
			searchxhr.send();
		}




		function displaySearchProducts(searchresponseData) {

			var content = "<div class='row'></div>";
			var data = searchresponseData.split("&&&");
			var RecommendFriends = JSON.parse(data[0]);

			for (var i = 0; i < RecommendFriends.length; i++) {

				content += '<div class="col-4 col-md-4 col-lg-4 col-xxl-2 mb-1" style="float: left;">';
				content += '<div class="bg-white p-3 h-100">';
				content += "<a href='${pageContext.request.contextPath}/ShowSingalFriendServlet.do?"
						+ "imageFileName="
						+ RecommendFriends[i].imageFileName
						+ "&id="
						+ RecommendFriends[i].id
						+ "&nickname="
						+ RecommendFriends[i].nickname
						+ "&mail="
						+ RecommendFriends[i].mail
						+ "&phone="
						+ RecommendFriends[i].phone
						+ "&gender="
						+ RecommendFriends[i].gender
						+ "&preferGameType="
						+ RecommendFriends[i].preferGameType + "'>"
				content += "<img class='img-thumbnail img-fluid rounded-circle mb-3 shadow-sm' src='up_NoUsed/"+RecommendFriends[i].imageFileName+"'alt='' width='100' /></a>";
				content += '<div class="primary-btn" style="background: #FFFFFF;vertical-align: middle;">';
				content += '<p style="font-size: 16px ;line-height: 10px;">性別:</p>';
				content += '<p style="font-size: 16px ;line-height: 10px;">'
						+ RecommendFriends[i].gender + '</p>';
				content += '</div>';
				content += '<h4 class="mb-1">' + RecommendFriends[i].nickname
						+ '</h4>';
				content += '</div>';
				content += '</div>';

			}
			document.getElementById("pageProduct").innerHTML = content;
		}

	}


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

    <script></script>
  </head>

  <body>
    <jsp:include page="header.jsp" />

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <div class="breadcrumb__text">
              <h2>好友資料</h2>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 col-md-6">
            <div class="product__details__pic">
              <div class="product__details__pic__item">
                <img
                  class="product__details__pic__item--large"
                  src="up_NoUsed/${picturepath}"/>
              </div>
            </div>
          </div>
          <div class="col-lg-6 col-md-6">
            <div class="product__details__text">
              <h3><font color="black">${nickname}</font></h3>
              <div class="frienddata">
               		 ID:
                <div class="datacontent">${friends_numbs}</div>
              </div>
              <div class="frienddata">
               		 性別:
                <div class="datacontent">${gender}</div>
              </div>
              <div class="frienddata">
                	遊戲偏好:
                <div class="datacontent">${typeName}</div>
              </div>
              <div class="frienddata">
               		 信箱:
                <div class="datacontent">${mail}</div>
              </div>
              <br />
              <form action="<c:url value='/FriendsDelete.do'/>" method="post" enctype="multipart/form-data">
			  	<div class="input-group mg-b-pro-edt">
					<input type="text" name="memID" class="form-control" value="${friends_numbs}" style="display:none"/>
				</div>
				<button type="submit" name="Submit" class="primary-btn" style="color: #AE0000;background: gray;">
					<i class="fa fa-plus"></i>刪除好友
				</button>
				<p>
					<span>${InsertMsg}</span>
				</p>
			</form>
          </div>
         
        </div>
      </div>
    </section>
    <!-- Product Details Section End -->

    <!-- Related Product Section Begin -->
        <section class="container">
      	<div class="product__discount">
			<div class="section-title product__discount__title">
				<h2>推薦好友</h2>
			</div>
		</div>
		<div class="filter__item">
			<div class="row">
				<div class="col-lg-4 col-md-5">
					<input id="TestGameTypeTxt" type="button" value="重新推薦"
						style="font-weight: bold; width: 80px; height: 30px; border: none; background-color: #FFD306">
				</div>
				<div class="col-lg-4 col-md-4">
					<div class="filter__found"></div>
				</div>
				<div class="col-lg-4 col-md-3">
					<div class="filter__option">
						<span class="icon_grid-2x2"></span> <span class="icon_ul"></span>
					</div>
				</div>
			</div>
		</div>
	<div class="row" id="pageProduct">
						<!--推薦好友清單 -->

<!-- 						</div> -->
</div>
</section>
    <!-- Related Product Section End -->

    <!-- Footer Section Begin -->
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
                <li>Phone: +65 11.188.888</li>
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
            <div class="footer__copyright">
              <div class="footer__copyright__text">
                <p>
                  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                  Copyright &copy;
                  <script>
                    document.write(new Date().getFullYear());
                  </script>
                  All rights reserved | This template is made with
                  <i class="fa fa-heart" aria-hidden="true"></i> by
                  <a href="https://colorlib.com" target="_blank">Colorlib</a>
                  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                </p>
              </div>
              <div class="footer__copyright__payment">
                <img src="img/payment-item.png" alt="" />
              </div>
            </div>
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
