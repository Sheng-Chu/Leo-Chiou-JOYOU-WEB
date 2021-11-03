<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reply</title>
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

#reply {
	width: 650px;
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
<link rel="stylesheet" href="css/style6.css" type="text/css">
<!-- login Begin-->

<!-- login End-->

<script>
	var hasError = false;

	var alink = document.getElementById("accountCheck");
	var div = document.getElementById('result0c');
	var sendData = document.getElementById("sc");
	var lclick;

	function clickgoodc() {
		var lcount = document.getElementById("content10").value;
		if (lclick == true) {
			lcount + 1;
		} else {
			lcount - 1;
		}
		var xhr2 = new XMLHttpRequest();
		xhr2.open("POST", "<c:url value='/UpdateForumServlet'/>", true);
		xhr2.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		xhr2.send("contentL=" + content10);
		var jsonGroup = {
			"contentL" : content10,
		}
		window.location.reload()

	}
	function clickgoodr() {
		var lcount = document.getElementById("content10").value;
		if (lclick == true) {
			lcount + 1;
		} else {
			lcount - 1;
		}
		var xhr3 = new XMLHttpRequest();
		xhr3.open("POST", "<c:url value='/UpdateReplyServlet'/>", true);
		xhr3.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		xhr3.send("replyL=" + rBean[i].replyL);
		var jsonGroup = {
			"replyL" : rBean[i].replyL,
		}
		window.location.reload()

	}

	function dc1() {
		var xhr4 = new XMLHttpRequest();
		xhr4.open("POST", "<c:url value='/DeleteForumServlet'/>", true);
		xhr4.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		xhr4.send("contentId=" + contentid);
		window.location.href = "http://localhost:8080/JoYouProject/ForumListIndex.jsp";

	}

	function dc2(gnm) {
		var xhr5 = new XMLHttpRequest();
		xhr5.open("POST", "<c:url value='/DeleteReplyServlet'/>" + "?replyId="
				+ gnm, true);
		xhr5.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");

		xhr5.send("replyId=" + gnm);

		var jsonGroup = {
			"replyId" : gnm,
		}
		window.location.reload()

	}

	function cc() {
		document.getElementById("rc").value = "";
	}

	function mm() {
		console.log("74");
		hasError = false;
		// 讀取欄位資料	  
		var rc = document.getElementById("rc").value;

		var div0 = document.getElementById('result0c');
		var div1 = document.getElementById('result1c');

		var divResult = document.getElementById('resultMsg');
		if (!rc) {
			div1.innerHTML = "請輸入回復內容";
		} else {
			div1.innerHTML = "";
		}

		console.log("97");

		if (hasError) {
			return false;
		}
		var xhr1 = new XMLHttpRequest();
		xhr1.open("POST", "<c:url value='/InsertReplyServlet'/>", true);
		xhr1.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");

		console.log("105");

		xhr1.send("replyContent=" + rc);

		var jsonGroup = {
			"Content" : rc,
		}
		window.location.reload()

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
	var contentid = GET['contentId'];

	var hasError = false;

	window.onload = function() {
		var xhr1 = new XMLHttpRequest();
		xhr1.open("GET", "<c:url value='/SelectSingleForumServlet'/>"
				+ "?contentId=" + contentid, true);
		xhr1.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		xhr1.send();
		xhr1.onreadystatechange = function() {
			if (xhr1.readyState == 4 && xhr1.status == 200) {
				var fBean = JSON.parse(xhr1.responseText);
				var content4 = fBean.contentTitle;
				var content1 = fBean.Content;
				var content2 = fBean.memberId;
				var content3 = fBean.memberNickName;

				var content10 = fBean.contentL;
				var divs = document.getElementById("content4");
				var divs1 = document.getElementById("content1");
				var divs2 = document.getElementById("content2");
				var divs3 = document.getElementById("content3");
				var divs4 = document.getElementById("imgName");

				var divs10 = document.getElementById("content10");
				divs.innerHTML = content4;
				divs1.innerHTML = content1;
				divs2.innerHTML = content2;
				divs3.innerHTML = content3;
				divs4.innerHTML = "<img src='up_NoUsed/"+fBean.imageFileName +"' id='mP' class='profile' alt='' align='left' border='0' /> <br />";

				divs10.innerHTML = content10;
			}
		}
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/ShowAllReplyServlet'/>" + "?contentId="
				+ contentid, true);
		xhr.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		xhr.send();
		var content5 = "";
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var rBean = JSON.parse(xhr.responseText);
				for (var i = 0; i < rBean.length; i++) {
					content5 += "<div><div style='clear: both;'>&nbsp;</div><div class='entry'><p><img src='up_NoUsed/"+ rBean[i].imageFileName+"' id='mP' class='profile' alt=''align='left' border='0' /><br /><div class='name'>使用者帳號："
							+ rBean[i].memberId
							+ "</div><div class='name'>使用者暱稱："
							+ rBean[i].memberNickName
							+ "</div><br/><p>"
							+ rBean[i].replyContent
							+ "</p></div><div><table width='650px' height='20px'><tr>"
							+ "<td><div style='float:right'><button style='border: 0px; background-color: white;'><a href ='ReplyUpdate.jsp?replyId="
							+ rBean[i].replyId
							+ "' class=''><img src='img/repair.jpg' width='50' height='50'/></a></button><button style='border: 0px; background-color: white;' onclick = 'dc2("
							+ rBean[i].replyId
							+ ")'><img src='img/trash.jpg' width='60' height='60' /></button></td><div></tr></table></div><hr size='8px' align='center' width='100%'></div>"

				}
				content5 += "<div style='clear: both;'>&nbsp;</div></div>"
				var divs5 = document.getElementById("reply");
				divs5.innerHTML = content5;
			}
		}

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

	<div>
		<div>
			<div>
				<div>
					<div style="width: 650px; margin: 0px auto;">
						<br />
						<h2 style="font-weight: bold;" id="content4" align="center"></h2>
						<div style="clear: both;">&nbsp;</div>
						<div>
							<p>
							<div id="imgName"></div>
							<div id="mId" class="name">
								使用者帳號：<span id="content2" /></span>
							</div>
							<div id="mNN" class="name">
								使用者暱稱：<span id="content3" /></span>
							</div>
							<br />
							<br />

							<div style="width: 650px;" id="content1"></div>

						</div>
						<div>
							<table width="650px" height="20px">
								<tr>
									<td><div style="float: right;">
											<button style="border: 0px; background-color: white;"
												onclick="location.href='ForumUpdate.jsp'">
												<img src="img/repair.jpg" width="50" height="50" />
											</button>

											<button style="border: 0px; background-color: white;"
												onclick="dc1()">
												<img src="img/trash.jpg" width="60" height="60" />
											</button>
										</div></td>

								</tr>
							</table>
						</div>
						<hr size="8px" align="center" width="650px">
						<h4 style="font-weight: bold;">留言列表</h4>
						<div id="reply" /></div>
						<div style="clear: both;"></div>
					</div>
				</div>
			</div>
			<!-- end #content -->
			<div>
				<table style="margin: 0px auto; width: 650px;">
					<tr>
						<td colspan="2"><p>
							<h3 align="center">
								<b>發表回覆</b>
							</h3>
							</p> <br /></td>
					</tr>

					<tr>
						<td><p id="result1c"></p></td>
						<td><textarea id="rc" name="content"
								style="width: 750px; height: 200px;"></textarea></td>
					</tr>
					<tr>
						<td align="center" colspan="2"><input type="button"
							name="sent" id="sc" onclick="mm()" value="送出" /> <input
							type="button" value="清除" onclick="cc()"></input></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	</div>


	<jsp:include page="footer.jsp" />
</body>

</html>