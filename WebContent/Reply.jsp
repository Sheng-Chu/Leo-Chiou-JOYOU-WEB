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
.color{
background:	#BEBEBE
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
	width: 75px;
	height: 75px;
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
		var div1 = document.getElementById('result1c');
		
		var divResult = document.getElementById('resultMsg');
		if (!rc){
			div1.innerHTML="請輸入回復內容";
		} else {
			div1.innerHTML = "";
		}
   		
		console.log("97");

   		if (hasError){
       		return false;
   		}
   		var xhr1 = new XMLHttpRequest();
   		xhr1.open("POST", "<c:url value='/InsertReplyServlet'/>", true);
   		xhr1.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        
        
   		console.log("105");

   		xhr1.send("replyContent=" +rc);
		
		var jsonGroup = {	
			"Content": rc,
   		}
		window.location.reload();
		

     }
	
  
    


   </script>

<script>
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
		xhr1.open("GET",
				"<c:url value='/SelectSingleForumServlet'/>"+"?contentId="+contentid	, true);
		xhr1.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		xhr1.send();
		xhr1.onreadystatechange = function() {
			if (xhr1.readyState == 4 && xhr1.status == 200) {
				 var FBean = JSON.parse(xhr1.responseText);
			
				var content = "<div class='message-board'><div class='line'></div><div><img class='profile' src='http://pic12.nipic.com/20101229/4111507_172017041123_2.jpg' width='50'/><div class='comment-box1'>"+FBean.Content+"</div></div>"
              
				var divs = document.getElementById("content");
				divs.innerHTML = content;
			}
		}
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/ShowAllReplyServlet'/>", true);
		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		xhr.send();
		var content = "<div class='message-board'>"
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var rBean = JSON.parse(xhr.responseText);
				for (var i = 0; i < rBean.length; i++) {
					content += "<div class='line'></div><div><img class='profile' src='http://i1.wp.com/inews.gtimg.com/newsapp_bt/0/4735211464/641' width='50'/><div class='comment-box'>"+rBean[i].replyContent+"</div>"

				}
				content += "</div>"
				var divs = document.getElementById("reply");
				divs.innerHTML = content;
			}
		}

	}
</script>






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
						<h2>討論區</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->
	<br />

    <div class = "color">
	<div id="content"></div>
	<div id="reply"></div>

	<div id="container" align="center">
		<table align="center" border="0" width="500">
			<tr>
				<td colspan="2"><p>
					<h3>發表回覆</h3>
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
				<td><p>回覆內容:</p>
					<p id="result1c"></p></td>
				<td><textarea id="rc" name="content" cols="50" rows="10"></textarea></td>
			</tr>
			<tr>
				<td align="center" colspan="2"><input type="button" name="sent"
					id="sc" onclick="mm()" value="送出" /> <input type="reset"
					value="清除"></input></td>
			</tr>
		</table>
	</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>

</html>