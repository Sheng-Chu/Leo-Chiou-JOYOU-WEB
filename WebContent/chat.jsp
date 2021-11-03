<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zh-tw">
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
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/slideshowedit.css" type="text/css">
<link rel="stylesheet" href="css/searchbar.css" type="text/css">
<link rel="stylesheet" href="chat/css/chat.css" type="text/css">
</head>
<style type="text/css">
.msg_board {
	width: 600px;
	height: 550px;
	border: 4px #171E5D solid;
	padding: 5px;
	overflow-y: scroll;
	文字長度大於div寬度時換行顯示 word-break: break-all;
}
/*set srcoll start*/
::-webkit-scrollbar {
	width: 10px;
	height: 10px;
	background-color: #D6F2FD;
}

::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
	/*border-radius: 5px;*/
	background-color: #D6F2FD;
}

::-webkit-scrollbar-thumb {
	height: 20px;
	/*border-radius: 10px;*/
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, .3);
	background-color: #89D7F7;
}

#chat {
	color: white;
	border: 4px #171E5D solid;
	width: 60px;
	background-color: #171E5D
}
/*set srcoll end*/
</style>
<body>
	<jsp:include page="header.jsp" />
	<section class="breadcrumb-section set-bg"
		data-setbg="img/breadcrumb.jpg"
		style="background-image: url(&quot;img/breadcrumb.jpg&quot;);">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>揪遊聊天室</h2>

						<div class="breadcrumb__option">
							<span></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div style="margin-top: 50px; margin-bottom: 50px; text-align: center;">
		<label>揪團房間號碼</label> <input id="input_roomName" size="10"
			maxlength="10" readonly="readonly"> <input type="button"
			value="進入聊天室" onclick="initWebSocket()"
			style="border: 4px #ffD335 solid; width: 110px; background-color: #ffD335;">
		<input type="button" value="退出聊天室" onclick="closeWs()"
			style="border: 4px #ffD335 solid; width: 110px; background-color: #ffD335;">
		<table style="transform: translateX(+55%);">
			<tr>
				<td colspan="2">
					<div class="msg_board" style="margin-left:90px">
						<div class="messages messages--received"></div>
					</div>
				<td>
			</tr>
			<tr>
				<td><input style="margin-left:90px;border: 4px #171E5D solid; width: 540px"
					id="input_msg" maxlength="40"></td>
				<td><input id="chat" type="button" value="送出"
					onclick="send_msg()"></td>
			</tr>
		</table>


	</div>


	<jsp:include page="footer.jsp" />
</body>

<script type="text/javascript">
    var webSocket;

    window.onload = function() {
    	 var myName = '<%=session.getAttribute("groupid")%>';
    	 document.getElementById("input_roomName").value = myName;
    	};
    function send_msg() {
        if (webSocket != null) {
            var input_msg = document.getElementById("input_msg").value.trim();
            if (input_msg == "") {
                return;
            }
            webSocket.send(input_msg);
            // 清除input框裡的資訊
            document.getElementById("input_msg").value = "";
        } else {
            alert("您未成功連線至聊天室...");
        }
    };

    function closeWs() {
        webSocket.close();
    };

    function initWebSocket() {
        var roomName = document.getElementById("input_roomName").value;
        // 房間名不能為空
        if (roomName == null || roomName == "") {
            alert("請輸入房間名");
            return;
        }
        if ("WebSocket" in window) {
//            alert("您的瀏覽器支援 WebSocket!");
            if (webSocket == null) {
                var url = "ws://localhost:8080/JoYouProject/webSocket/chat/" + roomName;
                // 開啟一個 web socket
                webSocket = new WebSocket(url);
            } else {
        
            }

            webSocket.onopen = function () { 
            };

            webSocket.onmessage = function (evt) {
                var msg_board = document.getElementsByClassName("messages--received")[0];
                var received_msg = evt.data;
                var old_msg = msg_board.innerHTML;
                msg_board.innerHTML +='<div class="message">'+ received_msg + '<br></div>';
                // 讓滾動塊往下移動
                msg_board.scrollTop = msg_board.scrollTop + 40;
            };

            webSocket.onclose = function () {
                // 關閉 websocket，清空資訊板
                alert("連線已關閉...");
                webSocket = null;
                document.getElementsByClassName("messages--received")[0].innerHTML = "";
            };
        }
        else {
            // 瀏覽器不支援 WebSocket
            alert("您的瀏覽器不支援 WebSocket!");
        }
    }
</script>
</html>