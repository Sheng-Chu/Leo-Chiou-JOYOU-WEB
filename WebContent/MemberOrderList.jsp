<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="JOYOU BOARD GAMES">
<meta name="keywords" content="JOYOU, BOARD GAMES, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>揪遊 JOYOU | BOARD GAMES</title>

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
<link rel="stylesheet" href="css/style4.css" type="text/css">
<link rel="stylesheet" href="css/searchbar.css" type="text/css">


<script type="text/javascript">
	window.onload = function() {
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/ShowAllOrderServlet.do'/>", true);
		xhr.send();

		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				if (xhr.status == 200) {
					var responseData = xhr.responseText;
					displayOrders(responseData);
				}
			}
		}

		function displayOrders(responseData) {
			var content = "";
			var data = responseData.split("&&&&&");
			var Orders = JSON.parse(data[0]);
			var date = JSON.parse(data[1]);
			for (var i = 0; i < Orders.length; i++) {
				content +="<div  class='it49_perorder'>";
				content += "<ul class='it49_order_itemtitle'><li>訂單編號</li><li>日 期</li><li>備 註</li>";
				content += "<li>付款方式</li><li>運送方式</li><li>訂單總額</li><li></li></ul>";
				content += "<ul class='it49_order_detail'>";
				content += "<li><a href='${pageContext.request.contextPath}/PrepareOrderDetailServlet.do?"+"OrderId="+Orders[i].orderId +"'/>"+ Orders[i].orderId + "</li>";
				content += "<li>"+ date[i] +"</li>";
				content += "<li>" + Orders[i].remarks + "</li>";
				content += "<li>線上刷卡</li><li>物流運送</li>";
				content += "<li>" + Orders[i].orderAmount + "</li>";
				content += "<li><span style='font-weight:bolder' class='jooPC_price01 new_price' id='total'></span></li>";
				content += "</ul>";
				content += "<ul class='it49_order_itemtitle'><li>訂購人</li><li>訂購人電話</li><li>收件人</li><li>收件人電話</li>";
				content += "<li>收件地址</li><li>訂單折扣</li><li></li></ul>";
				content += "<ul class='it49_order_detail'>";
				content += "<li>${memberTrueName}</li>";
				content += "<li>${memberPhone}</li>";
				content += "<li>" + Orders[i].receiver + "</li>";
				content += "<li>" + Orders[i].receiverPhone + "</li>";
				content += "<li>" + Orders[i].shippingAddress + "</li>";
				content += "<li>"+ Orders[i].discount +"</li>";
				content += "<li><span style='font-weight:bolder' class='jooPC_price01 new_price'></span></li></ul></div>";
			}
			document.getElementById("Orders").innerHTML = content;
		}

	}
</script>
</head>

<body>
	<jsp:include page="header.jsp" />

	<!-- 訂單查詢 開始 如下-->
	<div class="it49">
		<div class="it49_title">
			訂單查詢
			<!---->
		</div>
		<!--頁籤切換區塊 如下-->
		<div  id="Orders" class="it49_tabinner">
			
			</div>
		</div>
		<!--it49_perorder-->
	<!-- 訂單查詢 結束-->

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