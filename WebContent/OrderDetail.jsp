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
	var remarks = document.getElementById("remarks");
	var date = document.getElementById("date");
	var total = document.getElementById("total");
	var ordername = document.getElementById("ordername");
	var orderphone = document.getElementById("orderphone");
	var receivername = document.getElementById("receivername");
	var receiverphone = document.getElementById("receiverphone");
	var address = document.getElementById("address");
	var discode = document.getElementById("discode");
	var selectElement = document.getElementById('orderId');
	var xhr = new XMLHttpRequest();
	var xhr2 = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/ShowSignalOrderServlet.do'/>", true);
	xhr.send();

	xhr2.open("POST", "<c:url value='/ShowSignaltemsServlet.do'/>", true);
	xhr2.send();
	
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			let result = JSON.parse(xhr.responseText);
			
			remarks.innerHTML = "<span>" + result.remarks + "</span>";
			date.innerHTML = "<span>" + result.date + "</span>";
			total.innerHTML = "<span>" + result.amount + "</span>";
			ordername.innerHTML = "<span>" + result.membername + "</span>";
			orderphone.innerHTML = "<span>" + result.memberphone + "</span>";
			receivername.innerHTML = "<span>" + result.receivername + "</span>";
			receiverphone.innerHTML = "<span>" + result.receiverphone + "</span>";
			address.innerHTML = "<span>" + result.address + "</span>";
			discode.innerHTML = "<span>" + result.discode + "</span>"
		}
	}

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
</script>
</head>

<body>
	<jsp:include page="header.jsp" />

	<!-- 訂單查詢 開始 如下-->
	<div class="it49">
		<div class="it49_title">
			訂單明細
			<!---->
		</div>
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
					<li id="date"></li>
					<li id="remarks"></li>
					<li>線上刷卡</li>
					<li>物流運送</li>
					<li><span style="font-weight:bolder;" class='jooPC_price01 new_price' id="total"></span></li>
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
					<li id="ordername"></li>
					<li id="orderphone"></li>
					<li id="receivername"></li>
					<li id="receiverphone"></li>
					<li id="address"></li>
					<li ><span style="font-weight:bolder;" class="jooPC_price01 new_price" id="discode"></span></li>
					<li></li>
				</ul>

				<br/>

				<!-- 訂單商品列表 -->
				<div class="it49_order_productlist" data-order_uid="500243397" style="display: block;">
					<table>
						<tbody>
							<tr>
								<td class="it49product_img"></td>
								<td style="font-weight:bolder;" class="amount">商品名稱</td>
								<td style="font-weight:bolder" class="amount">遊戲類型</td>
								<td style="font-weight:bolder" class="amount">訂購數量</td>
								<td style="font-weight:bolder" class="amount"><span class="jooPC_price01 new_price">金額小計</span></td>
							</tr>
							
						</tbody>
					</table>
					<div class="it49_order_productlist" id="items" style="display: block;"></div>
				</div>
				<!-- 訂單商品列表 結束-->
			</div>
			<!--it49_perorder-->
		</div>
		<!--頁籤切換區塊 結束-->

	</div>
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