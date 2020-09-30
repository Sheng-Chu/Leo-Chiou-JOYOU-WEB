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


<!-- favicon
		============================================ -->
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
<script src="${pageContext.request.contextPath}/WebMaintain/js/vendor/modernizr-2.8.3.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<script>
function sub() {
	var codevalue = document.getElementById('code').value;
	var amountvalue = document.getElementById('amount1').value;
	var conditionvalue = document.getElementById('condition').value;
	let Vobj1 = document.getElementById("codeMsg");
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "<c:url value='/UpdateDiscountsServlet.do'/>", true);
	xhr.setRequestHeader("Content-Type",
			"application/x-www-form-urlencoded");
	xhr.send("code=" + codevalue + "&amount=" + amountvalue + "&condition="
			+ conditionvalue);
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && (xhr.status == 200 || xhr.status == 201)) {
			result = JSON.parse(xhr.responseText);
			Vobj1.innerHTML = "<span>" + result.DisUpdateMsg + "</span>";
		}
	}

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
												<h2>折扣碼更新</h2>
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
		<!-- Single pro tab start-->
		<div class="single-product-tab-area mg-b-30">
			<!-- Single pro tab review Start-->
			<div class="single-pro-review-area">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="review-tab-pro-inner">
								<div id="myTabContent" class="tab-content custom-Product-Add">
									<div class="product-tab-list tab-pane fade active in"
										id="description">
										<div class="row">
											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
												<div class="review-content-section">
													<form id="disadd" method="post">
														<div class="input-group mg-b-pro-edt">
															<span> 折扣代碼：</span> <input type="text" id="code"
																class="form-control" value="${upCode}"/>
														</div>
														<div class="input-group mg-b-pro-edt">
															<span> 折扣金額(元)：</span> <input type="text" id="amount1"
																class="form-control" value="${upAmount}"/>
														</div>
														<div class="input-group mg-b-pro-edt">
															<span> 折扣條件(元)：</span> <input type="text" id="condition"
																class="form-control" value="${upCondition}"/>
														</div>
													<button type="button"  onclick="sub()">送出</button>
													<p><span id="codeMsg"></span></p>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
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
	<script
		src="${pageContext.request.contextPath}/WebMaintain/js/vendor/jquery-1.12.4.min.js"></script>
	<!-- bootstrap JS
		============================================ -->
	<script
		src="${pageContext.request.contextPath}/WebMaintain/js/bootstrap.min.js"></script>
	<!-- wow JS
		============================================ -->
	<script
		src="${pageContext.request.contextPath}/WebMaintain/js/wow.min.js"></script>
	<!-- price-slider JS
		============================================ -->
	<script
		src="${pageContext.request.contextPath}/WebMaintain/js/jquery-price-slider.js"></script>
	<!-- meanmenu JS
		============================================ -->
	<script
		src="${pageContext.request.contextPath}/WebMaintain/js/jquery.meanmenu.js"></script>
	<!-- owl.carousel JS
		============================================ -->
	<script
		src="${pageContext.request.contextPath}/WebMaintain/js/owl.carousel.min.js"></script>
	<!-- sticky JS
		============================================ -->
	<script
		src="${pageContext.request.contextPath}/WebMaintain/js/jquery.sticky.js"></script>
	<!-- scrollUp JS
		============================================ -->
	<script
		src="${pageContext.request.contextPath}/WebMaintain/js/jquery.scrollUp.min.js"></script>
	<!-- mCustomScrollbar JS
		============================================ -->
	<script
		src="${pageContext.request.contextPath}/WebMaintain/js/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/WebMaintain/js/scrollbar/mCustomScrollbar-active.js"></script>
	<!-- metisMenu JS
		============================================ -->
	<script
		src="${pageContext.request.contextPath}/WebMaintain/js/metisMenu/metisMenu.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/WebMaintain/js/metisMenu/metisMenu-active.js"></script>
	<!-- morrisjs JS
		============================================ -->
	<script
		src="${pageContext.request.contextPath}/WebMaintain/js/sparkline/jquery.sparkline.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/WebMaintain/js/sparkline/jquery.charts-sparkline.js"></script>
	<!-- calendar JS
		============================================ -->
	<script
		src="${pageContext.request.contextPath}/WebMaintain/js/calendar/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/WebMaintain/js/calendar/fullcalendar.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/WebMaintain/js/calendar/fullcalendar-active.js"></script>
	<!-- tab JS
		============================================ -->
	<script src="${pageContext.request.contextPath}/WebMaintain/js/tab.js"></script>
	<!-- plugins JS
		============================================ -->
	<script
		src="${pageContext.request.contextPath}/WebMaintain/js/plugins.js"></script>
	<!-- main JS
		============================================ -->
	<script src="${pageContext.request.contextPath}/WebMaintain/js/main.js"></script>
</body>
</html>