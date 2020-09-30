<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server 
response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance 
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale" 
response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
%>

<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>購物車</title>

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

<script type="text/javascript">

function modify(key, orderitemQty, index) {
	var x = "newQty" + index;
	var newQty = document.getElementById(x).value;
	if  (newQty < 0 ) {
		return ; 
	}
	if  (newQty == 0 ) {
		document.getElementById(x).value = orderitemQty;
		return ; 
	}
	if  (newQty == orderitemQty ) {
		return ; 
	}
	if (confirm("確定將此商品的數量由" + orderitemQty + " 改為 " + newQty + " ? ") ) {
		document.forms[0].action="<c:url value='UpdateShoppingCartServlet.do?cmd=MOD&productId=" + key + "&newQty=" + newQty +"' />" ;
		document.forms[0].method="POST";
		document.forms[0].submit();
	} else {
		document.getElementById(x).value = orderitemQty;
	}
}

function confirmDelete(n) {
		document.forms[0].action="<c:url value='/UpdateShoppingCartServlet.do?cmd=DEL&productId=" + n +"' />" ;
		document.forms[0].method="POST";
		document.forms[0].submit();
}



function isNumberKey(evt)
{
   var charCode = (evt.which) ? evt.which : event.keyCode
   if (charCode > 31 && (charCode < 48 || charCode > 57)){
      return false;
   }
   return true;
}


function Checkout(orderitemQty) {
	if (orderitemQty == 0)  {
		alert("購物車沒有商品");
		return false;
	}
	if (confirm("再次確認訂單內容 ? ") ) {
		return true;
	} else {
		return false;
	}
}


function Abort() {
	if (confirm("確定放棄購物 ? ") ) {
		return true;
	} else {
		return false;
	}
}
</script>
</head>

