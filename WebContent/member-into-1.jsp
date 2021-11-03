<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
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
<script type="text/javascript">
	
	let number = "2";//數字依照自己頁面調整
	let x = localStorage.getItem('foot');
	x=x+number;
	localStorage.setItem('foot',x);
	
	
	console.log(localStorage.getItem('foot'));

	
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
                <li class="font_color_01">會員條款</li><!---->
                <li class="font_color_02">填寫資料</li><!---->
                <li class="font_color_02">帳號開通</li><!---->
                <li class="font_color_02">註冊完成</li><!---->
            </ul>
        </div>
    </div>
    <!-- 會員條款 -->
    <div class="SB_MemberClause" style="overflow:auto;">
        <div>
            <h2 class="h2_style" >線上購物約定條款</h2>
基於服務消費者之精神，本公司茲就本網站購物網站會員資料保護及交易相關事宜，訂定會員條款（以下簡稱「本條款」）如下。<br>
凡欲申請加入本網站購物網站會員者，均應事先充分閱讀且瞭解本條款之內容，並在認同此一內容精神與同意遵守相關規定下，申請加入成為本網站購物網站會員。本公司因經營之需要得隨時修改本條款之內容，將不再另行通知修改後的條款，會以公告之方式通知會員。若您於條款修改公告後仍繼續使用本購物網站，即表示您同意修改後的條款並遵守。<br>
&nbsp;
<h3 class="h3_style" >第一條：會員資料提供與保護</h3>

<p>申請人應依本公司提供之會員申請表格內容，詳實提供正確且完整之個人資料。前述資料如有異動，會員應主動即時通知本公司客服中心，本公司並得對會員之資格進行審查核駁。 本公司對於會員提供之資料，得不定時進行審查。如有任何經本公司認為不實、錯誤或有異常之資料，本公司得逕行予以刪除或終止其會員資格。倘有涉及不法嫌疑，本公司並得主動向司法機關舉發。 申請人如未滿二十歲者，應事先經其法定代理人同意及瞭解後，始得申請加入成為本網站購物網站會員。申請程序完畢，即視為申請人已取得法定代理人之同意及瞭解。如有違誤，申請人及其法定代理人應自負完全法律責任。 申請人（即會員）同意本公司可能會因會員使用本網站各項服務而蒐集到會員之個人資料，該等資料將會在會員與本公司間交易往來、消費者管理服務、行銷本公司或關係企業的產品服務及經營本公司營業項目等目的下，於本網站提供服務之地區內處理利用，直到本網站停止服務為止，並僅在前述目的範圍內，將會員個人資料提供給本公司關係企業、物流通路商、受本公司委託處理事務之第三人利用。會員得請求查詢、閱覽、複製、補充、更正個人資料或請求停止蒐集、處理、利用或刪除資料。個人資料應完整填寫，如填寫不實或不完整，致無法取得會員資格，將無法享有活動訊息傳遞、行銷商品及提供服務等之權益。</p>

<h3 class="h3_style" >第二條：密碼與帳號的保護</h3>

<p>申請人於閱讀完本條款後，按下「同意」之按鍵經完成申請加入或登錄程序後，即取得本網站購物網站網路會員資格並可取得一帳號及密碼，作為日後進入本網站之憑證。本網站並依密碼與帳號作為辨識之依據。 為維持會員個人之權益，已取得網路登錄權之本網站購物網站會員均應自行維持其密碼與帳號之機密安全，以同一個會員帳號和密碼使用會員服務所進行的所有行為，都將被認為是這位會員本人的行為，會員將負完全的責任。同時本網站將依相關法令辦理安全維護事項，防止個人資料被竊取、竄改、毀損、滅失或洩漏，如有發生帳號及密碼外洩、盜用或有其他影響密碼或帳號安全情事者，會員應立即通知本公司，本公司將於接獲消費者通知後，停止該進行交易之處理及利用或採取其他保護之措施，但上述通知不代表本公司對會員負有任何形式之賠償或補償的責任。 前項情事除因本公司故意或重大過失所致之損害者外，概由會員自行負責。本公司經消費者請求提供被冒用期間之交易資訊相關資料，經確認身分無誤後，本網站得於資訊可得範圍內提供相關資料，以防止損害擴大。對於消費者個人資料之蒐集、處理及利用，本公司得於與本條款所載之特定目的之相關範圍內，以誠實信用方法為之。特定目的消失或期限屆滿時之個人資料銷毀，本公司亦秉持誠信原則，謹慎辦理。</p>

<h3 class="h3_style" >第三條：網站連結</h3>

<p>緣網路科技日新月異，會員使用本網站之各項服務時，亦可能連結或接觸其他網站。不論該等網站是否經本公司同意而於本網站購物網站設置連結、廣告或其他可使消費者接觸之管道，該等網站之內容與服務，非屬本公司提供之服務範圍，會員應謹慎評估是否進入該等網站。會員於該等網站上發生之任何糾紛爭議，均與本公司無涉，如因而造成之損害或爭議，本公司不負任何法律責任。</p>

