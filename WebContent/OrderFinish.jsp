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
<link rel="stylesheet" href="css/style2.css" type="text/css">
<link rel="stylesheet" href="css/searchbar.css" type="text/css">
<!-- login Begin-->

<!-- login End-->

<script type="text/javascript">
	
	let number = "9";//數字依照自己頁面調整
	let x = localStorage.getItem('foot');
	x=x+number;
	localStorage.setItem('foot',x);
	
	
	console.log(localStorage.getItem('foot'));

	
</script>
</head>

<body>
	<jsp:include page="header.jsp" />


	<!-- member-into End-->
	<div class="FOR_MAIN">
		<div class="SB_MemberContent_login">
			<span>謝謝您！ </span>&nbsp; 您的訂單已經成立！
		</div>
		<!-- -->
		<div class="SB_MemberContent">
			<!-- 步驟 -->
			<div class="buyok_img">
				<img src="img/ok.png" width="150" height="150">
			</div>
			<div class="SB_MemberData">
				<div class="SB_MemberOpening">
					<div class="SB_MemberOpening_in  SB_tablemarginB30">
						訂單編號：<span>${OrderNum}</span>
						<!--您好，恭喜您成為會員！-->
						<br> 訂單成立後，可點選下方連結查看您的訂單內容，謝謝您的訂購，若有相關訂單歡迎撥打本公司服務專線，將有專人為您服務。
						<!--信箱內！-->
					</div>
					<div class="SB_MemberOpening_btn jooshop_btn_color">
						<a href="OrderDetail.jsp">查看訂單<!--訂單查詢--></a>
					</div>
				</div>

			</div>
		</div>
	</div>
	
	
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