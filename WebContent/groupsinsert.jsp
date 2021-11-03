<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="zxx">

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
<link rel="stylesheet" href="css/slideshow.css" type="text/css">
<link rel="stylesheet" href="css/searchbar.css" type="text/css">
</head>

<body>
<jsp:include page="header.jsp" />	
<html>
<head>

<script>
var hasError = false;
window.onload = function() {
	var alink = document.getElementById("accountCheck");
	var div = document.getElementById('result0c');
   var sendData = document.getElementById("sendData");
   sendData.onclick = function() {
		hasError = false;
   		// 讀取欄位資料	  
		var groupnameValue = document.getElementById("groupname").value;
		var gametypeIdValue = document.getElementById("gametypeId").value;
		var groupCountValue = document.getElementById("groupCount").value;
		var groupTimeValue = document.getElementById("groupTime").value;
		var storeIdValue = document.getElementById("storeId").value;
		var grouppriceValue = document.getElementById("groupprice").value;
		var startdateValue = document.getElementById("startdate").value;
		var enddateValue = document.getElementById("enddate").value;
		var deadlineValue = document.getElementById("deadline").value;
		var storeAddressValue = document.getElementById("storeAddress").value;
		var limitValue = document.getElementById("limit").value;
		var groupdescriptionValue = document.getElementById("groupdescription").value;
		var div0 = document.getElementById('result0c');
		var div1 = document.getElementById('result1c');
		var div2 = document.getElementById('result2c');
		var div3 = document.getElementById('result3c');
		var div4 = document.getElementById('result4c');
		var div5 = document.getElementById('result5c');
		var div6 = document.getElementById('result6c');
		var div7 = document.getElementById('result7c');
		var div8 = document.getElementById('result8c');
		var div9 = document.getElementById('result9c');
		var div10 = document.getElementById('result10c');
		var div11 = document.getElementById('result11c');
		var div12 = document.getElementById('result12c');
		var div13 = document.getElementById('result13c');
		var div14 = document.getElementById('result14c');
		var div15 = document.getElementById('result15c');
		var divResult = document.getElementById('resultMsg');
		if (!groupnameValue){
			setErrorFor(div1, "請輸入活動標題");
		} else {
			div1.innerHTML = "";
		}
   		if (!gametypeIdValue){
			setErrorFor(div2, "請輸入遊戲類型編號");
		} else {
           		div2.innerHTML = "";
       		}
   		
		if (!groupCountValue){
			setErrorFor(div3, "請輸入遊戲人數");
		} else {
           		div3.innerHTML = "";
       		}
		if (!groupTimeValue){
			setErrorFor(div4, "請輸入舉辦時間");
   		} 	else {
      		div4.innerHTML = "";
   		}
		if (!storeIdValue){
			setErrorFor(div5, "請輸入店家編號");
		} else {
			div5.innerHTML = "";
		}
   		if (!grouppriceValue){
			setErrorFor(div6, "請輸入活動費用");
		} else {
           		div6.innerHTML = "";
       		}
		if (!startdateValue){
			setErrorFor(div9, "請輸入活動開始日期");
		} else {
			div9.innerHTML = "";
		}
   		if (!enddateValue){
			setErrorFor(div10, "請輸入活動結束日期");
		} else {
           		div10.innerHTML = "";
       		}
   		
		if (!deadlineValue){
			setErrorFor(div11, "請輸入報名期限");
		} else {
           		div11.innerHTML = "";
       		}
   		
   		if (!storeAddressValue){
			setErrorFor(div12, "請輸入活動地點");  
   		}  else {
       		div12.innerHTML = "";
   		}
   		if (!limitValue){
			setErrorFor(div13, "請輸入人數上限");
   		} 	else {
      		div13.innerHTML = "";
   		}	
   		if (hasError){
       		return false;
   		}
   		var xhr1 = new XMLHttpRequest();

   		xhr1.open("POST", "GroupsInsert", true);
   		

		var jsonGroup = {
			"groupname": groupnameValue,
			"gametypeId": gametypeIdValue,
			"groupCount": groupCountValue,
			"groupTime": groupTimeValue, 	
		
			"groupprice": grouppriceValue,
			"startdate": startdateValue,
			"enddate": enddateValue,
			"deadline": deadlineValue,
			"storeAddress": storeAddressValue, 	
			"limit": limitValue,
			"groupdescription": groupdescriptionValue
			
   		}
	
		xhr1.setRequestHeader("Content-Type",
		"application/x-www-form-urlencoded");
xhr1.send("groupname=" + groupnameValue + "&gametypeId=" + gametypeIdValue
		+ "&groupCount=" + groupCountValue+"&groupTime="+groupTimeValue+"&groupprice="+grouppriceValue+
		"&startdate="+startdateValue+"&enddate="+enddateValue+"&deadline="+deadlineValue+"&storeAddress="+storeAddressValue+"&limit="+limitValue+"&groupdescription="+groupdescriptionValue);
	
   
   		xhr1.onreadystatechange = function() {
				// 伺服器請求完成
   		if (xhr1.readyState == 4 && (xhr1.status == 200 || xhr1.status == 201) ) {
      		result = JSON.parse(xhr1.responseText);
      		if (result.fail) {
		 		divResult.innerHTML = "<font color='red' >"
					+ result.fail + "</font>";
	  		} else if (result.success) {
				divResult.innerHTML = "<font color='GREEN'>"
					+ result.success + "</font>";
				div0.innerHTML = "";	
				div1.innerHTML = "";
				div2.innerHTML = "";
				div3.innerHTML = "";
				div4.innerHTML = "";	
				div5.innerHTML = "";
				div6.innerHTML = "";
				div7.innerHTML = "";
				div8.innerHTML = "";	
				div9.innerHTML = "";
				div10.innerHTML = "";
				div11.innerHTML = "";
				div12.innerHTML = "";	
				div13.innerHTML = "";
				div14.innerHTML = "";
	 		} else {
				if (result.groupIdError) {
          			div0.innerHTML = "<font color='green' size='-2'>"
	     				+ result.groupIdError + "</font>";
				} else {
          			div0.innerHTML = "";
				}
				if (result.groupnameError) {
	      			div1.innerHTML = "<font color='green' size='-2'>"
						+ result.groupnameError + "</font>";
				} else {
	      			div1.innerHTML = "";
	   			}
				if (result.gametypeIdError) {
          			div2.innerHTML = "<font color='green' size='-2'>"
						+ result.gametypeIdError + "</font>";
				} else {
          			div2.innerHTML = "";
    			}
				if (result.groupCountError) {
	    			div3.innerHTML = "<font color='green' size='-2'>"
						+ result.groupCountError + "</font>";
				} else {
          			div3.innerHTML = "";
				}
				if (result.groupTimeError) {
          			div4.innerHTML = "<font color='green' size='-2'>"
	     				+ result.groupTimeError + "</font>";
				} else {
          			div4.innerHTML = "";
				}
				if (result.storeIdError) {
	      			div5.innerHTML = "<font color='green' size='-2'>"
						+ result.storeIdError + "</font>";
				} else {
	      			div5.innerHTML = "";
	   			}
				if (result.grouppriceError) {
          			div6.innerHTML = "<font color='green' size='-2'>"
						+ result.grouppriceError + "</font>";
				} else {
          			div6.innerHTML = "";
    			}
				if (result.memberIDError) {
	    			div7.innerHTML = "<font color='green' size='-2'>"
						+ result.memberIDError + "</font>";
				} else {
          			div7.innerHTML = "";
				}
				if (result.groupmemberError) {
          			div8.innerHTML = "<font color='green' size='-2'>"
	     				+ result.groupmemberError + "</font>";
				} else {
          			div8.innerHTML = "";
				}
				if (result.startdateError) {
	      			div9.innerHTML = "<font color='green' size='-2'>"
						+ result.startdateError + "</font>";
				} else {
	      			div9.innerHTML = "";
	   			}
				if (result.enddateError) {
          			div10.innerHTML = "<font color='green' size='-2'>"
						+ result.enddateError + "</font>";
				} else {
          			div10.innerHTML = "";
    			}
				if (result.deadlineError) {
	    			div11.innerHTML = "<font color='green' size='-2'>"
						+ result.deadlineError + "</font>";
				} else {
          			div11.innerHTML = "";
				}
				if (result.storeAddressError) {
          			div12.innerHTML = "<font color='green' size='-2'>"
	     				+ result.storeAddressError + "</font>";
				} else {
          			div12.innerHTML = "";
				}
				if (result.limitError) {
	      			div13.innerHTML = "<font color='green' size='-2'>"
						+ result.limitError + "</font>";
				} else {
	      			div13.innerHTML = "";
	   			}
				if (result.groupnumberError) {
          			div14.innerHTML = "<font color='green' size='-2'>"
						+ result.groupnumberError + "</font>";
				} else {
          			div14.innerHTML = "";
    			}
				if (result.groupdescriptionError) {
	    			div15.innerHTML = "<font color='green' size='-2'>"
						+ result.groupdescriptionError + "</font>";
				} else {
          			div15.innerHTML = "";
				}
      		}
		} 
  	}
   	 //通過append()方法來追加資料

   	 	var imageFile = $("#imageFile")[0].files[0];
        var myForm = new FormData();
        myForm.append("imageFile", imageFile);
        xhr1.send(myForm);
	

}
  
   $(document).ready(function() {
   	$("#previewImage").hide();
       $("#imageFile").change(function() {
           var fileReader = new FileReader();
           fileReader.onload = function(e) {
           	$("#previewImage").show();
           	$("#previewImage").attr('src',e.target.result);
           }
           var imageFile = this.files[0];
           fileReader.readAsDataURL(imageFile);
       });
     
   });
function setErrorFor(input, message){
	input.innerHTML = "<font color='red' size='-2'>" + message + "</font>";
    hasError = true;
}

function dateValidation(str) {
	  var re = new RegExp("^([0-9]{4})[.-]{1}([0-9]{1,2})[.-]{1}([0-9]{1,2})$");
	  var days = [0, 31, 28, 31, 30,  31, 30, 31, 31, 30, 31, 30, 31];
	  var strDataValue;
	  var valid = true;
	  if ((strDataValue = re.exec(str)) != null) {
	    var y, m, d;
	    y = parseFloat(strDataValue[1]);
	    if (y <= 0 || y > 9999) { /*年*/
	      return false;
	    } 
	    m = parseFloat(strDataValue[2]);
	    
	    if (m < 1 || m > 12) { /*月*/
	        return false;
	    }
	    d = parseFloat(strDataValue[3]);
	    if ( y % 4 == 0 && y % 100 != 0 || y % 400 == 0 ){
	       days[2] = 29;
	    }  else {
	       days[2] = 28;
	    }
	    if (d <= 0 || d > days[m]) { /*日*/
	      valid = false;
	    }
	  } else {
	    valid = false;
	  }  
	  return valid;
	}


	
}
function inputData(){

    document.getElementsByName("groupname")[0].value="月下狼人殺";
    document.getElementsByName("groupCount")[0].value="11";
    document.getElementsByName("storeAddress")[0].value="台北市大安區忠孝東路四段15號2樓之3";
    document.getElementsByName("limit")[0].value="15";
//     document.getElementsByName("storeId")[0].value="9999";
    document.getElementsByName("groupprice")[0].value="60";
    document.getElementsByName("groupTime")[0].value="2020-10-09";
    document.getElementsByName("startdate")[0].value="2020-10-09";
    document.getElementsByName("enddate")[0].value="2020-10-12";
    document.getElementsByName("deadline")[0].value="2020-10-10";
    document.getElementsByName("gametypeId")[0].value="5001";
    document.getElementsByName("groupdescription")[0].value="我們約在貓咪貓咪6s東區旗艦店玩狼人殺吧";

    document.getElementsByName("groupname")[0].onchange();
    document.getElementsByName("groupCount")[0].onchange();
    document.getElementsByName("storeAddress")[0].onchange();
    document.getElementsByName("limit")[0].onchange();
    document.getElementsByName("storeId")[0].onchange();
    document.getElementsByName("groupprice")[0].onchange();
    document.getElementsByName("groupTime")[0].onchange();
    document.getElementsByName("startdate")[0].onchange();
    document.getElementsByName("enddate")[0].onchange();
    document.getElementsByName("deadline")[0].onchange();
    document.getElementsByName("gametypeId")[0].onchange();
    document.getElementsByName("groupdescription")[0].onchange();
    
    document.getElementsByName("userAccount")[0].onchange();
    document.getElementsByName("userPassword")[0].onchange();
    document.getElementsByName("userPassword2")[0].onchange();
    document.getElementsByName("userNickName")[0].onchange();
    document.getElementsByName("userTrueName")[0].onchange();
    document.getElementsByName("userPhone")[0].onchange();
    
}
</script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/styles.css">
<meta charset="UTF-8">
<title>Registration</title>
</head>
<body>

