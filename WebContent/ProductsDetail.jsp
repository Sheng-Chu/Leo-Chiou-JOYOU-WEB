<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>揪遊 JOYOU | BOARD GAMES</title>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>

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


<script>
	
</script>
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
						<h2>商品瀏覽</h2>
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
							<img class="product__details__pic__item--large"
								src="img/${imgName}" alt="">
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="product__details__text">
						<h3>${productName}</h3>
						<div class="product__details__price">NT.${productPrice}</div>
						<p>庫存數量：${productStock}</p>
						<p>${productIntro}</p>
						<FORM name="form1"
							action="<c:url value='BuyProductsServlet.do' />" method="POST">
							<select name='counts'>
								<c:forEach var="i" begin="1" end="${productStock}">
									<option <c:out value="${i}" />>${i}</option>
								</c:forEach>
							</select> <Input type='hidden' name='productId' value='${productId}'>
							<Input type='hidden' name='productName' value='${productName}'>
							<Input type='hidden' name='productPrice' value='${productPrice}'>
							<Input type='hidden' name='productLang' value='${productLang}'>
							<Input type='hidden' name='imgName' value='${imgName}'> <Input
								type='hidden' name='counts' value='${counts}'> <Input
								type='hidden' name='pageNo' value='1'> <a
								style="margin-left: 30px"
								href="javascript:document.form1.submit();" class="primary-btn">ADD
								TO CARD</a>
						</FORM>



						<ul>
							<li><b>遊戲類型</b> <span>${typeName}</span></li>
							<li><b>遊戲適齡</b> <span>${productAge}</span></li>
							<li><b>建議人數</b> <span>${suggestNum}</span></li>
							<li><b>遊戲語言</b><span>${productLang}</span></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Related Product Section End -->

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