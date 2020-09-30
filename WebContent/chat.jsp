<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>	
<!DOCTYPE html><html lang="zh-tw">
<head>
    <meta charset="UTF-8">
    <title>網路聊天室</title>
</head>
<style type="text/css">
    .msg_board {
        width: 822px;
        height: 600px;
        border: solid 1px darkcyan;
        padding: 5px;
        overflow-y: scroll;
        transform:translateX(+30%);
        // 文字長度大於div寬度時換行顯示
        word-break: break-all;
    }
    /*set srcoll start*/
    ::-webkit-scrollbar
    {
        width: 10px;
        height: 10px;
        background-color: #D6F2FD;
    }
    ::-webkit-scrollbar-track
    {
        -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
        /*border-radius: 5px;*/
        background-color: #D6F2FD;
    }
    ::-webkit-scrollbar-thumb
    {
        height: 20px;
        /*border-radius: 10px;*/
        -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
        background-color: #89D7F7;
    }
    /*set srcoll end*/
</style>
<body>
	<jsp:include page="header.jsp" />
		<section id="news"><section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg" style="background-image: url(&quot;img/breadcrumb.jpg&quot;);">
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
<div style="text-align:center;">
<label>房間名</label>
<input id="input_roomName" size="10" maxlength="10">
<input type="button"  value="進入聊天室" onclick="initWebSocket()" />
<input type="button" value="退出聊天室" onclick="closeWs()" /><br>
<div class="msg_board" style="text-align:left;" ></div>
<input id="input_msg" size="43" maxlength="40">
<input type="button" value="傳送" onclick="send_msg()" />
</div>
<jsp:include page="footer.jsp" />
</body>
<script type="text/javascript">
    var webSocket;

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
                var msg_board = document.getElementsByClassName("msg_board")[0];
                var received_msg = evt.data;
                var old_msg = msg_board.innerHTML;
                msg_board.innerHTML = old_msg + received_msg + "<br>";
                // 讓滾動塊往下移動
                msg_board.scrollTop = msg_board.scrollTop + 40;
            };

            webSocket.onclose = function () {
                // 關閉 websocket，清空資訊板
                alert("連線已關閉...");
                webSocket = null;
                document.getElementsByClassName("msg_board")[0].innerHTML = "";
            };
        }
        else {
            // 瀏覽器不支援 WebSocket
            alert("您的瀏覽器不支援 WebSocket!");
        }
    }
</script>
</html>