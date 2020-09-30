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
<script
	src="${pageContext.request.contextPath}/WebMaintain/js/vendor/modernizr-2.8.3.min.js"></script>
<script>
function checkName(){
	let xhr = new XMLHttpRequest();
	var selectElement = document.getElementById('ptName');
	var Msg = document.getElementById('ptMsg');
	xhr.open("POST", "<c:url value='/ProductsCheckServlet.do?' />", true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xhr.send("productName=" + selectElement.value);
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			let result = JSON.parse(xhr.responseText);
			Msg.innerHTML = "<span>" + result.ptMsg + "</span>";
		}
	}
	
	
}


function dataAuoto(){
	 document.getElementsByName("name")[0].value="狼人殺";
	 document.getElementsByName("stock")[0].value="10";
	 document.getElementsByName("price")[0].value="450";
	 document.getElementsByName("productintro")[0].value="在一個看似平凡無奇的村莊，村民們樸實的生活著，某天一個月圓的夜晚，這村莊出現第一名受害者，伴隨著一聲慘叫，死在那利爪獠牙底下，早晨，在警長的決定下，開始每天投票放逐一名嫌疑犯，直到村莊回復和平，「狼人殺」為玩家們扮演村莊中的角色，與狼人勢力對抗，或者參與狼人勢力，企圖泯滅這個村莊，在不確定其他玩家的身分下，藉由發言以及局勢走向來驅逐狼人，平民協助神職，神職帶領平民。而狼人要做的就是趁夜晚，殺光村民或者神職。";
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
												<h2>商品上架</h2>
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
												<p style="margin-left: 50px">圖片預覽：</p>
												<div
													style="margin-left: 50px; width: 400px; height: 400px; border: 2px solid #F0F0F0">
													<img src="${pageContext.request.contextPath}/img/Preset.jpg"
														id="imgpreview" alt="請選擇圖片"
														style="width: 100%; height: 100%; width: 600px" />
												</div>
											</div>
											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
												<div class="review-content-section">
													<form action="<c:url value='/ProductsInsert.do'/>" method="post"
														enctype="multipart/form-data">
														<div class="input-group mg-b-pro-edt" style="width: 255.5px">
															<span> 商品名稱：</span> <input type="text" onchange="checkName()" id="ptName"name="name"
																class="form-control" /><span style="margin-left:80px;color:red" id="ptMsg"></span>
														</div>
														<div class="input-group mg-b-pro-edt">
															<span> 商品庫存：</span> <input type="text" name="stock"
																class="form-control" />
														</div>
														<div class="input-group mg-b-pro-edt">
															<span> 商品價格：</span> <input type="text" name="price"
																class="form-control" />
														</div>
														<div class="input-group mg-b-pro-edt">
															<span>是否特價：</span><br /> <select class="select"
																name="sale">
																<option value="0">否</option>
																<option value="1">是</option>
															</select>
														</div>
														<div class="input-group mg-b-pro-edt">
															<span>商品適齡：</span><br /> <select class="select"
																name="age">
																<option value="6+">6+</option>
																<option value="10+">10+</option>
																<option value="14+">14+</option>
																<option value="18+">18+</option>
															</select>
														</div>
														<div class="input-group mg-b-pro-edt">
															<span>遊戲語言：</span><br /> <select class="select"
																name="lang">
																<option value="中文">中文</option>
																<option value="英文">英文</option>
															</select>
														</div>
														<div class="input-group mg-b-pro-edt">
															<span>遊戲人數：</span><br /> <select class="select"
																name="suggestnum">
																<option value="3人以上">3人以上</option>
																<option value="6人以上">6人以上</option>
																<option value="7人以上">7人以上</option>
																<option value="10人以上">10人以上</option>
															</select>
														</div>
														<div class="input-group mg-b-pro-edt">
															<span>顏色分類： </span><br /> <select class="select"
																name="productcolor">
																<option value="white">白色</option>
																<option value="red">紅色</option>
																<option value="black">黑色</option>
																<option value="blue">藍色</option>
																<option value="green">綠色</option>
																<option value="yellow">黃色</option>
															</select>
														</div>
														<div class="input-group mg-b-pro-edt">
															<span>插畫風格： </span><br /> <select class="select"
																name="paintingstyle">
																<option value="寫實">寫實</option>
																<option value="可愛">可愛</option>
																<option value="插畫">插畫</option>
																<option value="抽象">抽象</option>
																<option value="實體">實體</option>
															</select>
														</div>
														<div class="input-group mg-b-pro-edt">
															<span>遊戲類型： </span><br /> <select class="select"
																name="gametype">
																<option value="5001">PartyGames</option>
																<option value="5002">StrategyGames</option>
																<option value="5003">ThemeticGames</option>
																<option value="5004">WarGames</option>
																<option value="5005">AbstractGames</option>
																<option value="5006">CustomizableGames</option>
																<option value="5007">ChildrenGames</option>
																<option value="5008">FamilyGames</option>
															</select>
														</div>
														<div class="input-group mg-b-pro-edt">
															<span>商品圖片： </span> <input style="background: #FFFFFF"
																class='InputClass' type="file" name="uploadFile"
																id="upload_img" size="40" />
														</div>
														<div class="input-group mg-b-pro-edt">
															<span> 商品介紹：</span><br />
															<textarea name="productintro"
																style="width: 300px; height: 100px;"></textarea>
														</div>
														<br /> <br />
														<div class="row">
															<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
																<div class="text-center custom-pro-edt-ds">
																	<button type="submit" name="Submit"
																		class="btn btn-ctl-bt waves-effect waves-light m-r-10">送出</button>
																		<button type="button" onclick="dataAuoto()">✎ </button>
																	<p>
																		<span>${InsertMsg}</span>
																	</p>
																</div>
															</div>
														</div>
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
	<script>
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#imgpreview').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}

		$("#upload_img").change(function() {
			readURL(this);
		});
	</script>
</body>
</html>