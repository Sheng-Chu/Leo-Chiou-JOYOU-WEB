<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page import="java.util.*"%>
<%@ page import="java.lang.Math.*"%>

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


            function EditProfile() {
                // document.getElementById("btnEdit").setAttribute("display", "none");
                // document.getElementById("btnUndo").removeAttribute("display");
                // document.getElementById("submit").removeAttribute("display");
                document.getElementById("btnEdit").style.display = "none";
                document.getElementById("btnUndo").style.display = "";
                document.getElementById("submit").style.display = "";

                document.getElementsByName("userNickName")[0].removeAttribute("disabled");
                document.getElementsByName("userTrueName")[0].removeAttribute("disabled");
                document.getElementsByName("userPhone")[0].removeAttribute("disabled");
                document.getElementsByName("userGender")[0].removeAttribute("disabled");
                document.getElementsByName("userGender")[1].removeAttribute("disabled");
                document.getElementsByName("userPreferGameType")[0].removeAttribute("disabled");
                document.getElementsByName("userPicture")[0].removeAttribute("disabled");
            }

            function UndoProfile() {
                document.getElementById("btnEdit").style.display = "";
                document.getElementById("btnUndo").style.display = "none";
                document.getElementById("submit").style.display = "none";

                document.getElementsByName("userNickName")[0].value= userNickName;
                document.getElementsByName("userTrueName")[0].value= userTrueName;
                document.getElementsByName("userPhone")[0].value= userPhone;
                if(userGender=="F"){
                    document.getElementsByName("userGender")[1].removeAttribute("checked");
                    document.getElementsByName("userGender")[0].setAttribute("checked","");
                }else if(userGender=="M"){
                    document.getElementsByName("userGender")[0].removeAttribute("checked");
                    document.getElementsByName("userGender")[1].setAttribute("checked","");
                }
                document.getElementsByName("userPreferGameType")[0].value= userPreferGameType;
                document.getElementsByName("userPicture")[0].value="";
                document.getElementById("previewPicture").src="up_NoUsed/${memberImageFileName}";

                document.getElementsByName("userNickName")[0].setAttribute("disabled", "");
                document.getElementsByName("userTrueName")[0].setAttribute("disabled", "");
                document.getElementsByName("userPhone")[0].setAttribute("disabled", "");
                document.getElementsByName("userGender")[0].setAttribute("disabled", "");
                document.getElementsByName("userGender")[1].setAttribute("disabled", "");
                document.getElementsByName("userPreferGameType")[0].setAttribute("disabled","disabled");
                document.getElementsByName("userPicture")[0].setAttribute("disabled","disabled");


            }

            function readURL(input){
          		if(input.files && input.files[0]){
          	    	var imageTagID = input.getAttribute("targetID");
          	    	var reader = new FileReader();
          	    	reader.onload = function (e) {
	          			var img = document.getElementById(imageTagID);
	          	    	img.setAttribute("src", e.target.result);
	          	    }
          	    	reader.readAsDataURL(input.files[0]);
          	  	}
          	}
    </script>
</head>

<body>
   <jsp:include page="header.jsp" />


<!-- member-into End--> 
        <div class="FOR_MAIN">   
         <div class="SB_MemberContent_login">
              <span>Member Profile</span>&nbsp; 會員資料
            </div><!-- -->            
