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
	background-color: #FFD306;
	color: #000079;
	text-transform: uppercase;
	font-weight: bold;
	cursor: pointer;
}

.item2 {
	text-align: center;
	background-color: #fff;
	width: 200px;
	height: 350px;
}

.items2 {
	display: block;
	font-weight: bold;
}

.sh4 {
	margin: 0px;
	font-weight: bold;
}
</style>

<script type="text/javascript">
	var pageNo = 0;
	var totalPage = 0;

	window.onload = function() {

		var selectElement = document.getElementById('pricepick');
		var gametype = document.getElementById('gametype');
		var inputValue = document.getElementById('SearchInputTxt');
		var type = gametype.getElementsByTagName('li');
		var xhr = new XMLHttpRequest();
		var xhr2 = new XMLHttpRequest();
		var searchxhr = new XMLHttpRequest();
		xhr.open("GET",
				"<c:url value='/PageProductsJsonServlet.do?type=all'/>", true); //頁面預設商品
		xhr.send();

		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				if (xhr.status == 200) {
					var responseData1 = xhr.responseText;
					displayPageProducts(responseData1);
				} else {
				}
			}
		}

		selectElement.onchange = function() {
			xhr2.onreadystatechange = function() {
				if (xhr2.readyState == 4 && xhr2.status == 200) {
					displayPageProducts(xhr2.responseText);
				}
			}
			xhr2.open("GET", "<c:url value='/PageProductsJsonServlet.do' />"
					+ "?type=" + selectElement.value, true);
			xhr2.send();
			asynRequest(id);
		}

		inputValue.onchange = function() {
			searchxhr.onreadystatechange = function() {
				if (searchxhr.readyState == 4 && searchxhr.status == 200) {
					displaySearchProducts(searchxhr.responseText);
				}
			}
			searchxhr.open("GET", "<c:url value='/ProductsSearchServlet.do' />"
					+ "?SearchInputTxt=" + inputValue.value, true);
			searchxhr.send();
			//		asynRequest(id);
		}

		function asynRequest(id) {
			var xhr = new XMLHttpRequest();
			var no = 0;
			var queryString = "";
			if (id == "first") {
				no = 1;
			} else if (id == "prev") {
				no = pageNo - 1;
			} else if (id == "next") {
				no = pageNo + 1;
			} else if (id == "last") {
				no = totalPage;
			}
			queryString = "?pageNo=" + no + "&totalPage=" + totalPage
					+ "&type=" + selectElement.value;

			xhr.open("GET", "<c:url value='/GetPageNumberServlet.do'/>"
					+ queryString, true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var responseData1 = xhr.responseText;
					displayPageProducts(responseData1);
				}
			}
		}

		function displayPageProducts(responseData1) {
			var content = "<div class='wrapper'><div class='clear'></div>";
			var data = responseData1.split("&&&");
			var products = JSON.parse(data[0]); // 陣列
			var mapData = JSON.parse(data[1]); // JavaScript物件

			for (var i = 0; i < products.length; i++) {
				let x=new Boolean(parseInt(products[i].productStock));
				content += "<div class='items'>";
				content += "<div class='item'>";
				if(x==false){
					content += "<img src='img\\" + products[i].imgName +"' width='300' /></a>";
					}else{
						content += "<a href='${pageContext.request.contextPath}/ShowSingalProductServlet.do?"
							+ "imgName="
							+ products[i].imgName
							+ "&productId="
							+ products[i].productId
							+ "&productName="
							+ products[i].productName
							+ "&productPrice="
							+ products[i].productPrice
							+ "&productIntro="
							+ products[i].productIntro
							+ "&gameType="
							+ products[i].gametypeId
							+ "&productAge="
							+ products[i].productAge
							+ "&suggestNum="
							+ products[i].suggestNum
							+ "&imgName="
							+ products[i].imgName
							+ "&productLang="
							+ products[i].productLang
							+ "&productStock="
							+ products[i].productStock + "'>";
						content += "<img src='img\\" + products[i].imgName +"' width='300' /></a>";
						}
				
				
				content += "<p style='margin:0;color:black;font-weight:bold;'> 商品名稱："
						+ products[i].productName + "</p>";
				content += "<p style='margin:0 0 10px 0;color:black;font-weight:bold;'> 庫存"
						+ products[i].productStock
						+ " 　售價$"
						+ products[i].productPrice + "</p>";	
				if(x==false){
					content += "<a class='primary-btn'>已售完補貨中</a>";
				}else{
					content += "<a class='primary-btn' href='javascript:addtoCart("
						+ products[i].productId + ")'" + ">ADD TO CART</a>";
					}
				
				content += "</div></div>";
				
			}
			document.getElementById("pageProduct").innerHTML = content;
			pageNo = mapData.currPage;
			totalPage = mapData.totalPage;

			var navContent = "<table><tr height='36'>";
			if (pageNo != 1) {
				navContent += "<td width='40' align='center'><input id='first' type='button' value='|<' style='font-weight:bold;width:30px;height:30px;border:none;background-color:#FFD306;'></td>";
				navContent += "<td width='40' align='center'><input id='prev' type='button' value='<<' style='font-weight:bold;width:30px;height:30px;border:none;background-color:#FFD306;'></td>";
			} else {
				navContent += "<td width='40' align='center'>&nbsp;</td>";
				navContent += "<td width='40' align='center'>&nbsp;</td>";
			}
			navContent += "<td width='100' align='center'>" + pageNo + " / "
					+ totalPage + "頁</td>";
			if (pageNo != totalPage) {
				navContent += "<td width='40' align='center'><input id='next' type='button' value='>>' style='font-weight:bold;width:30px;height:30px;border:none;background-color:#FFD306;'></td>";
				navContent += "<td width='40' align='center'><input id='last' type='button' value='>|' style='font-weight:bold;width:30px;height:30px;border:none;background-color:#FFD306;'></td>";
			} else {
				navContent += "<td width='40' align=scs'center'>&nbsp;</td>";
				navContent += "<td width='40' align='center'>&nbsp;</td>";
			}
			document.getElementById("navigation").innerHTML = navContent;

			var firstBtn = document.getElementById("first");
			var prevBtn = document.getElementById("prev");
			var nextBtn = document.getElementById("next");
			var lastBtn = document.getElementById("last");
			if (firstBtn != null) {
				firstBtn.onclick = function() {
					asynRequest(this.id);
				}
			}

			if (prevBtn != null) {
				prevBtn.onclick = function() {
					asynRequest(this.id);
				}
			}

			if (nextBtn != null) {
				nextBtn.onclick = function() {
					asynRequest(this.id);
				}
			}

			if (lastBtn != null) {
				lastBtn.onclick = function() {
					asynRequest(this.id);
				}
			}

		}

	}

	function addtoCart(pId) {
		window.alert("成功加入購物車");
		var bagcounts = document.getElementById("bagcounts");
		var carttotal = document.getElementById("carttotal");
		bagcounts.style.display="";
		carttotal.style.display="";
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "<c:url value='/BuyProductsJsonServlet.do?' />"
				+ "productId=" + pId + "&counts=1", true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let result = JSON.parse(xhr.responseText);
				bagcounts.innerHTML = result.num;
				carttotal.innerHTML = "購物金額 $" + result.total;

			}
		}
	}

	function gametypeChose(type) {
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				displaySpecailProducts(xhr.responseText);
			}
		}
		xhr.open("POST", "<c:url value='/GetSepcailProductsServlet.do' />"
				+ "?gmaeType=" + type, true);
		xhr.send();
	}

	function priceRange() {
		var minamount = document.getElementById("minamount");
		var maxamount = document.getElementById("maxamount");
		var minvalue = minamount.value;
		var maxvalue = maxamount.value;
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				displaySpecailProducts(xhr.responseText);
			}
		}
		xhr.open("POST", "<c:url value='/GetSepcailProductsServlet.do' />"
				+ "?min=" + minvalue + "&max=" + maxvalue, true);
		xhr.send();
	}

	function colorChose(color) {
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				displaySpecailProducts(xhr.responseText);
			}
		}
		xhr.open("POST", "<c:url value='/GetSepcailProductsServlet.do' />"
				+ "?color=" + color.value, true);
		xhr.send();
	}

	function paintingChose(paint) {
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				displaySpecailProducts(xhr.responseText);
			}
		}
		xhr.open("POST", "<c:url value='/GetSepcailProductsServlet.do' />"
				+ "?painting=" + paint.value, true);
		xhr.send();
	}

	function displaySpecailProducts(responseData) {
		var content = "<div class='wrapper'><div class='clear'></div>";
		var data = responseData.split("&&&");
		var products = JSON.parse(data[0]);
		var mapData = JSON.parse(data[1]);

		for (var i = 0; i < products.length; i++) {
			let x=new Boolean(parseInt(products[i].productStock));
			content += "<div class='items'>";
			content += "<div class='item'>";
			if(x==false){
				content += "<img src='img\\" + products[i].imgName +"' width='300' /></a>";
				}else{
					content += "<a href='${pageContext.request.contextPath}/ShowSingalProductServlet.do?"
						+ "imgName="
						+ products[i].imgName
						+ "&productId="
						+ products[i].productId
						+ "&productName="
						+ products[i].productName
						+ "&productPrice="
						+ products[i].productPrice
						+ "&productIntro="
						+ products[i].productIntro
						+ "&gameType="
						+ products[i].gametypeId
						+ "&productAge="
						+ products[i].productAge
						+ "&suggestNum="
						+ products[i].suggestNum
						+ "&imgName="
						+ products[i].imgName
						+ "&productLang="
						+ products[i].productLang
						+ "&productStock="
						+ products[i].productStock + "'>";
					content += "<img src='img\\" + products[i].imgName +"' width='300' /></a>";
					}
			content += "<p style='margin:0;color:black;font-weight:bold;'> 商品名稱："
					+ products[i].productName + "</p>";
			content += "<p style='margin:0 0 10px 0;color:black;font-weight:bold;'> 庫存"
					+ products[i].productStock
					+ " 　售價$"
					+ products[i].productPrice + "</p>";	
			if(x==false){
				content += "<a class='primary-btn'>已售完補貨中</a>";
			}else{
				content += "<a class='primary-btn' href='javascript:addtoCart("
					+ products[i].productId + ")'" + ">ADD TO CART</a>";
				}
			content += "</div></div>";

		}
		document.getElementById("pageProduct").innerHTML = content;
		pageNo = mapData.currPage;
		totalPage = mapData.totalPage;

		var navContent = "<div></div>";
		document.getElementById("navigation").innerHTML = navContent;

	}

	function displaySearchProducts(searchresponseData) {
		var content = "<div class='wrapper'><div class='clear'></div>";
		var otherContent = "";
		var data = searchresponseData.split("&&&");
		var products = JSON.parse(data[0]); 

		for (var i = 0; i < products.length; i++) {
			let x=new Boolean(parseInt(products[i].productStock));
			content += "<div class='items'>";
			content += "<div class='item'>";
			if(x==false){
				content += "<img src='img\\" + products[i].imgName +"' width='300' /></a>";
				}else{
					content += "<a href='${pageContext.request.contextPath}/ShowSingalProductServlet.do?"
						+ "imgName="
						+ products[i].imgName
						+ "&productId="
						+ products[i].productId
						+ "&productName="
						+ products[i].productName
						+ "&productPrice="
						+ products[i].productPrice
						+ "&productIntro="
						+ products[i].productIntro
						+ "&gameType="
						+ products[i].gametypeId
						+ "&productAge="
						+ products[i].productAge
						+ "&suggestNum="
						+ products[i].suggestNum
						+ "&imgName="
						+ products[i].imgName
						+ "&productLang="
						+ products[i].productLang
						+ "&productStock="
						+ products[i].productStock + "'>";
					content += "<img src='img\\" + products[i].imgName +"' width='300' /></a>";
					}
			content += "<p style='margin:0;color:black;font-weight:bold;'> 商品名稱："
					+ products[i].productName + "</p>";
			content += "<p style='margin:0 0 10px 0;color:black;font-weight:bold;'> 庫存"
					+ products[i].productStock
					+ " 　售價$"
					+ products[i].productPrice + "</p>";	
			if(x==false){
				content += "<a class='primary-btn'>已售完補貨中</a>";
			}else{
				content += "<a class='primary-btn' href='javascript:addtoCart("
					+ products[i].productId + ")'" + ">ADD TO CART</a>";
				}
			content += "</div></div>";

		}
		document.getElementById("pageProduct").innerHTML = content;
		document.getElementById("navigation").innerHTML = otherContent;
	}
