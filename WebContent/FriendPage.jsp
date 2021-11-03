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
	
	let number = "3";//數字依照自己頁面調整
	let x = localStorage.getItem('foot');
	x=x+number;
	localStorage.setItem('foot',x);
	
	
	console.log(localStorage.getItem('foot'));

	
</script>
<script type="text/javascript">
	window.onload = function() {
		var friends_numbs = document.getElementById("friends_numbs");
		var friendId = document.getElementById("friendId");
		var account = document.getElementById("account");
		var mail = document.getElementById("mail");
		var nickname = document.getElementById("nickname");
		var phone = document.getElementById("phone");
		var gender = document.getElementById("gender");
		var picturepath = document.getElementById("picturepath");
		var gametypeid = document.getElementById("gametypeid");

		var inputValue = document.getElementById('TestGameTypeTxt');
		var searchxhr = new XMLHttpRequest();

		var xhr = new XMLHttpRequest();
		var xhr2 = new XMLHttpRequest();
		//用memberId 取出所有的friendList
		xhr.open("GET", "<c:url value='/FriendsaPage.do'/>", true);
		xhr.send();

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

		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				if (xhr.status == 200) {
					var responseData = xhr.responseText;
					//這裡是回傳的資料
					displayFriends(responseData);
				}
			}
		}
		function displayFriends(responseData) {

			var content = "";

			var friends = JSON.parse(responseData);
			for (var i = 0; i < friends.length; i++) {

				content += '<div class="col-4 col-md-4 col-lg-4 col-xxl-2 mb-1">';
				content += '<div class="bg-white p-3 h-100">';
				content += '<a href="${pageContext.request.contextPath}//FriendsDetail.do?'
						+ 'friends_numbs='
						+ friends[i].friends_numbs
						+ '&friendId='
						+ friends[i].friendId
						+ '&nickname='
						+ friends[i].nickname
						+ '&friendId='
						+ friends[i].friendId
						+ '&mail='
						+ friends[i].mail
						+ '&phone='
						+ friends[i].phone
						+ '&gender='
						+ friends[i].gender
						+ '&picturepath='
						+ friends[i].picturepath
						+ '&gametypeid='
						+ friends[i].gametypeid + '">'
				content += '<img class="img-thumbnail img-fluid rounded-circle mb-3 shadow-sm"';
    			content += 'src="up_NoUsed/'+friends[i].picturepath+'"';
    			content += 'alt=""';
    			content += 'width="100">';
				content += '</a>';
				content += '<div class="primary-btn" >';
				content += '<i class="fa fa-plus">';
				content += '</i>已是好友</div>';
				content += '<h4 class="mb-1">';
				content += '<font color="black">' + friends[i].nickname
						+ '</font>';
				content += '</h4>';
				content += '</div>';
				content += '</div>';

			}

			document.getElementById("friends").innerHTML = content;
		}

		function displaySearchProducts(searchresponseData) {

			var content = "<div class='row'></div>";
			var data = searchresponseData.split("&&&");
			var RecommendFriends = JSON.parse(data[0]);

			for (var i = 0; i < RecommendFriends.length; i++) {

				content += '<div class="col-4 col-md-4 col-lg-4 col-xxl-2 mb-1" style="float: left;">';
				content += '<div style="width:360px" class="bg-white p-3 h-100">';
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

	// 	<div class="col-4 col-md-4 col-lg-4 col-xxl-2 mb-1">
	// 	<div class="bg-white p-3 h-100">
	// 		<a href="FriendDetail.jsp">
	// 		<img class='img-thumbnail img-fluid rounded-circle mb-3 shadow-sm' src='up_NoUsed/"+RecommendFriends[i].imageFileName+"' width='100' />
	// 		</a>
	// 	<div class="primary-btn" style="background: #FFFFFF;">
	// 		<p class="mb-1" style="font-size: 13px">性別:</p>
	// 		<p class="mb-1" style="font-size: 13px">喜好遊戲類型:</p>
	// 	</div>
	// 	<h5 class="mb-1"> 會員綽號：</h5>
	// 	</div>
	// 	</div>
</script>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet" />

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
	<section class="breadcrumb-section set-bg"
		data-setbg="img/breadcrumb.jpg">
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
					</div>
					<div class="filter__item">
						<div class="row">
							<div class="col-lg-4 col-md-5"></div>
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
					<!-- 好友清單 -->
					<div class="row" id="friends"></div>

					<div class="filter__item"></div>
					<br> <br>
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
					<div class="row" style="margin-left: 27px" id="pageProduct">
						<!-- 						<input id="TestGameTypeTxt" type="button" value="重新推薦" style="font-weight:bold;width:80px;height:30px;border:none;background-color:#FFD306"> -->
						<!-- 					<div class="row" id="pageProduct">  -->
						<!--推薦好友清單 -->

<!-- 						</div> -->
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
						<p>Get E-mail updates about our latest shop and special
							offers.</p>
						<form action="#">
							<input type="text" placeholder="Enter your mail" />
							<button type="submit" class="site-btn">Subscribe</button>
						</form>
						<div class="footer__widget__social">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
								class="fa fa-instagram"></i></a> <a href="#"><i
								class="fa fa-twitter"></i></a> <a href="#"><i
								class="fa fa-pinterest"></i></a>
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