<h3 class="h3_style" >第四條：網站使用規定</h3>
會員應依下列規定使用本網站提供之各項服務：<br>
1.不得登載或寄發各種廣告或有廣告嫌疑之圖形、文字或其他表徵。 2.不得冒用他人之個人資料、密碼或帳號使用本網站。 3.不得公佈、傳輸或散佈電腦病毒或其他違反公序良俗、法令規章之圖形、文字或其他表徵。 4.非經本公司同意，不得進行或引誘第三人為買賣、租賃、贈送或其他具有商業性質之行為。 5.不得進行侵害或疑似侵害本公司或第三人之名譽權、隱私秘密權、智慧財產權或其他權利之行為。 6.不得為其他違反法令規章或經本公司認為不適當之行為。 7.當會員短期內異常大量下單(本公司有權判定何為異常大量下單)&nbsp; ,為保障本公司其他會員購買商品以供家裡寵物用餐所需之權利,本公司於通知該會員後,有權取消或保留該會員訂單至下一批商品生產完成到庫後再出貨。&nbsp;<br>
&nbsp; 本公司得就會員使用情形不定時予以審查。如發現有違反前項第1~6點任一規定或第7點屢勸不配合之情事者，本公司得逕行予以刪除或終止其會員資格。倘有涉及不法嫌疑，本公司並得主動向司法機關舉發。

<h3 class="h3_style" >第五條：服務暫停與中斷</h3>

<p>本網站系統或功能可能因維護、改置或變動發生服務暫停或中斷，本公司將於該暫停或中斷前以公告或其他適當之方式告知會員。本公司將以合理之方式及技術，維護會員服務之正常運作。但如有下列任一情況，本公司將逕行暫停或中斷會員服務之全部或一部，且對因此所造成任何不便或損害，均不負任何賠償或補償之責任：<br>
1.使用者有任何違反政府法令或本使用條款情形。 2.天災或其他不可抗力之因素所導致之服務停止或中斷。 3.非本公司所得控制之事由而致會員服務資訊顯示不正確、或遭偽造、竄改、刪除或擷取、或致系統中斷或不能正常運作時。 4.對會員服務相關軟硬體設備進行搬遷、更換、升級、保養或維修時。 5.其他不可歸責於本公司之事由所致之服務停止或中斷。</p>

<h3 class="h3_style" >第六條：智慧財產權之聲明</h3>

<p>本網站所使用之軟體或程式、公佈之所有圖文、檔案、資訊、網頁設計或其他內容、表徵，除法律另有規定外，均擁有智慧財產權與其他權利。任何人非權利人事先書面同意，不得逕自重製、改作、散佈或為其他妨礙權利人權益之行為。</p>

<h3 class="h3_style" >第七條：責任限制</h3>

<p>會員使用本網站時，在使用過程中所有的資料紀錄，以本網站資料庫所記錄之資料為準。如有發生任何糾紛，雙方將以最大誠意提出各自所儲存之電子資料記錄提交於法院或公正第三人作認定。</p>

<h3 class="h3_style" >第八條：隱私權保障</h3>

<p>關於會員註冊資料以及會員提供之其他特定資料，本公司都將依本條款及相關法律規定保護。但有下列情形時，不在此限：<br>
1.基於法律之規定、或受司法機關與其他有權機關基於法定程序之要求。 2.在緊急情況下為維護其他會員或第三人之合法權益。 3.您的行為違反會員約定條款。 4.為維護會員服務系統的正常運作。</p>

<h3 class="h3_style" >第九條：交易注意事項</h3>

<p>本公司所提供之商品數量有限，為保障所有會員購買權益，請勿異常大量下單，否則本公司有權取消訂單或保留訂單直至下一批新商品生產完成到庫後才出貨。<br>
選購時，請您於挑選後儘速完成訂購程序，放入購物車不代表您已完成訂購，若有其他使用者在您完成訂購程序前已經完成訂購程序，系統會通知您該筆商品已銷售畢，請您自購物車移除。您得依據本公司所提供的確認商品數量及價格機制進行下單。 您一旦在本網站網站完成消費的訂購程序，就表示您提出要約、願意依照本約定條款及相關網頁上所載明的交易條件或限制，訂購該商品，您所留存的聯絡資料（如收件者地址、電話）如有變更，應立即連絡本公司客服人員處理，並且不得以資料不符為理由，否認訂購行為或拒絕付款。 在您使用信用卡進行購物時，您必須填寫確實的信用卡資料。若被發現有不實登錄或任何未經持卡人許可之盜刷情形時，本公司有權暫停或終止您的會員資格並將依法追究。為了保護會員的隱私及權益，本公司不會留存會員在網站上登錄的信用卡號等金融資料。 本網站商品之運送依您訂購時選擇及指定之方式為之，商品之定價不含運費。惟若您符合一定活動優惠條件時，將依您選擇之商品運送方式，由本公司負擔運費。<br>
若您因部分商品退貨致不符合運費優惠條件時，本公司將自您解約退款之金額中收取該筆訂單之原始運送費用新台幣100元整（若有變更，將依下單時網站公告為準）。 您在本網站進行的所有消費行為，原則應以本公司電腦系統所自動紀錄的電子交易資料為準，如遇糾紛，本公司同意提供該筆電子交易資料供您參考，若您仍認為該交易資料有誤，請立即通知本公司進行協商。</p>