</script>


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
		<div class="humberger__menu__widget">

			<div class="header__top__right__auth">
				<a href="#"><i class="fa fa-user"></i> Login</a>
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
			<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
				class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-linkedin"></i></a>
			<a href="#"><i class="fa fa-pinterest-p"></i></a>
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
							<li><a href="./ForumListIndex.jsp">討論區</a></li>
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
											class="fa fa-shopping-bag"></i><span style="display:"
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

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>揪遊商城</h2>
						<div class="breadcrumb__option">
							<span>WELCOME</span>
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
				<div class="col-lg-3 col-md-5">
					<div class="sidebar">
						<div class="sidebar__item">
							<div class="latest-product__text">
								<div style="margin-bottom: 20px"
									class="section-title product__discount__title">
									<h2>推薦商品</h2>
								</div>
								<div class="latest-product__slider owl-carousel">

									<c:forEach varStatus="stVar" var="ProductBean"
										items="${products_Suggest}">
										<div class="latest-prdouct__slider__item">
											<div class="col-lg-4">
												<div class="product__discount__item">
													<div class='items2'>
														<div class='item2'>
															<c:choose>
																<c:when test="${ProductBean.productStock>0}">
																	<a
																		href='${pageContext.request.contextPath}/ShowSingalProductServlet.do?imgName=${ProductBean.imgName}
						 &productId=${ProductBean.productId}&productName=${ProductBean.productName}
						 &productPrice=${ProductBean.productPrice}&productIntro=${ProductBean.productIntro}
						 &gameType=${ProductBean.gametypeId}&productAge=${ProductBean.productAge}
						 &suggestNum=${ProductBean.suggestNum}&productLang=${ProductBean.productLang}
						 &productStock=${ProductBean.productStock}'>
																		<img
																		src="<%=request.getContextPath()%>/img/${ProductBean.imgName}"
																		width='300' />
																	</a>
																</c:when>
																<c:otherwise>
																	<img
																		src="<%=request.getContextPath()%>/img/${ProductBean.imgName}"
																		width='300' />
																</c:otherwise>
															</c:choose>
															<p
																style='margin: 0 0 10px 0　; color: black; font-weight: bold;'>
																商品名稱：${ProductBean.productName}</p>
															<p
																style='margin: 0 0 10px 0; color: black; font-weight: bold;'>
																庫存 ${ProductBean.productStock} 售價$
																${ProductBean.productPrice}</p>
															<c:choose>
																<c:when test="${ProductBean.productStock>0}">
																	<a class='primary-btn'
																		href='javascript:addtoCart(${ProductBean.productId})'>ADD
																		TO CART</a>
																</c:when>
																<c:otherwise>
																	<a class='primary-btn'>已售完補貨中</a>
																</c:otherwise>
															</c:choose>
														</div>
													</div>
												</div>

											</div>
										</div>
									</c:forEach>
								</div>

							</div>
						</div>
						<div class="sidebar__item">
							<h4>桌遊類型</h4>
							<ul id="gametype">
								<li><a href="javascript:gametypeChose(5001)">Party
										Games</a></li>
								<li><a href="javascript:gametypeChose(5002)">Strategy
										Games</a></li>
								<li><a href="javascript:gametypeChose(5003)">Themetic
										Games</a></li>
								<li><a href="javascript:gametypeChose(5004)">War Games
								</a></li>
								<li><a href="javascript:gametypeChose(5005)">Abstract
										Games </a></li>
								<li><a href="javascript:gametypeChose(5006)">Customizable
										Games </a></li>
								<li><a href="javascript:gametypeChose(5007)">Children
										Games </a></li>
								<li><a href="javascript:gametypeChose(5008)">Family
										Games</a></li>
							</ul>
						</div>
						<div class="sidebar__item">
							<h4>商品售價</h4>
							<div onmouseup="priceRange()" class="price-range-wrap">
								<div
									class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
									data-min="200" data-max="700">

									<div class="ui-slider-range ui-corner-all ui-widget-header"></div>
									<span tabindex="0"
										class="ui-slider-handle ui-corner-all ui-state-default"></span>
									<span tabindex="0"
										class="ui-slider-handle ui-corner-all ui-state-default"></span>
								</div>
								<div class="range-slider">
									<div class="price-input">
										<input type="text" id="minamount"> <input type="text"
											id="maxamount">
									</div>
								</div>
							</div>
						</div>

						<div class="sidebar__item sidebar__item__color--option">
							<h4>顏色分類</h4>
							<div class="sidebar__item__color sidebar__item__color--white">
								<label> White <input value="white"
									onclick="colorChose(this)"></label>
							</div>
							<div class="sidebar__item__color sidebar__item__color--gray">
								<label> Yellow <input value="yellow"
									onclick="colorChose(this)">
								</label>
							</div>
							<div class="sidebar__item__color sidebar__item__color--red">
								<label> Red <input value="red"
									onclick="colorChose(this)">
								</label>
							</div>
							<div class="sidebar__item__color sidebar__item__color--black">
								<label> Black <input value="black"
									onclick="colorChose(this)">
								</label>
							</div>
							<div class="sidebar__item__color sidebar__item__color--blue">
								<label> Blue <input value="blue"
									onclick="colorChose(this)">
								</label>
							</div>
							<div class="sidebar__item__color sidebar__item__color--green">
								<label> Green <input value="green"
									onclick="colorChose(this)">
								</label>
							</div>
						</div>
						<div class="sidebar__item">
							<h4>繪畫風格</h4>
							<div class="sidebar__item__size">
								<label> 插畫 <input value="插畫"
									onclick="paintingChose(this)">
								</label>
							</div>
							<div class="sidebar__item__size">
								<label> 可愛 <input value="可愛"
									onclick="paintingChose(this)">
								</label>
							</div>
							<div class="sidebar__item__size">
								<label> 寫實 <input value="寫實"
									onclick="paintingChose(this)">
								</label>
							</div>
							<div class="sidebar__item__size">
								<label> 抽象 <input value="抽象"
									onclick="paintingChose(this)">
								</label>
							</div>
							<div class="sidebar__item__size">
								<label> 實體 <input value="實體"
									onclick="paintingChose(this)">
								</label>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-A col-md-7">
					<div class="product__discount">
						<div class="section-title product__discount__title">
							<h2>ON SALE</h2>
						</div>
						<div class="row">
							<div class="product__discount__slider owl-carousel">
								<c:forEach varStatus="stVar" var="ProductBean"
									items="${products_Sale}">
									<div class="col-lg-4">
										<div class="product__discount__item">
											<div class='items'>
												<div class='item'>
													<c:choose>
														<c:when test="${ProductBean.productStock>0}">
															<a
																href='${pageContext.request.contextPath}/ShowSingalProductServlet.do?imgName=${ProductBean.imgName}
						 &productId=${ProductBean.productId}&productName=${ProductBean.productName}
						 &productPrice=${ProductBean.productPrice}&productIntro=${ProductBean.productIntro}
						 &gameType=${ProductBean.gametypeId}&productAge=${ProductBean.productAge}
						 &suggestNum=${ProductBean.suggestNum}&productLang=${ProductBean.productLang}
						 &productStock=${ProductBean.productStock}'>
																<img
																src="<%=request.getContextPath()%>/img/${ProductBean.imgName}"
																width='300' />
															</a>
														</c:when>
														<c:otherwise>
															<img
																src="<%=request.getContextPath()%>/img/${ProductBean.imgName}"
																width='300' />
														</c:otherwise>
													</c:choose>
													<p style='margin: 0; color: black; font-weight: bold;'>
														商品名稱： ${ProductBean.productName}</p>
													<p
														style='margin: 0 0 10px 0; color: red; font-weight: bold;'>
														庫存 ${ProductBean.productStock} 特價$
														${ProductBean.productPrice}</p>
													<c:choose>
														<c:when test="${ProductBean.productStock>0}">
															<a class='primary-btn'
																href='javascript:addtoCart(${ProductBean.productId})'>ADD
																TO CART</a>
														</c:when>
														<c:otherwise>
															<a class='primary-btn'>已售完補貨中</a>
														</c:otherwise>
													</c:choose>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
								<!-- 特價區 -->
							</div>
						</div>
					</div>
					<div class="filter__item">
						<div class="row">
							<div class="col-lg-4 col-md-5">
								<div class="filter__sort">
									<span>價格排序</span> <select id="pricepick">
										<option value="all">預設</option>
										<option value="desc">由高到低</option>
										<option value="asc">由低到高</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<!-- 商品區 -->
						<div id='pageProduct'></div>
					</div>
					<div style="margin-left: 250px; margin-top: 50px">
						<div id='navigation' style='height: 60px;'></div>
					</div>
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
							<a href="./index.html"><img src="img/logo.png" alt=""></a>
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
	<script>
		<%Integer userIDStr = (Integer) session.getAttribute("memberID");
String userNickNameStr = (String) session.getAttribute("memberNickName");%>

		var userID="<%=userIDStr%>";
		var userNickName="<%=userNickNameStr%>";

		console.log("userID=");
		console.log(userID);

		console.log("userNickName=");
		console.log(userNickName);

		if (userID == "null") {
			console.log("244 is null");
			document.getElementById("topRightLogin").style.display = "";
			document.getElementById("topRightMember").style.display = "none";
			document.getElementById("memberManage").innerHTML = "<a id='memberLogin' href='login.jsp'>會員登入</a>";

		} else {
			console.log("248 not null");
			document.getElementById("topRightLogin").style.display = "none";
			document.getElementById("topRightMember").style.display = "";
			document.getElementById("memberManage").innerHTML = "<a href='member-profile.jsp'>會員資料</a>";
			document.getElementById("memberManage").innerHTML += "<ul class='header__menu__dropdown'><li><a href='FriendPage.jsp'>好友專區</a></li><li><a href='<c:url value="MemberOrderList.jsp"/>'>訂單查詢</a></li><li><a href='<c:url value="/up_MemberLogoutServlet"/>'>會員登出</a></li></ul>";
		}
	</script>

</body>
</html>