<div align="center">
<section id="news"><section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg" style="background-image: url(&quot;img/breadcrumb.jpg&quot;);">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>來揪團</h2>
						
						<div class="breadcrumb__option">
							<span></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	</section>
		




<div>
<div id='resultMsg' style="height: 18px; font-weight: bold;"></div>
	
	<fieldset style='display: inline-block; width: 820px;'> 
	<form action="GroupsInsert" enctype="multipart/form-data" method="post">
	<table style="border: 2px solid #7B7B7B" >
	<tr height='40'><td colspan="3"></tr>
	<tr height='60'>
		<td  width='100' rowspan="13">
		 &nbsp;</td>
		<td width='310'>
			<b>活動標題：</b> <input type="text" name="groupname" id='groupname' size='24'><br>
		</td>
		<td width='100' rowspan="13">
			
		</td>	
	</tr>
	<tr height='60'>		
		
		<td width='310'>
			<b>遊戲人數：</b><input type="text" name="groupCount" id='groupCount' size='24'>
		</td>	
			
	</tr>
	<tr height='60'>		
		
		<td width='310'>
			<b>活動地點：</b><input type="text" name="storeAddress" id='storeAddress' size='24'>
		</td>	
			
	</tr>
		<tr height='60'>		
		
		<td width='310'>
			<b>人數上限：</b><input type="text" name="limit" id='limit' size='24'>
		</td>	
			

		<tr height='60'>		
		
		<td width='310'>
			<b>活動費用：</b><input type="text" name="groupprice" id='groupprice' size='24'>
		</td>	
			
	</tr>
	</tr>
		<tr height='60'>		
		
		<td width='310'>
			<b>舉辦時間：</b><input type="date" name="groupTime" id='groupTime' size='24'>
		</td>	
		
	</tr>
	<tr height='60'>
		
		<td width='310'>
			<b>活動開始時間：</b><input type="date" name="startdate" id='startdate'><br>
		</td>
			
	</tr>
	<tr height='60'>		
		
		<td width='310'>
			<b>活動結束時間：</b><input type="date" name="enddate" id='enddate' size='24'>
		</td>	
	
	</tr>
		<tr height='60'>		
		
		<td width='310'>
			<b>報名期限：</b><input type="date" name="deadline" id='deadline' size='24'>
		</td>	
		
	</tr>
	<tr height='60'>
		
		<td width='310'>
			<b>遊戲類型：</b><select class="select" name="gametypeId" id="gametypeId">
		<option value="5001">PartyGames</option>
		<option value="5002">StrategyGames</option>
		<option value="5003">ThemeticGames</option>
		<option value="5004">WarGames</option>
		<option value="5005">AbstractGames</option>
		<option value="5006">CustomizableGames</option>
		<option value="5007">ChildrenGames </option>
		<option value="5008">FamilyGames</option>
	</select><br>
		</td>
			
	</tr>
			<tr height='60'>		
		
		<td width='310'>
			<b>活動介紹：</b><br/><textarea type="text" name="groupdescription" id='groupdescription'   cols='40' rows='6'></textarea>
		</td>	
		
	</tr>
	<tr height='60'>	
	
	<td width='200'>
		<b>圖片上傳：</b>
		<input type="file" id="imageFile" name="imageFile" accept="image/gif, image/jpeg, image/png"	 />
