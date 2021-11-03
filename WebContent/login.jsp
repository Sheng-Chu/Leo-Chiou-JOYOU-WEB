<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
	<meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="61390195047-clqb6r7rj5egfhsm2p6c4vocmpo03fne.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
   
	    
    <meta name="description" content="JOYOU BOARD GAMES">
    <meta name="keywords" content="JOYOU, BOARD GAMES, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>揪遊 JOYOU | BOARD GAMES</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

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
      function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());
        console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());

        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);

        let xhr = new XMLHttpRequest();
        xhr.open("POST", "<c:url value='/MemberGoogleLoginServlet'/>", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.send("mail="+profile.getEmail());

        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                let result = JSON.parse(xhr.responseText);
                if (result.loginSuccess == "success") {
					console.log(36);
					setTimeout("javascript:location.href='member-profile.jsp'", 1000);
                }

            }
        };
      }
    </script>
</head>

<body>
   <jsp:include page="header.jsp" />


                       <!-- login Begin--> 
        <div class="FOR_MAIN">               
        <div class="clearfix Member_LoginPage newmember_box">
          <!-- 官網－會員登入(一般) -->
          <div class="AF_Member_LoginPage_left newmember_lbox">
            <div class="AF_Member_LoginTitle_left jooshop_step_color doras_none">
              <span>Member Login</span>&nbsp; 會員登入
            </div><!-- -->
            <div class="AF_Member_LoginTitle_left jooshop_step_color doras_style" style="display: none;">
              購物會員登入
            </div><!-- -->
            <div class="AF_Member_LoginContent_left">
              <form action="<c:url value='/up_MemberLoginServlet' />" id="it20_formA" method="post" name="it20_formA">

                <!-- 上區塊 -->
                <ul class="AF_Member_LoginBox_left AF_Member_LoginlBox clearfix">

                  <li><input accesskey="F" class="AF_Member_Input100" id="login_account" name="userAccount" onblur="SaveAcc();" placeholder=" &nbsp; 會員帳號" tabindex="1" type="text">
                  </li>

                  <li><input autocomplete="off" class="AF_Member_Input100" id="login_password" name="userPassword" placeholder=" &nbsp; 會員密碼" tabindex="2" type="password">
                  </li>

                </ul>

                <div class="AF_Member_Login_R_left jooshop_btn_login jooshop_btn_color">
                  <input id="btn_login" name="btn_login" type="submit" value="登 入">
                  <div style="margin-left:110px;margin-top:10px" class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
    
                </div>
                <!-- -->

                <div class="AF_Member_Login_bt">
                  <ul>
                    <li>
                      <a href="member-into-1.jsp">我要註冊</a>
                    </li>
                  </ul>
                </div>
                <div class="it17_phone" id="sub_type_telcellphone" style="display: none;">
                  <div class="it17_phone_in">
                    <h5>簡訊驗證</h5>
                    <ul class="clearfix">
                      <li id="send_phone_code_inform"></li>
                      <li>請輸入正確的驗證碼 <input id="mem_login_2step_code" name="mem_login_2step_code" type="text" value=""><input id="btn_submit_check_code" name="btn_submit_check_code" type="button" value="確認"><!---->
                       <!-- <a href="javascript:void(0)">重新取得驗證碼</a> --></li>
                    </ul>
                  </div>
                </div><!-- light box end-->
                <!-- light box end-->
                <input name="nti_JUE5JUFBJTdGJUI2JTdGJUI1eSVCOSVCMiVCOHolQjklQkR5JTgwJUFDJUJCJTgxJTdEJUFEJUJCJTgxJUI3JTdGJTdCJTdC" type="hidden" value="MTU5OTc1NDk1MEpoZjk3VGlLaExaaWFDWDVaSDJLaTljT2M1OFZWQmVi"><input name="nti_JUE5JUFBJTdGJUI2JTdGJUI1eSVCOSVCMiVCOHolQjklQkR5JTgwJUFDJUJCJTgxJTdEJUFEJUJCJTgxJUI3JTdGJTdCJTdC" type="hidden" value="MTU5OTc1NDk1MEpoZjk3VGlLaExaaWFDWDVaSDJLaTljT2M1OFZWQmVi">
              </form>
            </div>
          </div><!-- 官網－會員登入(一般)播end -->
        </div>
        </div>
            <!-- login end--> 
    <!-- Hero Section End -->


    <!-- Footer Section Begin -->
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