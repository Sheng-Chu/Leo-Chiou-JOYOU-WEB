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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style5.css" type="text/css">
<script src="js/vendor/modernizr-2.8.3.min.js"></script>

<script>
window.onload = function() {;
	var xhr2 = new XMLHttpRequest();

	xhr2.open("POST", "<c:url value='/ShowSignaltemsServlet.do'/>", true);
	xhr2.send();

	xhr2.onreadystatechange = function() {
		if (xhr2.readyState == 4) {
			if (xhr2.status == 200) {
				var responseData = xhr2.responseText;
				displayItems(responseData);
			}
		}
	}

	function displayItems(responseData) {

		var content = "";
		var Items = JSON.parse(responseData);
		for (var i = 0; i <Items.length; i++) {

			content+="<table><tbody><tr><td class='it49product_img'><img src='img/"+Items[i].imgName+"'></td>";
			content+="<td class='amount'>"+Items[i].productName+"</td>";
			content+="<td class='amount'>"+Items[i].productLang+"</td>";
			content+="<td class='amount'>"+Items[i].orderitemQty+"</td>";
			content+="<td class='price'><span class='jooPC_price01 new_price'>"+Items[i].totalPrice+"</span></td></tr></tbody></table>"

		}
		document.getElementById("items").innerHTML = content;
	}
}

function sub(id) {
	var receivervalue = document.getElementById('Receiver').value;
	var remarksvalue = document.getElementById('Remarks').value;
	var receiverphvalue = document.getElementById('ReceiverPhone').value;
	var addressvalue = document.getElementById('Address').value;
	let Vobj1 = document.getElementById("codeMsg");
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "<c:url value='/OrdersUpdateServlet.do'/>", true);
	xhr.setRequestHeader("Content-Type",
			"application/x-www-form-urlencoded");
	xhr.send("receiver=" + receivervalue + "&remarks=" + remarksvalue + "&receiverPhone="
			+ receiverphvalue +"&address=" +addressvalue +"&orderId="+id);
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && (xhr.status == 200 || xhr.status == 201)) {
			result = JSON.parse(xhr.responseText);
			Vobj1.innerHTML = "<span>" + result.oUpdateMsg + "</span>";
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
												<h2 style="font-weight: bold;">訂單修改</h2>
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

		<!-- 內容 -->
		<div class="it49">
			<!--頁籤切換區塊 如下-->
			<div id="tab" class="it49_tabinner">
				<div class="it49_perorder">
					<!-- 項目標題 如下 -->
					<ul class="it49_order_itemtitle">
						<li>訂單編號</li>
						<li>日 期</li>
						<li>備 註</li>
						<li>付款方式</li>
						<li>運送方式</li>
						<li>訂單總額</li>
						<li></li>
					</ul>
					<!-- 訂單基本內容  如下 -->
					<ul class="it49_order_detail">
						<li>${OrderNum}</li>
						<li>${upDate}</li>
						<li><input id="Remarks" type="text" class="form-control" value="${upRemarks}"/></li>
						<li>${upPay}</li>
						<li>宅配運送</li>
						<li>${upAmount}</li>
						<li></li>
						<!-- 金額 -->
					</ul>

					<ul class="it49_order_itemtitle">
						<li>訂購人</li>
						<li>訂購人電話</li>
						<li>收件人</li>
						<li>收件人電話</li>
						<li>收件地址</li>
						<li>訂單折扣</li>
						<li></li>
					</ul>
					<!-- 訂單基本內容  如下 -->
					<ul class="it49_order_detail">
						<li >${upOrderName}</li>
						<li >${upOrderPhone}</li>
						<li ><input id="Receiver" type="text" class="form-control" value="${upReceiver}"/></li>
						<li ><input id="ReceiverPhone" type="text" class="form-control" value="${upReceiverPhone}"/></li>
						<li ><input id="Address" type="text" class="form-control" value="${upAddress}"/></li>
						<li>${updiscode}</li>
						<li></li>
					</ul>

					<br />

					<!-- 訂單商品列表 -->
					<div class="it49_order_productlist" data-order_uid="500243397"
						style="display: block;">
						<table>
							<tbody>
								<tr>
									<td class="it49product_img"></td>
									<td style="font-weight: bolder;" class="amount">商品名稱</td>
									<td style="font-weight: bolder" class="amount">遊戲類型</td>
									<td style="font-weight: bolder" class="amount">訂購數量</td>
									<td style="font-weight: bolder" class="amount"><span
										class="jooPC_price01 new_price">金額小計</span></td>
								</tr>

							</tbody>
						</table>
						<div class="it49_order_productlist" id="items"
							style="display: block;"></div>
					</div>
				</div>
			</div>
			<button onclick="sub(${OrderNum})">送出修改</button><p><span id="codeMsg"></span></p>
		</div>
	</div>
</body>
</html>