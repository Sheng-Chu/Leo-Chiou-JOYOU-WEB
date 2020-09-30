<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page import="java.util.*"%>

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
        var clickCount = 0;
        var verifiedMailAddress = 0;
        var verifiedCode = 0;
        var randInt=Math.floor(Math.random()*9000)+1; 

        function sendMail() {
                console.log("count begin");
                let wait = 60;
                function time(o) {
                    if (wait == 0) {
                        o.removeAttribute("disabled");
                        o.value = "重新發送驗證碼";
                        wait = 60;
                    } else {
                        o.setAttribute("disabled", "");
                        o.value = wait + "秒後可以重新發送";
                        wait--;
                        setTimeout(function () {
                            time(o);
                        }, 1000);
                    }
                }

                time(document.getElementById("btnSendMail"));

                console.log("count end");

                let Obj = document.getElementsByName("userMail")[0];
                let VerifyObj = document.getElementById("checkMail");

               
                let xhr = new XMLHttpRequest();
                xhr.open("POST", "<c:url value='/SendVerifiedMailServlet'/>", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.send("mail=" + Obj.value);
                xhr.onreadystatechange = function () {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        let result = JSON.parse(xhr.responseText);
                        verifiedCode = result.verifiedCode;
                        let message = "驗證信已寄出";
                        VerifyObj.innerHTML = "<font color='red' size='-2'>" + message + "</font>";
                    }
                }
            }

            function checkConsistency() {
                let Obj = document.getElementsByName("verified")[0];
                let VerifyObj = document.getElementById("checkMailCode");
                let message = "";
                if (Obj.value == verifiedCode) {
                    message = "驗證碼正確";
                } else {
                    message = "驗證碼錯誤";
                }
                VerifyObj.innerHTML = message;
            }


        function checkPassword() {
            let Obj = document.getElementsByName("userPassword")[0];
            let ObjVal = Obj.value;
            let ObjValLen = ObjVal.length;
            let VerifyObj = document.getElementById("checkPassword");

            if (ObjVal.search(/\s/g) != -1) {
                VerifyObj.innerHTML = "&nbsp; &nbsp; 不能有空白";
            } else if (ObjValLen < 2 || ObjValLen > 15) {
                VerifyObj.innerHTML = "&nbsp; &nbsp; 限制長度為6-15字";
            } else {
                if (/^[a-zA-z0-9]{2,15}$/.test(ObjVal)) {
                    VerifyObj.innerHTML = "&nbsp; &nbsp; 格式正確";
                } else {
                    VerifyObj.innerHTML = "&nbsp; &nbsp; 必須全為字母數字";
                }
            }
            checkPassword2();
        }

        function checkPassword2() {
            let Obj = document.getElementsByName("userPassword")[0];
            let ObjVal = Obj.value;
            let Obj2 = document.getElementsByName("userPassword2")[0];
            let ObjVal2 = Obj2.value;
            let VerifyObj = document.getElementById("checkPassword");
            let VerifyObj2 = document.getElementById("checkPassword2");
            if (ObjVal2.search(/\s/g) != -1) {
                VerifyObj2.innerHTML = "&nbsp; &nbsp; 不能有空白";
            } else if (VerifyObj.innerHTML == "&nbsp; &nbsp; 格式正確" && ObjVal == ObjVal2) {
                VerifyObj2.innerHTML = "&nbsp; &nbsp; 密碼相符";
            } else {
                VerifyObj2.innerHTML = "&nbsp; &nbsp; 密碼不符";
            }
        }

        


    </script>
</head>

<body>
   <jsp:include page="header.jsp" />


