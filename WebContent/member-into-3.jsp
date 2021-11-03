<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
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
		function checkConsistency(){
			if(document.getElementsByName("verified")[0].value=="${VerifiedCode}"){
				document.getElementById("checkMailCode").innerHTML="驗證碼正確";
				document.getElementById("btn_submit").style.background="blue";
			}
		}
    </script>
</head>

<body>
    <jsp:include page="header.jsp" />


                    <!-- member-into End-->
                    <div class="FOR_MAIN">
                        <div class="SB_MemberContent_login">
                            <span>Member Sign Up</span>&nbsp; 會員註冊
                        </div><!-- -->
                        <div class="SB_MemberContent">
                            <!-- 步驟 -->
                            <div class="all_scart_top clearfix">
                                <div class="cart_step_bg1 center_step">
                                    <ul class="cart_step clearfix">
                                        <li class="font_color_01">會員條款</li>
                                        <!---->
                                        <li class="font_color_01">填寫資料</li>
                                        <!---->
                                        <li class="font_color_01">帳號開通</li>
                                        <!---->
                                        <li class="font_color_02">註冊完成</li>
                                        <!---->
                                    </ul>
                                </div>
                            </div>
                            <div class="SB_MemberData">
                                <div class="SB_MemberOpening">
                                    <div class="SB_MemberOpening_in  SB_tablemarginB30">
                                        <span id="StringOfNickName"></span> 您好，恭喜您成為會員！
                                        <!--您好，恭喜您成為會員！-->
                                        <br>
                                        我們已寄發一封『會員認證信』，至您註冊填寫的
                                        <!--我們已寄發一封『會員認證信』，至您註冊填寫的--> <span id="StringOfMail"></span> 信箱內！
                                        <!--信箱內！-->
                                        <br>
                                        請您於7日內開啟信件，點選連結，完成『會員認證作業』，
                                        <!--請您於7日內開啟信件，點選連結，完成『會員認證作業』，--><br>
                                        以確保重大通知皆可正確送達，以維護您的權益！
                                        <!--以確保重大通知皆可正確送達，以維護您的權益！-->
                                    </div>
                                    <div><input type="text" value="" placeholder="四位數字驗證碼" name="verified" onChange="checkConsistency()"/><span id="checkMailCode"></span></div>

                                    <div class="SB_MemberClause_btn jooshop_btn_color">
                <a href="member-into-4.jsp"><input name="btn_submit" id="btn_submit" value="完成註冊" type="submit"></a><!---->
            </div>
                                </div>
			
                            </div>
                        </div>
                    </div>
                    <!---->
                    <!---->

    <!-- Hero Section End -->


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


    <script>
    	document.getElementById("btn_submit").style.background="grey";
    	
        <% 
       
        response.setContentType("text/html;charset=UTF-8");
        
        request.setCharacterEncoding("UTF-8");
        String userMailStr=(String) session.getAttribute("memberMail");
        String userNickNameStr=(String) session.getAttribute("memberNickName");


        %>
        var userMail="<%=userMailStr%>";
        var userNickName="<%=userNickNameStr%>";



        document.getElementById("StringOfNickName").innerHTML=userNickName;
        document.getElementById("StringOfMail").innerHTML=userMail;
    </script>

</body>

</html>