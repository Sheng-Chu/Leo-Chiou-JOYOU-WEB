<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="zxx">
<script type="text/javascript">
	let x = localStorage.getItem('foot');
	x = x + ".";
	localStorage.setItem('foot', x);
	console.log(localStorage.getItem('foot'));

	//將x存入資料庫 setUserFoot(int 1000, String x)

	localStorage.clear();
	let number = "1";
	localStorage.setItem('foot', number);
	console.log(localStorage.getItem('foot'));
</script>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
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
<link rel="stylesheet" href="css/slideshowedit.css" type="text/css">
<link rel="stylesheet" href="css/searchbar.css" type="text/css">
</head>

<body>
	<jsp:include page="header.jsp" />

	<br />
	<!--  輪播位置-->
	<!-- Slideshow Start -->
	<div class="slider">
		<div class="slide_viewer">
			<div class="slide_group">
				<div class="slide">
					<img src="/img/index1.jpg"
						style="width: 100%; height: 100%; width: 900px; height: 350px">
				</div>
				<div class="slide">
					<img src="/img/index2.jpg"
						style="width: 100%; height: 100%; width: 900px; height: 350px">>
				</div>
				<div class="slide">
					<img src="/img/index3.jpg"
						style="width: 100%; height: 100%; width: 900px; height: 350px">>
				</div>
				<div class="slide">
					<img src="/img/index4.jpg"
						style="width: 100%; height: 100%; width: 900px; height: 350px">>
				</div>
				<!-- 新增slide -->
			</div>
		</div>
	</div>
	<!-- End // .slider -->

	<div class="slide_buttons"></div>
	<br />
	<br />

	<!-- Blog Section End -->

	<jsp:include page="footer.jsp" />
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
	<script src="js/slideeditshow.js"></script>


	<script type="text/javascript">
		var xhr = new XMLHttpRequest();

		xhr.open("GET", "<c:url value='/orderlist.json'/>", true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {

				eight = JSON.parse(xhr.responseText);

			}
		}

		var xhr1 = new XMLHttpRequest();

		xhr1.open("GET", "<c:url value='/memberlist.json'/>", true);
		xhr1.send();
		xhr1.onreadystatechange = function() {
			if (xhr1.readyState == 4 && xhr1.status == 200) {

				gender = JSON.parse(xhr1.responseText);

			}

		}

		var xhr2 = new XMLHttpRequest();

		xhr2.open("GET", "<c:url value='/footlist.json'/>", true);
		xhr2.send();
		xhr2.onreadystatechange = function() {
			if (xhr2.readyState == 4 && xhr2.status == 200) {

				foot = JSON.parse(xhr2.responseText);

			}

		}
	</script>
</body>

</html>