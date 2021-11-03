<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改</title>
<style>
.color {
	background: gray;
}

.message-board {
	margin: 0 0 0 25%
}

.comment-box1 {
	height: 220px;
	width: 600px;
	background: white;
	margin: 3% 0 0 0;
	display: inline-block;
	border-radius: 2%;
	box-shadow: 2px 2px 20px #e3e3e3;
}

.profile {
	background-image: center;
	background-position: fixed;
	width: 100px;
	height: 100px;
	border-radius: 50%;
	margin: 2% 2% 3% 2%;
	z-index: 2;
	position: relative;
}

.profile {
	background-image: center;
	background-position: fixed;
	width: 75px;
	height: 75px;
	border-radius: 50%;
	margin: 2% 2% 3% 2%;
	z-index: 2;
	position: relative;
}

.load-more {
	background: #363636;
	width: 20px;
	height: 20px;
	border-radius: 50%;
	z-index: 2;
	position: relative;
	margin: 2% 2% 0 4.95%;
}

.indicator {
	display: inline-block;
	margin: 0 0 0 50px;
	font-family: helvetica;
	font-size: 14px;
	width: 100px;
}

.line {
	border-left: 1px solid grey;
	z-index: 1;
	height: 650px;
	margin-top: 3.2%;
	margin-left: 4.5%;
	position: fixed;
}

.comment-box {
	height: 110px;
	width: 600px;
	background: white;
	margin: 3% 0 0 0;
	display: inline-block;
	border-radius: 2%;
	box-shadow: 2px 2px 20px #e3e3e3;
}
</style>
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
<!-- login Begin-->

<!-- login End-->
<script>
	function cc() {
		document.getElementById("rc").value = "";
	}

	function getData() {

		var strUrl = window.location.toString();

		var getPara, ParaVal;

		var aryPara = [];

		if (strUrl.indexOf("?") != -1) {

			var getSearch = strUrl.split("?");

			getPara = getSearch[getSearch.length - 1].split("&");

			for (var i = 0; i < getPara.length; i++) {

				ParaVal = getPara[i].split("=");

				aryPara[ParaVal[0]] = ParaVal[1];

			}

		}
		return aryPara;

	}
	var GET = getData();
	var replyid = GET['replyId'];
	var hasError = false;

	window.onload = function() {
		var xhr1 = new XMLHttpRequest();
		xhr1.open("GET", "<c:url value='/SelectSingleReplyServlet'/>"
				+ "?replyId=" + replyid, true);
		xhr1.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		xhr1.send();
		xhr1.onreadystatechange = function() {
			if (xhr1.readyState == 4 && xhr1.status == 200) {
				var rBean = JSON.parse(xhr1.responseText);

				var content1 = rBean.replyContent;
				var content2 = rBean.memberId;
				var content3 = rBean.memberNickName;
				var content5 = rBean.replyId;
				var divs1 = document.getElementById("rc");
				var divs2 = document.getElementById("content2");
				var divs3 = document.getElementById("content3");
				var divs4 = document.getElementById("mimg");
				divs1.innerHTML = content1;
				divs2.innerHTML = content2;
				divs3.innerHTML = content3;
				divs4.innerHTML = "<img src='up_NoUsed/"+rBean.imageFileName +"' id='mP' class='profile' align='left' border='0'/><br />";

			}
		}

	}

	var hasError = false;

	var alink = document.getElementById("accountCheck");
	var div = document.getElementById('result0c');
	var sendData = document.getElementById("sc");

	function mm() {

		console.log("74");
		hasError = false;
		// 讀取欄位資料	  
		var rc = document.getElementById("rc").value;

		var div0 = document.getElementById('result0c');
		var div4 = document.getElementById('rc');

		var divResult = document.getElementById('resultMsg');
		if (!rc) {
			div4.innerHTML = "請輸入修改內容";
		} else {
			div4.innerHTML = "";
		}

		console.log("97");

		if (hasError) {
			return false;
		}
		var xhr1 = new XMLHttpRequest();
		xhr1.open("POST", "UpdateReplyServlet", true);

		xhr1.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		xhr1.send("replyContent=" + rc + "&replyId=" + replyid);
		console.log("105");

	}
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
						<h2>討論區</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->
	<br />

	<div id="page">
		<div id="page-bgtop">
			<div id="page-bgbtm">
				<!-- end #sidebar -->
			</div>
			<div id="content">
				<div class="post">
					<h2 class="title" align='center'>
						<b>留言修改</b>
					</h2>
					<div style="clear: both;">&nbsp;</div>
					<div style="margin: 0px auto; width: 650px" class="entry">
						<div id="mimg"></div>
						<div id="mId" class="name">
							使用者帳號： <span id="content2" /></span>
							<div id="mNN" class="name">
								使用者暱稱： <span id="content3" /></span>
								<form name="form1" action="<c:url value='/UpdateReplyServlet'/>"
									enctype="application/x-www-form-urlencoded" method="post">
									<textarea name="replyContent" id="rc"
										style="width: 750px; height: 200px;"></textarea>
									<hr size="8px" align="center" width="750px">
									<div style="clear: both;">&nbsp;</div>
									<table style="margin: 0px auto">
										<tr>
											<td align="center" colspan="2"><input type="submit"
												name="sent" id="sc" value="儲存" /><input type="button"
												value="清除" onclick="cc()"></input></td>
										</tr>
									</table>
								</form>
								<br />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- end #content -->
	<jsp:include page="footer.jsp" />
</body>

</html>