<div class="SB_MemberContent">
    <!-- 步驟 -->
   
    <form action="<c:url value='/up_MemberEditProfileServlet'/>" method="POST"  enctype="multipart/form-data">
        <div class="SB_MemberData">
            <div class="SB_MemberClause_btn jooshop_btn_color">
                <input name="btn_submit" id="btnEdit" value="修改會員資料" type="button" onclick="EditProfile()"><!---->
                <input name="btn_submit" id="btnUndo" value="取消修改" type="button" onclick="UndoProfile()" style="display: none">
            </div>

            <table width="660" border="0" cellpadding="0" cellspacing="0" class="SB_MemberData_write SB_tablemarginB30">

                <!---->
                <tbody>
            
                <tr id="block_mem_email" style="">
                    <td align="right">
                        <label for="mem_email"><span class="SB_tableWstyle03" id="mem_email_necessary_abbr">*</span>會員 E-mail</label><!---->
                    </td>
                    <td class="SB_tableW220 SB_tablepaddingL10">
                        <input name="userMail" id="mem_email" type="text" class="SB_tableInput01" value="" style="background-color: darkgray" readonly required >
                    </td>
                    <td class="SB_tableWstyle05" >
                    </td>
                </tr>
                <!---->

                <!---->
                <tr>
                    <td align="right">
                        <label for="meow"><span class="SB_tableWstyle03">*</span>帳號</label><!---->
                    </td>
                    <td class="SB_tableW220 SB_tablepaddingL10">
                        <input name="userAccount" id="meow" type="text" class="SB_tableInput01" value="" style="background-color: darkgray" readonly  required>
                    </td>
                    <td class="SB_tableWstyle05" id="checkAccount">
                        &nbsp; &nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <label for="mem_password"><span class="SB_tableWstyle03">*</span>密碼</label><!---->
                    </td>
                    <td class="SB_tableW220 SB_tablepaddingL10">
                        <a href="member-edit-password.jsp">
                            <input type="button" id="btnEditPwd" value="修改密碼" >
                        </a>
                    </td>
                    <td >
                        
                    </td>
                </tr>
                <!---->

                <!---->

                <tr>
                    <td align="right">
                        <label for="mem_name"><span class="SB_tableWstyle03">*</span>中文全名</label><!---->
                    </td>
                    <td class="SB_tableW220 SB_tablepaddingL10">
                        <input class="SB_tableInput01" name="userTrueName" id="mem_name" type="text" value="" onChange="" >
                    </td>
                    <td>
                        <label><input name="userGender" type="radio" value="F" checked="">小姐</label><!---->
                        <label><input name="userGender" type="radio" value="M">先生</label><!---->
                        <span id="checkTrueName"></span>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <label for="meow2"><span class="SB_tableWstyle03">*</span>暱稱</label><!---->
                    </td>
                    <td class="SB_tableW220 SB_tablepaddingL10">
                        <input name="userNickName" id="meow2" type="text" class="SB_tableInput01" value="" onChange="" required>
                    </td>
                    <td class="SB_tableWstyle05" id="checkNickName">
                        
                    </td>
                </tr>

                <tr>
                    <td align="right">
                        <label for="meow3"><span class="SB_tableWstyle03">*</span>手機</label><!---->
                    </td>
                    <td class="SB_tableW220 SB_tablepaddingL10">
                        <input name="userPhone" id="meow3" type="text" class="SB_tableInput01" value="" onChange="" required>
                    </td>
                    <td class="SB_tableWstyle05" id="checkPhone">
                        
                    </td>
                </tr>
                
                <tr>
                    <td align="right">
                        <label for="meow5"><span class="SB_tableWstyle03">*</span>偏好</label><!---->
                    </td>
                    <td  class="SB_tableW220 SB_tablepaddingL10"> 
                    <!--   --> 
                   
                        <select  name="userPreferGameType" >
                            <option value="5001">PartyGames</option>
                            <option value="5002">StrategyGames</option>
                            <option value="5003">ThemeticGames</option>
                            <option value="5004">WarGames</option>
                            <option value="5005">AbstractGames</option>
                            <option value="5006">CustomizableGames</option>
                            <option value="5007">ChildrenGames</option>
                            <option value="5008">FamilyGames</option>
                        </select>
                    </td>
                    <td class="SB_tableWstyle05">
                        
                    </td>
                </tr>
                
                 <tr>
                    <td align="right">
                        <label for="imgInp"><span class="SB_tableWstyle03">*</span>頭像</label><!---->
                    </td>
                    <td class="SB_tableW220 SB_tablepaddingL10">
                    	<input name="userPicture" id="imgInp" src="" type="file" class="SB_tableInput01" value="" onchange="readURL(this)" targetID="preview_progressbarTW_img" accept="image/gif, image/jpeg, image/png" >
                    </td>
                    <td class="SB_tableWstyle05" id="previewPicture">
                    
                        <img id="preview_progressbarTW_img" height="100px" src="" />
                         
                     <!-- <img id="preview_progressbarTW_img" height="100px" src="up_NoUsed/eeit117.jpg" /> -->
                    </td>
                </tr>
                
                <!---->

                <!---->

                <!---->

                <!---->
       
                <!---->

            </tbody></table>
           
                
            
           
            <div class="SB_MemberClause_btn jooshop_btn_color">
                <input name="btn_submit" id="submit" value="確定修改" type="submit" style="display: none"><!---->
            </div>
        </div>
    </form>
</div>      
</div>
<!---->
<!---->

    <!-- Hero Section End -->


    <!-- Footer Section Begin -->
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

		var rand= Math.random() ;

		
        var userAccount="${memberAccount}";
        var userMail="${memberMail}";
        var userNickName="${memberNickName}";
        var userTrueName="${memberTrueName}";
        var userPhone="${memberPhone}";
        var userGender="${memberGender}";
        var userPreferGameType=${memberPreferGameType};
        var userImageFileName="${memberImageFileName}";


        document.getElementsByName("userAccount")[0].value= userAccount ;
        document.getElementsByName("userMail")[0].value= userMail ;
        document.getElementsByName("userNickName")[0].value= userNickName ;
        document.getElementsByName("userTrueName")[0].value= userTrueName ;
        document.getElementsByName("userPhone")[0].value= userPhone ;
        if(userGender=="F"){
            document.getElementsByName("userGender")[1].removeAttribute("checked");
            document.getElementsByName("userGender")[0].setAttribute("checked","");
        }else if(userGender=="M"){
            document.getElementsByName("userGender")[0].removeAttribute("checked");
            document.getElementsByName("userGender")[1].setAttribute("checked","");
        }
        document.getElementsByName("userPreferGameType")[0].value= userPreferGameType;
     
        document.getElementsByName("userNickName")[0].setAttribute("disabled", "");
        document.getElementsByName("userTrueName")[0].setAttribute("disabled", "");
        document.getElementsByName("userPhone")[0].setAttribute("disabled", "");
        document.getElementsByName("userGender")[0].setAttribute("disabled", "");
        document.getElementsByName("userGender")[1].setAttribute("disabled", "");
        document.getElementsByName("userPreferGameType")[0].setAttribute("disabled", "");
        document.getElementsByName("userPicture")[0].setAttribute("disabled", "");

        document.getElementById("preview_progressbarTW_img").setAttribute("src","up_NoUsed/${memberImageFileName}");
        
    </script>

</body>

</html>