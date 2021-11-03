<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="today" class="java.util.Date" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>揪遊 JOYOU | BOARD GAMES</title>

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


<script>
	function checkCode() {
		
		let code = document.getElementsByName("code")[0];
		let Vobj1 = document.getElementById("checkCodeMsg");
		let Vobj2 = document.getElementById("amount");
		let Vobj3 = document.getElementById("newTotal");
		let xhr = new XMLHttpRequest();
		xhr.open("POST", "<c:url value='/DiscountServlet.do?' />", true);
		xhr.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		xhr.send("code=" + code.value);
		let msg = "";
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let result = JSON.parse(xhr.responseText);
				Vobj1.innerHTML = "<span>" + result.codeMsg + "</span>";
				Vobj2.innerHTML = "<span>" + "NT." + result.amount + "</span>";
				Vobj3.innerHTML = "<span>" + "NT." + result.newTotal + "</span>";
			}
		}
	}

	function dataAuoto(){
		 document.getElementsByName("receivername")[0].value="黃小明";
		 document.getElementsByName("receiverphone")[0].value="0910222313";
		 document.getElementsByName("address")[0].value="台北市中正區中正路1號";
		 document.getElementsByName("mail")[0].value="Milk10225@gmail.com";
		 document.getElementsByName("remarks")[0].value="盡速送達！";
		}
	
</script>
<script type="text/javascript">
	
	let number = "8";//數字依照自己頁面調整
	let x = localStorage.getItem('foot');
	x=x+number;
	localStorage.setItem('foot',x);
	
	
	console.log(localStorage.getItem('foot'));

	
</script>
</head>
<body>
	<c:set var="funcName" value="CHE" scope="session" />

	<c:choose>
		<c:when test="${ShoppingCart.subtotal > 0}">
			<c:set var="subtotalMessage" value="金額小計:${ShoppingCart.subtotal} 元" />
			<c:set var="subtotal" value="${ShoppingCart.subtotal}" />
		</c:when>
		<c:otherwise>
			<c:set var="subtotalMessage" value="金額小計:  0 元" />
			<c:set var="subtotal" value="0" />
		</c:otherwise>
	</c:choose>

	<jsp:include page="header.jsp" />	

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>結帳頁面</h2>
						<div class="breadcrumb__option"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div class="container">
			<div class="row"></div>
			<div class="checkout__form">
				<h4>訂單資料</h4>
				<form action="NcccPaymentPage.jsp" method="POST">
				<button type="button" onclick="dataAuoto()">✎ </button>
					<div class="row">
						<div class="col-lg-8 col-md-6">
							<div class="row">
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											訂購人姓名<span>*</span>
										</p>
										<input type="text" name="ordername" value="${memberNickName}">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											訂購人電話<span>*</span>
										</p>
										<input type="text" name="orderphone" value="${memberPhone}">
									</div>
								</div>
							</div>
							<div class="checkout__input">
								<p>
									收件人姓名<span>*</span>
								</p>
								<input type="text" name="receivername" placeholder="Recipient">
							</div>
							<div class="checkout__input">
								<p>
									收件人電話<span>*</span>
								</p>
								<input type="text" name="receiverphone"
									placeholder="Recipient Phone">
							</div>
							<div class="checkout__input">
								<p>
									收件地址<span>*</span>
								</p>
								<input type="text" name="address" placeholder="Street Address"
									class="checkout__input__add">
							</div>
							<div class="checkout__input">
								<p>
									電子郵件<span>*</span>
								</p>
								<input type="text" name="mail" placeholder="E-MAIL"
									class="checkout__input__add">
							</div>
							<div class="checkout__input">
								<p>
									訂單備註
								</p>
								<input type="text" name="remarks" placeholder="Remarks">
							</div>

							<div class="checkout__input">
								<p>
									折扣碼
								</p>
								<input type="text" name="code" onChange="checkCode()"
									placeholder="Enter your coupon code">
								<p id="checkCodeMsg"
									style="color: red; font-weight: blod; font-size: 14px"></p>
							</div>
						</div>
						
						<div class="col-lg-4 col-md-6">
							<div class="checkout__order">
								<h4>購物清單</h4>
								<div class="checkout__order__products">
									商品名稱及數量<span>金額</span>
								</div>
								<c:forEach varStatus="vs" var="orderItemBean"
									items="${ShoppingCart.content}">
									<ul>
										<li>${orderItemBean.value.productName}X
											${orderItemBean.value.orderitemQty} <span>NT.${orderItemBean.value.totalPrice}</span>
										</li>

									</ul>
								</c:forEach>
								<div class="checkout__order__subtotal">
									折扣前<span>NT.${subtotal}</span>
								</div>

								<div class="checkout__order__total">
									折扣金額<span id="amount">NT.0</span> <br /> <br /> <br /> 
									總金額<span id="newTotal">NT.${subtotal}</span>
								</div>
								訂單日期：
								<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" />
								<div class="checkout__input__checkbox">
									<br /> <br /> <br /> <br />
									<h4>付款方式</h4>
									<label for="acc-or"> 郵局或銀行匯款 <input type="checkbox"
										id="acc-or"> <span class="checkmark"></span>
									</label>
								</div>

								<div class="checkout__input__checkbox">
									<label for="payment"> 貨到付款 <input type="checkbox"
										id="payment"> <span class="checkmark"></span>
									</label>
								</div>
								<div class="checkout__input__checkbox">
									<label for="paypal"> 信用卡付款 <input name="card"
										type="checkbox" id="paypal"> <span class="checkmark"></span>
									</label>
								</div>
								<input type="hidden" name="amountTotal" value="${subtotal}">
								<button type="submit" class="site-btn" onclick="">送出訂單</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
	<!-- Checkout Section End -->

<jsp:include page="footer.jsp" />

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