<!-- member-into End--> 
        <div class="FOR_MAIN">   
         <div class="SB_MemberContent_login">
              <span>Edit Password</span>&nbsp; 修改密碼
            </div><!-- -->            
	<div class="SB_MemberContent">
    <!-- 步驟 -->

    <form action="<c:url value='/up_MemberEditPasswordServlet'/>" method="POST">
        <div class="SB_MemberData">
            <table width="660" border="0" cellpadding="0" cellspacing="0" class="SB_MemberData_write SB_tablemarginB30">

                <!---->
                <tbody>
            
                
                <!---->

                <!---->
                <tr>
                    <td align="right">
                        <label for="meow"><span class="SB_tableWstyle03">*</span>帳號</label><!---->
                    </td>
                    <td class="SB_tableW220 SB_tablepaddingL10">
                        <input name="userAccount" id="meow" type="text" class="SB_tableInput01" value="" style="background-color: darkgray" >
                    </td>
                    <td class="SB_tableWstyle05" id="checkAccount">
                        &nbsp; &nbsp;
                    </td>
                </tr>

               
                <tr id="block_mem_email" style="">
                    <td align="right">
                        <label for="mem_email"><span class="SB_tableWstyle03" id="mem_email_necessary_abbr">*</span>會員 E-mail</label><!---->
                    </td>
                    <td class="SB_tableW220 SB_tablepaddingL10">
                        <input name="userMail" id="mem_email" type="text" class="SB_tableInput01" value="" style="background-color: darkgray" >
                    </td>
                    <td class="SB_tableWstyle05" >
                        &nbsp; &nbsp;<!---->
                    </td>
                </tr>
                <tr  style="">
                    <td align="right">
                        <label for=""><span class="SB_tableWstyle03" id="mem_email_necessary_abbr">*</span>驗證碼</label><!---->
                        <input type="button" id="btnSendMail" onclick="sendMail()" value="發送驗證信" >
                    </td>
                    <td class="SB_tableW220 SB_tablepaddingL10">
                        <input name="verified" id="" type="text" class="SB_tableInput01" value="" onChange="checkConsistency()"  >
                    </td>
                    <td class="SB_tableWstyle05" id="checkMailCode">
                        
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <label for="mem_password"><span class="SB_tableWstyle03">*</span>密碼設定</label><!---->
                    </td>
                    <td class="SB_tableW220 SB_tablepaddingL10">
                        <input name="userPassword" id="mem_password" type="password" class="SB_tableInput01" value=""  onChange="checkPassword()" required>
                    </td>
                    <td class="SB_tableWstyle05" id="checkPassword">
                        &nbsp; &nbsp;請輸入 6 碼以上英數字
                    </td>
                </tr>
                
                <!---->

                <!---->
                <tr>
                    <td align="right">
                        <label for="mem_password_check"><span class="SB_tableWstyle03">*</span>密碼確認</label><!---->
                    </td>
                    <td class="SB_tableW220 SB_tablepaddingL10">
                        <input name="userPassword2" id="mem_password_check" type="password" class="SB_tableInput01" value="" onChange="checkPassword2()" required>
                    </td>
                    <td class="SB_tableWstyle05" id="checkPassword2">
                        &nbsp; &nbsp;請再輸入一次您的密碼做確認<!---->
                    </td>
                </tr>

                
                <!---->

                <!---->
       
                <!---->

            </tbody></table>
           
            
            <div class="SB_MemberClause_btn jooshop_btn_color">
                <input name="btn_submit" id="submit" value="確定修改" type="submit"><!---->
            </div>
        </div>
    </form>
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

    <script>

        <%

        String userAccountStr =(String) session.getAttribute("memberAccount");
        String userMailStr =(String) session.getAttribute("memberMail");

        %>
        
        var userAccount="<%=userAccountStr%>";
        var userMail="<%=userMailStr%>";


        document.getElementsByName("userAccount")[0].value= userAccount ;
        document.getElementsByName("userMail")[0].value= userMail ;

        document.getElementsByName("userAccount")[0].setAttribute("readonly","readonly");
        document.getElementsByName("userMail")[0].setAttribute("readonly","readonly");
    </script>

</body>

</html>