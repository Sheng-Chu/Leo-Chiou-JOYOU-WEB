<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html>
<head>
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
var groupid = GET['groupId'];
var hasError = false;

window.onload = function() {
	var divResult = document.getElementById('resultMsg');
	var xhr = new XMLHttpRequest();

	xhr.open("GET", "<c:url value='/GroupsSingle?groupId= "+ groupid + "' />", true);
	xhr.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
	xhr.send();	
	var message = "";
	xhr.onreadystatechange = function() {
	 // 伺服器請求完成
	    if (xhr.readyState == 4 && xhr.status == 200) {
		   var groupBean = JSON.parse(xhr.responseText);
		   console.log(JSON.parse(xhr.responseText));
		   id0.innerHTML = groupBean.groupId;
		   id1.innerHTML = groupBean.groupname;
		   id2.innerHTML = groupBean.gametypeId
		   id3.innerHTML = groupBean.groupCount
		   id4.innerHTML = groupBean.groupTime
		   id5.innerHTML = groupBean.storeId
		   id6.innerHTML = groupBean.groupprice
		   id7.innerHTML = groupBean.memberID
		   id8.innerHTML = groupBean.groupmember 	
		   id9.innerHTML = groupBean.startdate
		   id10.innerHTML = groupBean.enddate
		   id11.innerHTML = groupBean.deadline
		   id12.innerHTML = groupBean.storeAddress 	
		   id13.innerHTML = groupBean.limit
		   id14.innerHTML = groupBean.groupnumber
		   id15.innerHTML = groupBean.groupdescription
		   id16.innerHTML = '<img src="/img/groups/'+groupBean.gphotoName+'">'
	    }
     }
	var divs = document.getElementById("wrapper");
	divs.innerHTML = content;
	content += 	'<a href="showgroups.jsp?groupId='+groups[i].groupId+'" class="">'

   }