<body>

	<c:set var="funcName" value="CHE" scope="session" />

	<c:choose>
		<c:when test="${ShoppingCart.subtotal > 0}">
			<c:set var="subtotal" value="${ShoppingCart.subtotal}" />
		</c:when>
		<c:otherwise>
			<c:set var="subtotalMessage" value="金額小計:  0 元" />
			<c:set var="subtotal" value="0" />
		</c:otherwise>
	</c:choose>

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
			<a href="login.jsp"><i class="fa fa-facebook"></i></a> <a
				href="login.jsp"><i class="fa fa-twitter"></i></a> <a
				href="login.jsp"><i class="fa fa-linkedin"></i></a> <a
				href="login.jsp"><i class="fa fa-pinterest-p"></i></a>
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
								<a href="login.jsp"><i class="fa fa-facebook"></i></a> <a
									href="#"><i class="fa fa-twitter"></i></a> <a href="login.jsp"><i
									class="fa fa-linkedin"></i></a> <a href="login.jsp"><i
									class="fa fa-pinterest-p"></i></a>
							</div>

							<div class="header__top__right__auth">
								<a id="topRightLogin" href="login.jsp"><i class="fa fa-user"></i>
									Login</a> <a id="topRightMember"
									href="<c:url value='/up_MemberLogoutServlet'/>"><i
									class="fa fa-user"></i> ${memberNickName} </a>
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
							<li><a href="SaleProductsGetServlet.do">揪遊商城</a></li>
							<!--  <li><a href="ProductsGetServlet.do">揪遊商城</a> -->
							<li><a href="ProductsGetServlet.do">討論區</a></li>
							<li><a href="./groups.jsp">揪遊團</a></li>
							<li><a href="">聯繫我們</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-2">
					<div class="header__cart">
						<ul>
							<li><a
								href="http://localhost:8080/JoYouProject/ShopingCartPage.jsp"><i
									class="fa fa-shopping-bag"></i><span>${ShoppingCart.itemNumber}</span></a></li>
						</ul>
						<div class="header__cart__price">

							<span>購物金額 $<c:out value="${ShoppingCart.subtotal}"
									default="0" /></span>
						</div>
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
									<li><a href="#">找文章</a></li>
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

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>購物車</h2>
						<div class="breadcrumb__option"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Shoping Cart Section Begin -->
	<section class="shoping-cart spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="shoping__cart__table">
						<table>
							<thead>
								<tr>
									<th class="shoping__product">商品名稱</th>
									<th>遊戲語言</th>
									<th>單 價</th>
									<th>數 量</th>
									<th>總金額</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach varStatus="vs" var="orderItemBean"
									items="${ShoppingCart.content}">
									<tr>
										<td class="shoping__cart__item"><img
											src="img/${orderItemBean.value.imgName}" height="20%">
											<h5>${orderItemBean.value.productName}</h5></td>
										<td class="shoping__cart__price">
											${orderItemBean.value.productLang}</td>
										<td class="shoping__cart__price">
											NT.${orderItemBean.value.productPrice}</td>
										<td class="shoping__cart__quantity">
											<div class="quantity">
												<div class="pro-qty">
													<Input id="newQty${vs.index}"
														style="width: 28px; border: none; text-align: right"
														name="newQty" type="text"
														value="<fmt:formatNumber value="${orderItemBean.value.orderitemQty}" />"
														name="orderitemQty" onkeypress="return isNumberKey(event)" />
												</div>
											</div>
										</td>
										<td class="shoping__cart__total">
											NT.${orderItemBean.value.totalPrice}</td>
										<td class="shoping__cart__item__close"><Input
											style="background: #FFD306; float: left; color: black; text-align: center; outline: 0; border: 0; box-sizing: border-box; font-size: 10px;"
											type="button" name="delete" value="刪除"
											onclick="confirmDelete(${orderItemBean.key})"> <Input
											style="background: #FFD306; float: left; color: black; text-align: center; outline: 0; border: 0; box-sizing: border-box; font-size: 10px;"
											type="button" name="update" value="更新"
											onclick="modify(${orderItemBean.key}, ${orderItemBean.value.orderitemQty}, ${vs.index})">
										</td>
									</tr>
								</c:forEach>
							</tbody>

						</table>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="shoping__cart__btns">
						<a href="SaleProductsGetServlet.do" class="primary-btn cart-btn">還買不夠？</a>


					</div>
				</div>
				<div class="col-lg-6">
					<div class="shoping__continue"></div>
				</div>
				<div class="col-lg-6">
					<div class="shoping__checkout">
						<h5>本次訂單總金額</h5>
						<ul>
							<li>折扣前<span>NT.<fmt:formatNumber value="${subtotal}"
										pattern="#,###,###" /></span></li>
						</ul>
						<a id="order" href="ShoppingCheckOut.jsp" class="primary-btn">結帳去</a>
						<!-- <a id="order" href="${pageContext.request.contextPath}/DiscountServlet.do" class="primary-btn">結帳去</a> -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Shoping Cart Section End -->

	<!-- Footer Section Begin -->
	<footer class="footer spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="footer__about">
						<div class="footer__about__logo">
							<a href="./index.html"><img src="img/logo.png" alt=""></a>
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
						<p>Get E-mail updates about our latest shop and special
							offers.</p>
						<form action="#">
							<input type="text" placeholder="Enter your mail">
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
					<div class="footer__copyright">
						<div class="footer__copyright__text">
							<p>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;
								<script>document.write(new Date().getFullYear());</script>
								All rights reserved | This template is made with <i
									class="fa fa-heart" aria-hidden="true"></i> by <a
									href="https://colorlib.com" target="_blank">Colorlib</a>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</p>
						</div>
						<div class="footer__copyright__payment">
							<img src="img/payment-item.png" alt="">
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
	<script>
		<%Integer userIDStr = (Integer) session.getAttribute("memberID");
String userNickNameStr = (String) session.getAttribute("memberNickName");%>

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
			document.getElementById("memberManage").innerHTML+="<ul class='header__menu__dropdown'><li><a href='FriendPage.jsp'>好友專區</a></li><li><a href='<c:url value="MemberOrderList.jsp"/>'>訂單查詢</a></li><li><a href='<c:url value="/up_MemberLogoutServlet"/>'>會員登出</a></li></ul>";document.getElementById("memberManage").innerHTML+="<ul class='header__menu__dropdown'><li><a href='FriendPage.jsp'>好友專區</a></li><li><a href='<c:url value="MemberOrderList.jsp"/>'>訂單查詢</a></li><li><a href='<c:url value="/up_MemberLogoutServlet"/>'>會員登出</a></li></ul>";				
		}
	</script>

</body>

</html>