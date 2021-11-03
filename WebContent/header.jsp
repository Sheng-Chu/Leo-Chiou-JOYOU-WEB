<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>揪遊商城</title>



<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/searchbar.css" type="text/css">
</head>
<body>
	
<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Humberger Begin -->
	<div class="humberger__menu__overlay"></div>
	<div class="humberger__menu__wrapper">
		<div class="humberger__menu__logo">
			<a href="#"><img src="img/logo.png" alt=""></a>
		</div>
		<div class="humberger__menu__cart">
			<ul>
				<li><a
					href="http://localhost:8080/JoYouProject/ShopingCartPage.jsp"><i
						class="fa fa-shopping-bag"></i> <span id="bagcounts">0</span></a></li>
			</ul>
			<div class="header__cart__price">
				<FONT color='Black' size='-1'> <c:out
						value="購物金額:NT.${ShoppingCart.subtotal}" default="0" /></FONT>
			</div>
		</div>
		<div class="humberger__menu__widget">
		
			<div class="header__top__right__auth">
				<a href="login.jsp"><i class="fa fa-user"></i> Login</a>
			</div>
		</div>
		<nav class="humberger__menu__nav mobile-menu">
			<ul>
				<li><a href="./shop-grid.html">Shop</a></li>
				<li><a href="#">Pages</a>
					<ul class="header__menu__dropdown">
						<li><a href="./shop-details.html">Shop Details</a></li>
						<li><a href="./shoping-cart.html">Shoping Cart</a></li>
						<li><a href="./checkout.html">Check Out</a></li>
						<li><a href="./blog-details.html">Blog Details</a></li>
					</ul></li>
				<li><a href="./blog.html">Blog</a></li>
				<li><a href="./contact.html">Contact</a></li>
			</ul>
		</nav>
		<div id="mobile-menu-wrap"></div>
		<div class="header__top__right__social">
			<a href="login.jsp"><i class="fa fa-facebook"></i></a> <a href="login.jsp"><i
				class="fa fa-twitter"></i></a> <a href="login.jsp"><i class="fa fa-linkedin"></i></a>
			<a href="login.jsp"><i class="fa fa-pinterest-p"></i></a>
		</div>
		<div class="humberger__menu__contact">
			<ul>
				<li><i class="fa fa-envelope"></i> JoYo@gmail.com</li>
				<li>買千送百活動開跑中</li>
			</ul>
		</div>
	</div>
	<!-- Humberger End -->

	<!-- Header Section Begin -->
	<header class="header">
		<div class="header__top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<div class="header__top__left">
							<ul>
								<li><i class="fa fa-envelope"></i> JoYo@gmail.com</li>
								<li>買千送百活動開跑中</li>
							</ul>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="header__top__right">
							<div class="header__top__right__social">
								<a href="login.jsp"><i class="fa fa-facebook"></i></a> <a href="#"><i
									class="fa fa-twitter"></i></a> <a href="login.jsp"><i
									class="fa fa-linkedin"></i></a> <a href="login.jsp"><i
									class="fa fa-pinterest-p"></i></a>
							</div>
							
							<div class="header__top__right__auth">
								<a id="topRightLogin" href="login.jsp"><i class="fa fa-user"></i> Login</a>
								<a id="topRightMember" href="<c:url value='/up_MemberLogoutServlet'/>"><i class="fa fa-user"></i> ${memberNickName} </a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="header__logo">
						<a href="./index.jsp"><img src="img/logo.png" alt=""></a>
					</div>
				</div>
				<div class="col-lg-7">
					<nav class="header__menu">
                        <ul>
                             <li id="memberManage"></li>						
                             <li><a href="<c:url value='/SaleProductsGetServlet.do'/>">揪遊商城</a>
                            </li>
                            <!--  <li><a href="ProductsGetServlet.do">揪遊商城</a> -->
                            <li><a href="./ForumListIndex.jsp">討論區</a>
                            </li>
                            <li><a href="./groups.jsp">揪遊團</a></li>
                            <li><a href="">聯繫我們</a></li>
                        </ul>
                    </nav>
				</div>
				<div class="col-lg-2">
										<div class="header__cart">

						<c:choose>
							<c:when test="${ShoppingCart.itemNumber>0}">
								<ul>
									<li><a
										href="http://localhost:8080/JoYouProject/ShopingCartPage.jsp"><i
											class="fa fa-shopping-bag"></i><span style="display: "
											id="bagcounts">${ShoppingCart.itemNumber}</span></a></li>
								</ul>
								<div class="header__cart__price">

									<span style="display:" id="carttotal">購物金額 $<c:out
											value="${ShoppingCart.subtotal}" default="0" /></span>
								</div>

							</c:when>
							<c:otherwise>
								<ul>
									<li><a
										href="http://localhost:8080/JoYouProject/ShopingCartPage.jsp"><i
											class="fa fa-shopping-bag"></i><span style="display: none"
											id="bagcounts">${ShoppingCart.itemNumber}</span></a></li>
								</ul>
								<div class="header__cart__price">

									<span style="display: none" id="carttotal">購物金額 $<c:out
											value="${ShoppingCart.subtotal}" default="0" /></span>
								</div>
							</c:otherwise>
						</c:choose>


					</div>
				</div>
			</div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header Section End -->

	<!-- Hero Section Begin -->
	<section class="hero hero-normal">
		<div class="container">
			<div class="col-lg-9">
				<div class="row">
					<nav id="nav-wrap">
						<ul>
							<li>
								<div class="menu-icon-btn">
									找什麼 <i class="fa fa-angle-down" aria-hidden="true"></i>
								</div>
								<ul class="main-menu-container">
									<li><a href="<c:url value='ForumListIndex.jsp'/>">找文章</a></li>
									<li><a href="<c:url value='/SaleProductsGetServlet.do'/>">找桌遊</a></li>
								</ul>
							</li>
						</ul>
						<div class="search-container">
							<div class="search-input">
								<input type="search" class="search-bar" id="SearchInputTxt"
									name="SearchInputTxt"
									placeholder="                   請輸入搜尋字串....">
							</div>
							<div class="search-icon-btn">
								<i class="fa fa-search"></i>
							</div>
						</div>

					</nav>

					<div class="hero__search__phone">
						<div class="hero__search__phone__icon">
							<i class="fa fa-phone"></i>
						</div>
						<div class="hero__search__phone__text">
							<h5>02-28825252</h5>
							<span>24Hr客服專線</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->

	<!-- Js Plugins -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>


		<script>
		<%
			Integer userIDStr =(Integer) session.getAttribute("memberID");
			String userNickNameStr =(String) session.getAttribute("memberNickName");
		%>

		var userID="<%=userIDStr%>";
		var userNickName="<%=userNickNameStr%>";
		

		console.log("userID=");
		console.log(userID);
		
		console.log("userNickName=");
		console.log(userNickName);


		if(userID=="null"){
			console.log("244 is null");
			document.getElementById("topRightLogin").style.display="";
			document.getElementById("topRightMember").style.display="none";	
			document.getElementById("memberManage").innerHTML="<a id='memberLogin' href='login.jsp'>會員登入</a>";	
			
		}else{
			console.log("248 not null");
			document.getElementById("topRightLogin").style.display="none";
			document.getElementById("topRightMember").style.display="";
			document.getElementById("memberManage").innerHTML="<a href='member-profile.jsp'>會員資料</a>";
			document.getElementById("memberManage").innerHTML+="<ul class='header__menu__dropdown'><li><a href='FriendPage.jsp'>好友專區</a></li><li><a href='<c:url value="MemberOrderList.jsp"/>'>訂單查詢</a></li><li><a href='<c:url value="/up_MemberLogoutServlet"/>'>會員登出</a></li></ul>";			
		}
	</script>

</body>
</html>