</script>
<meta charset="UTF-8">
<title>Registration</title>
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
</head>
<body>
<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Humberger Begin -->
	<div class="humberger__menu__overlay"></div>
	<div class="humberger__menu__wrapper">
		<div class="humberger__menu__logo">
			<a href="#"><img src="img/logo.png" alt=""></a>
		</div>
		<div class="humberger__menu__widget">

			<div class="header__top__right__auth">
				<a href="#"><i class="fa fa-user"></i> Login</a>
			</div>
		</div>
		<nav class="humberger__menu__nav mobile-menu">
			<ul>
				<li><a href="./shop-grid.html">Shop</a></li>
				<li><a href="#">Pages</a>
					<ul class="header__menu__dropdown">
						<li><a href="./shop-details.html">Shop Details</a></li>
						<li><a href="./shoping-cart.html">Shoping Cart</a></li>
						<li><a href="./checkout.html">Check Out</a></li>
						<li><a href="./blog-details.html">Blog Details</a></li>
					</ul></li>
				<li><a href="./blog.html">Blog</a></li>
				<li><a href="./contact.html">Contact</a></li>
			</ul>
		</nav>
		<div id="mobile-menu-wrap"></div>
		<div class="header__top__right__social">
			<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
				class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-linkedin"></i></a>
			<a href="#"><i class="fa fa-pinterest-p"></i></a>
		</div>
		<div class="humberger__menu__contact">
			<ul>
				<li><i class="fa fa-envelope"></i> JoYo@gmail.com</li>
				<li>買千送百活動開跑中</li>
			</ul>
		</div>
	</div>
	<!-- Humberger End -->

	<!-- Header Section Begin -->
	<header class="header">
		<div class="header__top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<div class="header__top__left">
							<ul>
								<li><i class="fa fa-envelope"></i> JoYo@gmail.com</li>
								<li>買千送百活動開跑中</li>
							</ul>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="header__top__right">
							<div class="header__top__right__social">
								<a href="login.jsp"><i class="fa fa-facebook"></i></a> <a
									href="#"><i class="fa fa-twitter"></i></a> <a href="login.jsp"><i
									class="fa fa-linkedin"></i></a> <a href="login.jsp"><i
									class="fa fa-pinterest-p"></i></a>
							</div>

							<div class="header__top__right__auth">
								<a id="topRightLogin" href="login.jsp"><i class="fa fa-user"></i>
									Login</a> <a id="topRightMember"
									href="<c:url value='/up_MemberLogoutServlet'/>"><i
									class="fa fa-user"></i> ${memberNickName} </a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="header__logo">
						<a href="./index.jsp"><img src="img/logo.png" alt=""></a>
					</div>
				</div>
				<div class="col-lg-7">
					<nav class="header__menu">
                        <ul>
                             <li id="memberManage"></li>						
                             <li><a href="SaleProductsGetServlet.do">揪遊商城</a>
                            </li>
                            <!--  <li><a href="ProductsGetServlet.do">揪遊商城</a> -->
                            <li><a href="ProductsGetServlet.do">討論區</a>
                            </li>
                            <li><a href="./groups.jsp">揪遊團</a></li>
                            <li><a href="./contact.html">聯繫我們</a></li>
                        </ul>
                    </nav>
				</div>
				<div class="col-lg-2">
					<div class="header__cart">
						<ul>
							<li><a
								href="http://localhost:8080/JoYouProject/ShopingCartPage.jsp"><i
									class="fa fa-shopping-bag"></i><span id="bagcounts">${ShoppingCart.itemNumber}</span></a></li>
						</ul>
						<div class="header__cart__price">

							<span id="carttotal">購物金額 $<c:out value="${ShoppingCart.subtotal}"
									default="0" /></span>
						</div>
					</div>
				</div>
			</div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header Section End -->

	<!-- Hero Section Begin -->
	<section class="hero hero-normal">
		<div class="container">
			<div class="col-lg-9">
				<div class="row">
					<nav id="nav-wrap">
						<ul>
							<li>
								<div class="menu-icon-btn">
									找什麼 <i class="fa fa-angle-down" aria-hidden="true"></i>
								</div>
								<ul class="main-menu-container">
									<li><a href="#">找文章</a></li>
									<li><a href="#">找桌遊</a></li>
								</ul>
							</li>
						</ul>
						<div class="search-container">
							<div class="search-input">
								<input type="search" class="search-bar" id="SearchInputTxt"
									name="SearchInputTxt"
									placeholder="                   請輸入搜尋字串....">
							</div>
							<div class="search-icon-btn">
								<i class="fa fa-search"></i>
							</div>
						</div>

					</nav>

					<div class="hero__search__phone">
						<div class="hero__search__phone__icon">
							<i class="fa fa-phone"></i>
						</div>
						<div class="hero__search__phone__text">
							<h5>02-28825252</h5>
							<span>24Hr客服專線</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->
	
<div align='center'>



<font face="fantasy"  color="#FFEEDD" style="font-weight:bold;" >

<div align='center' style="background-image:url(img/bg1.jpg); width: 100%;
  height: 150%;background-size: cover;" >
  
  
	<section id="news"><section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg" style="background-image: url(&quot;img/breadcrumb.jpg&quot;);">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>揪團資料</h2>
						
						<div class="breadcrumb__option">
							<span></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