<h3 class="h3_style" >第十條：退貨與退款</h3>

<p>為保障您的權益，若您所訂購的商品本身有瑕疵問題，須於收到商品後七天內向本公司請求退款或退換商品，本公司將全額退款給您，或提供無條件退換貨的售後服務。 根據消費者保護法之規定，本公司將提供您享有商品到貨次日起算七天鑑賞期的權益，前開期間係供您評估是否購買該商品，並非提供您試用該商品，您可在前開期間內要求退貨退款，但提醒您，您所退回的商品內容必須保維持所有商品、贈品、附件、包裝、附隨文件或資料的完整性，如有實體發票則須連同發票一併退回，並且簽屬「退貨折讓單」等相關法令規定文件，否則，本公司有權利拒絕您的解約退款要求。 退貨或換貨時，請您使用原包裝紙箱（冷藏商品請使用原包裝保麗龍箱與保冷劑）將欲辦理退貨之商品包裝妥當，若原包裝紙箱(原包裝保麗龍箱與保冷劑或紙箱)已遺失，請使用其他完整紙箱(保麗龍箱與保冷劑或紙箱)包裝，切勿直接於原包裝上黏貼紙張或書寫文字。 您要求退貨或換貨之商品若有缺件或是損毀、或是包裝上有汙損、塗改（包含原包裝），本公司有權視損毀程度而折扣退款金額；但若是新品瑕疵則不在此限。本公司在接獲並確認您的退貨(換貨)通知後，將委託宅配公司於五個工作天內取回退貨商品，退貨(換貨)商品經檢驗無誤後，本公司將盡速處理退款(換貨)事宜。</p>

<h3 class="h3_style" >第十一條：約定條款之修改</h3>

<p>除本約定條款外，您還應遵守相關網頁上所擬定的其他相關交易條件及說明。 為因應政府法令規定，本公司保留隨時修訂或變更本約定條款內容的權利，修改後的條款內容將公布在本網站，本公司將不會個別通知會員，您應隨時注意相關內容的修改與變更。如您在約定條款修改內容生效後，仍繼續在本網站進行購物，即表示您已經瞭解且同意遵守本約定條款的所有修改或變更。若您不同意者，請勿繼續使用本網站相關服務。</p>

<h3 class="h3_style" >第十二條：資料保密</h3>

<p>本公司因交易而知悉或持有消費者之交易紀錄及其他相關資料，將進行保密，並建置符合交易需求之安全機制。若發生不當使用個人資料情形，致消費者受有損害時，將依相關法律負賠償責任 。</p>

<h3 class="h3_style" >第十三條：本聲明書之效力、準據法與管轄法院</h3>

<p>本條款中，任何條款之全部或一部份無效時，不影響其他約定之效力。會員與本公司之權利義務關係，應依本條款規範及中華民國法令為依據處理。若產生任何爭議而有訴訟必要時，以台灣台北地方法院為第一審管轄法院。本公司的任何聲明、條款如有未盡完善之處，將以最大誠意，依誠實信用、平等互惠原則，與會員共商解決之道。</p>

        </div>
    </div>
    <form method="post" action="#" onsubmit="return it16_check(this);">
        <div class="SB_MemberClause_agree" style="text-align: center;">
            
        </div>
        <div class="SB_MemberClause_btn jooshop_btn_color">
            <a href="member-into-2.jsp"><input name="btn_submit" value="同意會員條款" type="button" tabindex="2"  id="btn_afteragree" ></a><!---->
        </div>
        <input type="hidden" name="nti_eCVCMSVCRCVCMSVBRiVCQSVBOXklN0YlQjQlN0MlQUV6JUFDJTgxJUI2JTdGJUFGJUI4JUJEJUI1JUI3JUI4JUFGJTdEeg" value="MTU5OTkwODM4NkJHTWxRN080Y2FoUjJORnhBNEV2YU1LbDNFQk43Wkdo">
    <input type="hidden" name="nti_eCVCMSVCRCVCMSVBRiVCQSVBOXklN0YlQjQlN0MlQUV6JUFDJTgxJUI2JTdGJUFGJUI4JUJEJUI1JUI3JUI4JUFGJTdEeg" value="MTU5OTkwODM4NkJHTWxRN080Y2FoUjJORnhBNEV2YU1LbDNFQk43Wkdo"></form>
</div>      
</div>
<!---->
<!---->

</div>            <!---->
        </div>
        </div>
            <!-- member-into End--> 
    </section>
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

   
</body>

</html>