</td>	
</tr>
<tr height='100'>
	<td  width='310'>
                        <img id="preview_progressbarTW_img"  src="img/logo.png" />
                        </td>
</tr>
	<tr height='50'>		
		<td colspan='3' align='center'><button id='sendData'>送出</button></td>
	</tr>		
	  
			</table>
			</form>
			<input type="button" value="測試用按鈕" onClick="inputData()" />
		</fieldset>
	<hr>	
	<p>	
	<a href="<c:url value='/groups.jsp'  />">回活動列表</a>
<hr>









</div>
</div>
<footer class="footer spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="footer__about">
						<div class="footer__about__logo">
							<a href="./index.html"><img src="img/logo.png" alt=""></a>
						</div>
						<ul>
							<li>地址: 台北市中正區中正路103號1樓</li>
							<li>電話: 02-28825252</li>
							<li>信箱: JoYo@gmail.com</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
					<div class="footer__widget">
						<h6>相關連結</h6>
						<ul>
							<li><a href="#">About Us</a></li>
							<li><a href="#">About Our Shop</a></li>
							<li><a href="#">Secure Shopping</a></li>
							<li><a href="#">Delivery infomation</a></li>
							<li><a href="#">Privacy Policy</a></li>
							<li><a href="#">Our Sitemap</a></li>
						</ul>
						<ul>
							<li><a href="#">Who We Are</a></li>
							<li><a href="#">Our Services</a></li>
							<li><a href="#">Projects</a></li>
							<li><a href="#">Contact</a></li>
							<li><a href="#">Innovation</a></li>
							<li><a href="#">Testimonials</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-12">
					<div class="footer__widget">
						<h6>Contact Us</h6>
						<p>若有商品問題可聯絡本公司客服信箱，本公司將盡速回復您。</p>
						<form action="#">
							<input type="text" placeholder="Enter your mail">
							<button type="submit" class="site-btn">送出</button>
						</form>
						<div class="footer__widget__social">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-instagram"></i></a> <a href="#"><i class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-pinterest"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="footer__copyright"></div>
				</div>
			</div>
		</div>
	</footer>
	<script>

$("#imageFile").change(function(){

  readURL(this);

});

 

function readURL(input){

  if(input.files && input.files[0]){

    var reader = new FileReader();

    reader.onload = function (e) {

       $("#preview_progressbarTW_img").attr('src', e.target.result);

    }

    reader.readAsDataURL(input.files[0]);

  }

}

</script>
<head>
		<tr height='60'>		
		
		<td width='310'>
			<b>店家編號：</b><input type="text" name="storeId" id='storeId' size='24'>
		</td>	
			
	</tr>
	</head>
</body>
</html>