<div id='resultMsg' style="height: 18px; font-weight: bold;"></div>
<hr>
	<fieldset style='display: inline-block; width: 820px;'> 
	<input type="hidden" name="id" id='id'><br>
	<table border='1'>
	<tr height='60'>
		
		<td width='400'>
			&nbsp;活動編號: <label id='id0'></label><br>
		</td>
	</tr>
	<tr height='60'>
		
		<td width='400'>
			&nbsp;活動名稱: <label id='id1'></label><br>
		</td>
		
	</tr>
	<tr height='60'>
	
		<td width='400'>
			&nbsp;遊戲類型編號: <label id='id2'></label><br>
		</td>
		
	</tr>
	<tr height='60'>		
		
		<td width='400'>
			&nbsp;遊戲人數: <label id='id3'></label>
		</td>	
			
	</tr>
	<tr height='60'>		
		
		<td width='400'>
			&nbsp;舉辦時間: <label id='id4'></label>
		</td>	
			
	</tr>
	<tr height='60'>		
	
		<td width='400'>
			&nbsp;店家編號: <label id='id5'></label>
		</td>	
		
	</tr>
	<tr height='60'>		
		
		<td width='400'>
			&nbsp;活動費用: <label id='id6'></label>
		</td>	
		
	</tr>
	<tr height='60'>		
		
		<td width='400'>
			&nbsp;活動團長: <label id='id7'></label>
		</td>	
		
	</tr>
	<tr height='60'>		
		
		<td width='400'>
			&nbsp;參加團員: <label id='id8'></label>
		</td>	
			
	</tr>
	<tr height='60'>		
	
		<td width='400'>
			&nbsp;活動開始日期: <label id='id9'></label>
		</td>	
			
	</tr>
	<tr height='60'>		
	
		<td width='400'>
			&nbsp;活動結束日期: <label id='id10'></label>
		</td>	
			
	</tr>
	<tr height='60'>		
		
		<td width='400'>
			&nbsp;報名期限: <label id='id11'></label>
		</td>	
		
	</tr>
	<tr height='60'>		
		
		<td width='400'>
			&nbsp;活動地點: <label id='id12'></label>
		</td>	
		
	</tr>
	<tr height='60'>		
	
		<td width='400'>
			&nbsp;人數上限: <label id='id13'></label>
		</td>	
		
	</tr>
	<tr height='60'>		
		
		<td width='400'>
			&nbsp;目前人數: <label id='id14'></label>
		</td>	
		
	</tr>
		
	
		<td width='400'>
			&nbsp;活動描述: <label id='id15'></label>
		</td>	
			
	</tr>
		<tr height='200'>
		<td width='400'>
			&nbsp;活動圖片: <label id='id16'></label><br>
		</td>
			</tr>
			</table>
		</fieldset>
	<hr>	
	<p>	
	<form name="loginForm" method="post" action="GroupAdd">
	<input type="submit" value="加入">
</form>

	<a href="<c:url value='/groups.jsp'  />">回活動列表</a>
	
<hr>

</div>
</font>
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
							<li>Address: 60-49 Road 11378 New York</li>
							<li>Phone: 02-28825252</li>
							<li>Email: hello@colorlib.com</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
					<div class="footer__widget">
						<h6>Useful Links</h6>
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
						<h6>Join Our Newsletter Now</h6>
						<p>Get E-mail updates about our latest shop and special
							offers.</p>
						<form action="#">
							<input type="text" placeholder="Enter your mail">
							<button type="submit" class="site-btn">Subscribe</button>
						</form>
						<div class="footer__widget__social">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
								class="fa fa-instagram"></i></a> <a href="#"><i
								class="fa fa-twitter"></i></a> <a href="#"><i
								class="fa fa-pinterest"></i></a>
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
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>
			<script>
		<%
			String userNickNameStr =(String) session.getAttribute("memberNickName");
		%>

		var userNickName="<%=userNickNameStr%>";
		
		console.log("userNickName=");
		console.log(userNickName);

		if(userNickName=="null"){
			console.log("244 is null");
			document.getElementById("topRightLogin").style.display="";
			document.getElementById("topRightMember").style.display="none";	
			document.getElementById("memberManage").innerHTML="<a id='memberLogin' href='login.jsp'>會員登入</a>";	
			
		}else{
			console.log("248 not null");
			document.getElementById("topRightLogin").style.display="none";
			document.getElementById("topRightMember").style.display="";
			document.getElementById("memberManage").innerHTML="<a href='member-profile.jsp'>會員資料</a>";
			document.getElementById("memberManage").innerHTML+="<ul class='header__menu__dropdown'><li><a href='<c:url value="/up_MemberLogoutServlet"/>'>會員登出</a></li></ul>";			
		}
	</script>
</body>

</html>