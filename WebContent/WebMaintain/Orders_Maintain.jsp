<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>揪遊 JOYOU | BOARD GAMES 後台管理系統</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/WebMaintain/img/favicon.ico" />
<!-- Google Fonts
		============================================ -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900"
	rel="stylesheet" />
<!-- Bootstrap CSS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/WebMaintain/css/bootstrap.min.css" />
<!-- Bootstrap CSS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/WebMaintain/css/font-awesome.min.css" />
<!-- nalika Icon CSS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/WebMaintain/css/nalika-icon.css" />
<!-- owl.carousel CSS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/WebMaintain/css/owl.carousel.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/WebMaintain/css/owl.theme.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/WebMaintain/css/owl.transitions.css" />
<!-- animate CSS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/WebMaintain/css/animate.css" />
<!-- normalize CSS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/WebMaintain/css/normalize.css" />
<!-- meanmenu icon CSS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/WebMaintain/css/meanmenu.min.css" />
<!-- main CSS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/WebMaintain/css/main.css" />
<!-- morrisjs CSS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/WebMaintain/css/morrisjs/morris.css" />
<!-- mCustomScrollbar CSS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/WebMaintain/css/scrollbar/jquery.mCustomScrollbar.min.css" />
<!-- metisMenu CSS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/WebMaintain/css/metisMenu/metisMenu.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/WebMaintain/css/metisMenu/metisMenu-vertical.css" />
<!-- calendar CSS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/WebMaintain/css/calendar/fullcalendar.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/WebMaintain/css/calendar/fullcalendar.print.min.css" />
<!-- style CSS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/WebMaintain/css/style.css" />
<!-- responsive CSS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/WebMaintain/css/responsive.css" />
<!-- modernizr JS
		============================================ -->
<script src="js/vendor/modernizr-2.8.3.min.js"></script>

<script type="text/javascript">
	window.onload = function() {
		var xhr = new XMLHttpRequest();
		xhr.open("GET",
				"<c:url value='/PageOrdersJsonServlet.do?type=all'/>", true); //頁面預設商品
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				if (xhr.status == 200) {
					var responseData = xhr.responseText;
					displayPageOrders(responseData);
				} else {
				}
			}
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
			+ "&type=all";

			xhr.open("GET", "<c:url value='/PageOrdersJsonServlet.do'/>"
					+ queryString, true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var responseData1 = xhr.responseText;
					displayPageOrders(responseData1);
				}
			}
		}
		function displayPageOrders(responseData) {
			var content = "<tr><td>訂單編號</td><td>收件人</td><td>收件電話</td><td>地址</td><td>訂單金額</td><td>付款方式</td><td>操作</td></tr>";
			var data = responseData.split("&&&");
			var orders = JSON.parse(data[0]); 
			var mapData = JSON.parse(data[1]); 

			for (var i = 0; i < orders.length; i++) {
				content += "<tr><td>"+orders[i].orderId+"</td>";
				content += "<td>" + orders[i].receiver + "</td>";
				content += "<td>" + orders[i].receiverPhone + "</td>";
				content += "<td>" + orders[i].shippingAddress + "</td>";
				content += "<td>" + orders[i].orderAmount + "</td>";
				content += "<td>" + orders[i].payMethod + "</td>";
				content += "<td><a style='margin-left:10px'data-toggle='tooltip' class='pd-setting-ed' href='${pageContext.request.contextPath}/PrepareUpdateOrderServlet.do?";
				content += "OrderId="+orders[i].orderId+"'>";
				content += "<i class='fa fa-pencil-square-o' aria-hidden='true'></i>";
				content += "<a style='margin-left:15px' data-toggle='tooltip' class='pd-setting-ed' href='javascript: void(0)' onClick='orderDelete("+orders[i].orderId+")'>";
				content += "<i class='fa fa-trash-o' aria-hidden='true'></i>";
				content += "</button></td></tr>"

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

	function orderDelete(id) {
		window.alert("訂單刪除成功!!!");
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/OrdersDeleteServlet.do' />"
				+ "?OrderId=" + id, true);
		xhr.send();
		window.location.reload();
	}

	function orderUpdate(pt){
		window.alert(1);
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/XXXXXXX.do' />"
				+ "?producrId=" + pt.value, true);
		xhr.send();
		}
