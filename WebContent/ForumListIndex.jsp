<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="description" content="JOYOU BOARD GAMES">
<meta name="keywords" content="JOYOU, BOARD GAMES, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>揪遊 JOYOU | BOARD GAMES</title>
<style>
.color{
background:	
}
.container {center-align;
	
}

.t1 {center-align;width ="100";
	
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
</head>
<script>
	var hasError = false;

	var alink = document.getElementById("accountCheck");
	var div = document.getElementById('result0c');
	var sendData = document.getElementById("sc");

	function mm() {
		console.log("74");
		hasError = false;
		// 讀取欄位資料	  
		var ct = document.getElementById("ct").value;
		var c = document.getElementById("c").value;
		var dt = new Date();
		var ldt = new Date();

		var div0 = document.getElementById('result0c');
		var div1 = document.getElementById('result1c');

		var divResult = document.getElementById('resultMsg');
		if (!ct) {
			div0.innerHTML = "請輸入文章標題";
		} else {
			div0.innerHTML = "";
		}
		if (!c) {
			div1.innerHTML = "請輸入文章內容";
		} else {
			div1.innerHTML = "";
		}

		console.log("97");

		if (hasError) {
			return false;
		}
		var xhr1 = new XMLHttpRequest();
		xhr1.open("POST", "<c:url value='/InsertForumServlet'/>", true);
		xhr1.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");

		console.log("105");

		xhr1.send("contentTitle=" + ct + "&contentId=2" + "&Content=" + c
				+ "&contentDate=" + dt + "&contentLatestUpdate=" + ldt);

		var jsonGroup = {
			"contentTitle" : ct,
			"Content" : c,
			"contentDate" : dt,
			"contentLatestUpdate" : ldt
		}
		window.location.reload();

	}
</script>


<script>
	window.onload = function() {
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/ShowAllForumServlet'/>", true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var content = '<table id="forum" width="1000" border="1" cellspacing="0" cellpadding="5" align="center"> <tr>  <th id= "t1" width="100">文章編號</th> <th id= "t2" width="500">文章標題 <th id= "t3" width="200">發表日期</th><th id= "t4" width="200">最後回覆日期</th><th id= "t5" width="150">作者</th></tr>';
				var fBean = JSON.parse(xhr.responseText);
				for (var i = 0; i < fBean.length; i++) {
					content += '<td>' + fBean[i].contentId + '		</td><td><a href="Reply.jsp?contentId='+fBean[i].contentId+'" class=""><div class="thumb">'
							+ fBean[i].contentTitle + '</a></td><td>'
							+ fBean[i].contentDate + '</td><td>'
							+ fBean[i].contentLatestUpdate + '</td><td>'
							+ fBean[i].memberNickName + '</td></tr>';

				}
				content += '</table>';
				var divs = document.getElementById("list");
				divs.innerHTML = content;
			}

		}
	}
</script>

<body>
	<jsp:include page="header.jsp" />
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>文章列表</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->
	<br />
	<div class = "color">
	<div id="list" align="center"></div>
     </div>
	<div id="container" align="center">

		<table align="center" border="0" width="500">
			<tr>
				<td colspan="2"><p>
					<h3>發表文章</h3>
					</p> <br /></td>
			</tr>
			<!--     <tr>
        <td width="100"><p>暱稱:</p></td>
        <td><input type="text" name="user" size="20" maxlength="20"></input></td>
      </tr>
      <tr>
        <td><p>E-Mail:</p></td>
        <td><input type="text" name="email" size="50" maxlength="50" onblur="checkEmail('chkEmailResult');"></input></td>

      </tr>-->
      
			<tr>
				<td><p>主題:</p>
					<p id="result0c"></p></td>
				<td><input id="ct" type="text" name="title" size="50"
					maxlength=50"></input></td>
			</tr>
			<tr>
				<td><p>文章內容:</p>
					<p id="result1c"></p></td>
				<td><textarea id="c" name="content" cols="50" rows="10"></textarea></td>
			</tr>
			<tr>
				<td align="center" colspan="2"><input type="button" name="sent"
					id="sc" onclick="mm()" value="送出" /> <input type="reset"
					value="清除"></input></td>
			</tr>
		</table>

	</div>
	
	<jsp:include page="footer.jsp" />
</body>

</html>