</script>
</head>

<body>
	<div class="left-sidebar-pro">
		<nav id="sidebar" class="">
			<!-- Logo圖片更換位置 -->
			<div class="sidebar-header">
				<a href="Index_Maintain.jsp"><img class="main-logo"
					src="${pageContext.request.contextPath}/WebMaintain/img/logo/JOYOU_logo-3.png"
					alt="" /></a> <strong><img
					src="${pageContext.request.contextPath}/WebMaintain/img/logo/JOYOU_logo-3.png"
					alt="" /></strong>
			</div>
			<div class="nalika-profile">
				<div class="profile-dtl">
					<a href="Index_Maintain.jsp"><img
						src="${pageContext.request.contextPath}/WebMaintain/img/logo/joyou-210.png"
						alt="" /></a>
					<h2>
						管理員 <span class="min-dtn">您好</span>
					</h2>
				</div>
				<div class="profile-social-dtl">
					<ul class="dtl-social"></ul>
				</div>
			</div>
			<jsp:include page="banner.jsp" />
		</nav>
	</div>
	<!-- Start Welcome area -->
	<div class="all-content-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="logo-pro">
						<a href="Index_Maintain.jsp"><img class="main-logo"
							src="${pageContext.request.contextPath}/WebMaintain/img/logo/JOYOU_logo-3.png"
							alt="" /></a>
					</div>
				</div>
			</div>
		</div>
		<div class="header-advance-area">
			<div class="header-top-area">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="header-top-wraper">
								<div class="row">
									<div class="col-lg-6 col-md-7 col-sm-6 col-xs-12"></div>
									<div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
										<div class="header-right-info">
											<ul class="nav navbar-nav mai-top-nav header-right-menu">
												<li class="nav-item"><a href="${pageContext.request.contextPath}/index.jsp"> <i
														class="fa fa-user"></i> <span class="admin-name">登出</span>
												</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Mobile Menu end -->
			<div class="breadcome-area">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="breadcome-list">
								<div class="row">
									<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
										<div class="breadcomb-wp">
											<div class="breadcomb-icon"></div>
											<div class="breadcomb-ctn">
												<h2>訂單清單</h2>
											</div>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
										<div class="breadcomb-report"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="product-status mg-b-30">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="product-status-wrap">
							<table id="pageProduct"></table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id='navigation' style='height: 60px; margin-left: 400px'></div>
		<div class="footer-copyright-area">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12"></div>
				</div>
			</div>
		</div>
	</div>

	<!-- jquery
		============================================ -->
	<script src="js/vendor/jquery-1.12.4.min.js"></script>
	<!-- bootstrap JS
		============================================ -->
	<script src="js/bootstrap.min.js"></script>
	<!-- wow JS
		============================================ -->
	<script src="js/wow.min.js"></script>
	<!-- price-slider JS
		============================================ -->
	<script src="js/jquery-price-slider.js"></script>
	<!-- meanmenu JS
		============================================ -->
	<script src="js/jquery.meanmenu.js"></script>
	<!-- owl.carousel JS
		============================================ -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- sticky JS
		============================================ -->
	<script src="js/jquery.sticky.js"></script>
	<!-- scrollUp JS
		============================================ -->
	<script src="js/jquery.scrollUp.min.js"></script>
	<!-- mCustomScrollbar JS
		============================================ -->
	<script src="js/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="js/scrollbar/mCustomScrollbar-active.js"></script>
	<!-- metisMenu JS
		============================================ -->
	<script src="js/metisMenu/metisMenu.min.js"></script>
	<script src="js/metisMenu/metisMenu-active.js"></script>
	<!-- morrisjs JS
		============================================ -->
	<script src="js/sparkline/jquery.sparkline.min.js"></script>
	<script src="js/sparkline/jquery.charts-sparkline.js"></script>
	<!-- calendar JS
		============================================ -->
	<script src="js/calendar/moment.min.js"></script>
	<script src="js/calendar/fullcalendar.min.js"></script>
	<script src="js/calendar/fullcalendar-active.js"></script>
	<!-- plugins JS
		============================================ -->
	<script src="js/plugins.js"></script>
	<!-- main JS
		============================================ -->
	<script src="js/main.js"></script>
</body>
</html>