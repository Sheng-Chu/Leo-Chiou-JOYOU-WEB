<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>揪遊 JOYOU | BOARD GAMES 後台管理系統</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description"
	content="NumScroller - jQuery plugin for number increment rolling animation when it becomes visibile while scrolling">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
	background: #eeeeee;
	color: #333333;
	font-family: arial;
	font-size: 14px;
	margin: 0;
	padding: 0;
	overflow-x: hidden;
}

.container {
	width: 800px;
	margin: 50px auto;
	max-width: 95%;
}

.section {
	background: #ffffff;
	border: 1px solid #dddddd;
	margin-top: 20px;
	margin-bottom: 20px;
	padding: 20px;
}

#content, #content2 {
	background: #ddd;
	height: 200px;
}

.t1 {
	width: 100px;
	height: 100px;
	background: #ef8603;
	margin: 20px;
}

.highlight {
	font-weight: bold;
}

.option-table tr {
	vertical-align: top;
}

table.option-table {
	border-width: 1px;
	border-spacing: 0px;
	border-style: outset;
	border-color: #f7f7f7;
	border-collapse: separate;
	background-color: white;
}

table.option-table th {
	border-width: 1px;
	padding: 5px;
	border-style: inset;
	border-color: #f7f7f7;
	background-color: white;
}

table.option-table td {
	border-width: 1px;
	padding: 5px;
	border-style: inset;
	border-color: #f7f7f7;
	background-color: white;
}

.footer {
	margin-top: 50px;
	margin-bottom: 50px;
	text-align: right;
}

.share {
	margin-top: 20px;
}

.clear {
	clear: both;
}

.half-left {
	float: left;
	width: 40%;
}

.half-right {
	float: right;
	width: 40%;
}

.numscroller-big-bottom {
	font-size: 44px;
	text-align: center;
}

.numscroller-info-top {
	font-size: 20px;
	margin-bottom: 10px;
}
</style>
<!-- 統計樣式開始 -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/WebMaintain/iancss/css/animsition.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/WebMaintain/iancss/css/drop-down.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/WebMaintain/iancss/css/common.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/WebMaintain/iancss/css/xsfx.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/WebMaintain/iancss/jedate/skin/jedate.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/WebMaintain/iancss/css/jquery-labelauty.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/WebMaintain/iancss/css/alertify/alertify.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/WebMaintain/iancss/css/alertify/default.min.css" />
<!-- 統計樣式結束 -->


<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/WebMaintain/img/favicon.ico" />
<!-- Google Fonts
		============================================ -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900"
	rel="stylesheet" />
<!-- Bootstrap CSS
		============================================ -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/WebMaintain/css/bootstrap.min.css" />
<!-- Bootstrap CSS
		============================================ -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/WebMaintain/css/font-awesome.min.css" />
<!-- nalika Icon CSS
		============================================ -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/WebMaintain/css/nalika-icon.css" />
<!-- owl.carousel CSS
		============================================ -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/WebMaintain/css/owl.carousel.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/WebMaintain/css/owl.theme.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/WebMaintain/css/owl.transitions.css" />
<!-- animate CSS
		============================================ -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/WebMaintain/css/animate.css" />
<!-- normalize CSS
		============================================ -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/WebMaintain/css/normalize.css" />
<!-- meanmenu icon CSS
		============================================ -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/WebMaintain/css/meanmenu.min.css" />
<!-- main CSS
		============================================ -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/WebMaintain/css/main.css" />
<!-- morrisjs CSS
		============================================ -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/WebMaintain/css/morrisjs/morris.css" />
<!-- mCustomScrollbar CSS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/WebMaintain/css/scrollbar/jquery.mCustomScrollbar.min.css" />
<!-- metisMenu CSS
		============================================ -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/WebMaintain/css/metisMenu/metisMenu.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/WebMaintain/css/metisMenu/metisMenu-vertical.css" />
<!-- calendar CSS
		============================================ -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/WebMaintain/css/calendar/fullcalendar.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/WebMaintain/css/calendar/fullcalendar.print.min.css" />
<!-- style CSS
		============================================ -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/WebMaintain/css/style.css" />
<!-- responsive CSS
		============================================ -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/WebMaintain/${pageContext.request.contextPath}/WebMaintain/css/responsive.css" />
<!-- modernizr JS
		============================================ -->
<script src="${pageContext.request.contextPath}/WebMaintain/js/vendor/modernizr-2.8.3.min.js"></script>
<script src="js/echarts.min.js"></script>
<script>

	$(document).ready(
			function() {

				var xhr = new XMLHttpRequest();

				xhr.open("GET", "<c:url value='/orderlist.json'/>", true);
				xhr.send();
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4 && xhr.status == 200) {

						eight = JSON.parse(xhr.responseText);

					}
				}

				var xhr1 = new XMLHttpRequest();

				xhr1.open("GET", "<c:url value='/memberlist.json'/>", true);
				xhr1.send();
				xhr1.onreadystatechange = function() {
					if (xhr1.readyState == 4 && xhr1.status == 200) {

						gender = JSON.parse(xhr1.responseText);

					}

				}
				
				var xhr2 = new XMLHttpRequest();

				xhr2.open("GET", "<c:url value='/footlist.json'/>", true);
				xhr2.send();
				xhr2.onreadystatechange = function() {
					if (xhr2.readyState == 4 && xhr2.status == 200) {

						foot = JSON.parse(xhr2.responseText);

					}

				}
				


				




				

				//插件初始化
				$(":checkbox").labelauty({
					checked_label : "",
					unchecked_label : "",
				});
				$(":radio").labelauty({
					checked_label : "",
					unchecked_label : "",
				});

				//调用日期
				var start = {
					format : 'YYYY-MM-DD',
					minDate : '2014-06-16 23:59:59', //设定最小日期为当前日期
					isinitVal : true,
					initAddVal : [ -90 ], //初始化日期加2小时
					festival : true,
					maxDate : $.nowDate(0), //最大日期
					choosefun : function(elem, datas) {
						end.minDate = datas; //开始日选好后，重置结束日的最小日期
					}
				};
				var end = {
					format : 'YYYY-MM-DD',
					minDate : $.nowDate(0), //设定最小日期为当前日期
					isinitVal : true,
					maxDate : '2099-06-16', //最大日期
					choosefun : function(elem, datas) {
						start.maxDate = datas; //将结束日的初始值设定为开始日的最大日期
					}
				};
				$("#inpstart").jeDate(start);
				$("#inpend").jeDate(end);

				//初始化切换
				$(".animsition").animsition(
						{

							inClass : 'fade-in-right',
							outClass : 'fade-out',
							inDuration : 1500,
							outDuration : 800,
							linkElement : '.animsition-link',
							// e.g. linkElement   :   'a:not([target="_blank"]):not([href^=#])'
							loading : true,
							loadingParentElement : 'body', //animsition wrapper element
							loadingClass : 'animsition-loading',
							unSupportCss : [ 'animation-duration',
									'-webkit-animation-duration',
									'-o-animation-duration' ],
							//"unSupportCss" option allows you to disable the "animsition" in case the css property in the array is not supported by your browser.
							//The default setting is to disable the "animsition" in a browser that does not support "animation-duration".

							overlay : false,

							overlayClass : 'animsition-overlay-slide',
							overlayParentElement : 'body'
						});

				// 路径配置
				require.config({
					paths : {
						echarts : 'http://echarts.baidu.com/build/dist'
					}
				});

				// 使用
				require([ 'echarts', 'echarts/chart/bar', 'echarts/chart/line',
						'echarts/chart/pie', 'echarts/chart/map',// 使用柱状图就加载bar模块，按需加载
				], function(ec) {
					// 基于准备好的dom，初始化echarts图表
					var myChart = ec.init(document.getElementById('main1'),
							'macarons');
					var myChart2 = ec.init(document.getElementById('main2'),
							'macarons');
					var ecConfig = require('echarts/config');

					var option = {
						backgroundColor : 'white',
						tooltip : {
							trigger : 'item',
							formatter : '{a}' + '<br/>' + '{b}:{d}%'

						},
						toolbox : {
							show : false,
							feature : {
								mark : {
									show : true
								},
								dataView : {
									show : true,
									readOnly : false
								},
								magicType : {
									show : true,
									type : [ 'pie', 'funnel' ],
									option : {
										funnel : {
											x : '25%',
											width : '50%',
											funnelAlign : 'center',
											max : 1548
										}
									}
								}
							}
						},
						calculable : false,
						series : [ {
							name : '種類',
							type : 'pie',
							center : [ '50%', '50%' ],
							radius : [ '40%', '60%' ],
							itemStyle : {
								normal : {
									label : {
										show : true,
										formatter : function(param) {
											return param.name + ':\n'
													+ Math.round(param.percent)
													+ '%';
										},
										textStyle : {
											fontWeight : 'bolder'
										}
									}
								},
								emphasis : {
									label : {
										show : true,
										position : 'center',
										textStyle : {
											fontSize : '30',
											fontWeight : 'bold'
										}
									}
								}
							},
							data : [ {
								value : eight[0],
								name : '派對'
							}, {
								value : eight[1],
								name : '策略'
							}, {
								value : eight[2],
								name : '情境'
							}, {
								value : eight[3],
								name : '戰爭'
							}, {
								value : eight[4],
								name : '抽象'
							}, {
								value : eight[5],
								name : '交換卡片'
							}, {
								value : eight[6],
								name : '兒童'
							}, {
								value : eight[7],
								name : '家庭'
							} ]

						} ]
					};
					var option2 = {
						backgroundColor : 'white',
						tooltip : {
							trigger : 'item',
							formatter : '{a}' + '<br/>' + '{b}:{d}%'

						},
						toolbox : {
							show : false,
							feature : {
								mark : {
									show : true
								},
								dataView : {
									show : true,
									readOnly : false
								},
								magicType : {
									show : true,
									type : [ 'pie', 'funnel' ],
									option : {
										funnel : {
											x : '25%',
											width : '50%',
											funnelAlign : 'center',
											max : 1548
										}
									}
								}
							}
						},
						calculable : false,
						series : [ {
							name : '性別',
							type : 'pie',
							center : [ '50%', '50%' ],
							radius : [ '40%', '60%' ],
							itemStyle : {
								normal : {
									label : {
										show : true,
										formatter : function(param) {
											return param.name + ' : '
													+ Math.round(param.percent)
													+ '%';
										},
										textStyle : {
											fontWeight : 'bolder'
										}
									}
								},
								emphasis : {
									label : {
										show : true,
										position : 'center',
										textStyle : {
											fontSize : '30',
											fontWeight : 'bold'
										}
									}
								}
							},
							data : [ {
								value : gender[0],
								name : '男'
							}, {
								value : gender[1],
								name : '女'
							},

							]

						} ]
					};

					// 为echarts对象加载数据 
					myChart.setOption(option);
					myChart2.setOption(option2);

					//点击搜索
					$('#my_search').on('click', function() {

						myChart.clear();
						myChart.setOption(option, true);
					})

					$('input[name=num]').on('click', function() {

					});

				});





				//漏斗圖創建
				var myChart1 = echarts.init(document.getElementById('funnel'));
				option = {
					    title: {
					        text: '',
					        subtext: ''
					    },
					    tooltip: {
					        trigger: 'item',
					        formatter: "{a} <br/>{b} : {c}%"
					    },
					    toolbox: {
					        feature: {
					            dataView: {readOnly: false},
					            
					            saveAsImage: {}
					        }
					    },
					    legend: {
					        data: ['進入首頁','註冊','瀏覽商品頁面','放入購物車','完成交易']
					    },
					    series: [
					        {
					            name: '預期',
					            type: 'funnel',
					            left: '10%',
					            width: '80%',
					            label: {
					                formatter: '{b}(預期)'
					            },
					            labelLine: {
					                show: false
					            },
					            itemStyle: {
					                opacity: 0.7
					            },
					            emphasis: {
					                label: {
					                    position: 'inside',
					                    formatter: '{b}預期: {c}%'
					                }
					            },
					            data: [
					                {value: 100, name: '進入首頁'},
					                {value: 80, name: '註冊'},
					                {value: 60, name: '瀏覽商品頁面'},
					                {value: 40, name: '放入購物車'},
					                {value: 20, name: '完成交易'}
					            ]
					        },
					        {
					            name: '實際',
					            type: 'funnel',
					            left: '10%',
					            width: '80%',
					            maxSize: '80%',
					            label: {
					                position: 'inside',
					                formatter: '{c}%',
					                color: '#fff'
					            },
					            itemStyle: {
					                opacity: 0.5,
					                borderColor: '#fff',
					                borderWidth: 2
					            },
					            emphasis: {
					                label: {
					                    position: 'inside',
					                    formatter: '{b}實際: {c}%'
					                }
					            },
					            data: [
					                {value: ${footlist[10]} , name: '進入首頁'},
					                {value: ${footlist[11]} , name: '註冊'},
					                {value: ${footlist[15]} , name: '瀏覽商品頁面'},
					                {value: ${footlist[17]} , name: '放入購物車'},
					                {value: ${footlist[18]}, name: '完成交易'},
					            ]
					        }
					    ]
					};
				  myChart1.setOption(option);
				//雷達圖創建
				 var myChart2 = echarts.init(document.getElementById('radar'));


			        option = {
			        	    title: {
			        	        text: ''
			        	    },
			        	    tooltip: {},
			        	    legend: {
			        	        data: [ '會員喜好']
			        	    },
			        	    radar: {
			        	        // shape: 'circle',
			        	        name: {
			        	            textStyle: {
			        	                color: '#fff',
			        	                backgroundColor: '#999',
			        	                borderRadius: 3,
			        	                padding: [3, 5]
			        	            }
			        	        },
			        	        indicator: [
			        	            { name: '派對', max: ${gametype[8]}},
			        	            { name: '策略', max: ${gametype[8]}},
			        	            { name: '情境', max: ${gametype[8]}},
			        	            { name: '戰爭', max: ${gametype[8]}},
			        	            { name: '抽象', max: ${gametype[8]}},
			        	            { name: '交換卡片', max: ${gametype[8]}},
			        	            { name: '兒童', max: ${gametype[8]}},
			        	            { name: '家庭', max: ${gametype[8]}}
			        	        ]
			        	    },
			        	    series: [{
			        	        name: '會員喜好（）',
			        	        type: 'radar',
			        	        // areaStyle: {normal: {}},
			        	        data: [
			        	          
			        	            {
			        	                value: [${gametype[0]}, ${gametype[1]}, ${gametype[2]}, ${gametype[3]}, ${gametype[4]}, ${gametype[5]},${gametype[6]},${gametype[7]}],
			        	                name: '會員喜好'
			        	            }
			        	        ]
			        	    }]
			        	};
					
			        myChart2.setOption(option);


				
			});
			
	
</script>


<!-- 統計script開始 -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/WebMaintain/iancss/js/numscroller-1.0.js"></script>
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="${pageContext.request.contextPath}/WebMaintain/iancss/layer/layer.js"></script>
<script src="${pageContext.request.contextPath}/WebMaintain/iancss/js/alertify.min.js"></script>
<script src="${pageContext.request.contextPath}/WebMaintain/iancss/js/alertify.min.js"></script>
<script src="${pageContext.request.contextPath}/WebMaintain/iancss/js/jquery-labelauty.js"></script>
<script src="${pageContext.request.contextPath}/WebMaintain/iancss/js/jquery.cityselect.js"></script>
<script src="${pageContext.request.contextPath}/WebMaintain/iancss/jedate/jquery.jedate.min.js"></script>
<script src="http://www.jq22.com/jquery/jquery-ui-1.11.0.js"></script>
<script src="${pageContext.request.contextPath}/WebMaintain/iancss/js/select-widget-min.js"></script>
<script src="${pageContext.request.contextPath}/WebMaintain/iancss/js/jquery.animsition.min.js"></script>
<script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
<script src="${pageContext.request.contextPath}/WebMaintain/iancss/js/macarons .js"></script>
<script src="${pageContext.request.contextPath}/WebMaintain/iancss/js/common.js"></script>
<!-- 統計script結束 -->
	<!-- jquery
		============================================ -->
	<!-- bootstrap JS
		============================================ -->
	<script src="${pageContext.request.contextPath}/WebMaintain/js/bootstrap.min.js"></script>
	<!-- wow JS
		============================================ -->
	<script src="${pageContext.request.contextPath}/WebMaintain/js/wow.min.js"></script>
	<!-- price-slider JS
		============================================ -->
	<script src="${pageContext.request.contextPath}/WebMaintain/js/jquery-price-slider.js"></script>
	<!-- meanmenu JS
		============================================ -->
	<script src="${pageContext.request.contextPath}/WebMaintain/js/jquery.meanmenu.js"></script>
	<!-- owl.carousel JS
		============================================ -->
	<script src="${pageContext.request.contextPath}/WebMaintain/js/owl.carousel.min.js"></script>
	<!-- sticky JS
		============================================ -->
	<script src="${pageContext.request.contextPath}/WebMaintain/js/jquery.sticky.js"></script>
	<!-- scrollUp JS
		============================================ -->
	<script src="${pageContext.request.contextPath}/WebMaintain/js/jquery.scrollUp.min.js"></script>
	<!-- mCustomScrollbar JS
		============================================ -->
	<script src="${pageContext.request.contextPath}/WebMaintain/js/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="${pageContext.request.contextPath}/WebMaintain/js/scrollbar/mCustomScrollbar-active.js"></script>
	<!-- metisMenu JS
		============================================ -->
	<script src="${pageContext.request.contextPath}/WebMaintain/js/metisMenu/metisMenu.min.js"></script>
	<script src="${pageContext.request.contextPath}/WebMaintain/js/metisMenu/metisMenu-active.js"></script>
	<!-- morrisjs JS
		============================================ -->
	<script src="${pageContext.request.contextPath}/WebMaintain/js/sparkline/jquery.sparkline.min.js"></script>
	<script src="${pageContext.request.contextPath}/WebMaintain/js/sparkline/jquery.charts-sparkline.js"></script>
	<!-- calendar JS
		============================================ -->
	<script src="${pageContext.request.contextPath}/WebMaintain/js/calendar/moment.min.js"></script>
	<script src="${pageContext.request.contextPath}/WebMaintain/js/calendar/fullcalendar.min.js"></script>
	<script src="${pageContext.request.contextPath}/WebMaintain/js/calendar/fullcalendar-active.js"></script>
	<!-- plugins JS
		============================================ -->
	<script src="${pageContext.request.contextPath}/WebMaintain/js/plugins.js"></script>
	<!-- main JS
		============================================ -->
	<script src="${pageContext.request.contextPath}/WebMaintain/js/main.js"></script>
	
</head>

<body>
	<!--[if lt IE 8]>
      <p class="browserupgrade">
        You are using an <strong>outdated</strong> browser. Please
        <a href="http://browsehappy.com/">upgrade your browser</a> to improve
        your experience.
      </p>
    <![endif]-->

	<div class="left-sidebar-pro">
		<nav id="sidebar" class="">
			<!-- Logo圖片更換位置 -->
			<div class="sidebar-header">
				<a href="Index_Maintain.jsp"><img class="main-logo"
					src="${pageContext.request.contextPath}/WebMaintain/img/logo/JOYOU_logo-3.png"
					alt="" /></a> <strong><img
					src="${pageContext.request.contextPath}/WebMaintain/img/logo/JOYOU_logo-3.png"
					alt="" /></strong>
			</div>
			<div class="nalika-profile">
				<div class="profile-dtl">
					<a href="Index_Maintain.jsp"><img
						src="${pageContext.request.contextPath}/WebMaintain/img/logo/joyou-210.png"
						alt="" /></a>
					<h2>
						管理員 <span class="min-dtn">您好</span>
					</h2>
				</div>
				<div class="profile-social-dtl">
					<ul class="dtl-social"></ul>
				</div>
			</div>
			<jsp:include page="banner.jsp" />
		</nav>
	</div>
	<!-- Start Welcome area -->
	<div class="all-content-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="logo-pro">
						<a href="Index_Maintain.jsp"><img class="main-logo"
							src="${pageContext.request.contextPath}/WebMaintain/img/logo/JOYOU_logo-3.png"
							alt="" /></a>
					</div>
				</div>
			</div>
		</div>
		<div class="header-advance-area">
			<div class="header-top-area">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="header-top-wraper">
								<div class="row">

									<div class="col-lg-6 col-md-7 col-sm-6 col-xs-12"></div>
									<div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
										<div class="header-right-info">
											<ul class="nav navbar-nav mai-top-nav header-right-menu">
												<li class="nav-item"><a href="${pageContext.request.contextPath}/index.jsp"> <i
														class="fa fa-user"></i> <span class="admin-name">登出</span>
												</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Mobile Menu end -->
			<div class="breadcome-area">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="breadcome-list">
								<div class="row">
									<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
										<div class="breadcomb-wp">
											<div class="breadcomb-icon"></div>
											<div class="breadcomb-ctn">
												<h2>揪遊網站數據統計</h2>
											</div>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
										<div class="breadcomb-report"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 統計內容開始 -->
		<div id="Body"
			style="text-align: center; line-height: 50px; font-size: 15px; color: #f9c81e; font-weight: bold;">
			<div class="data_wrap"
				style="background: #efeff5; width: 1200px; height: 2000px;padding: 10px;">
				<div class="animsition" style="overflow: hidden;">
				
					<div style="margin-top:50px">
					<div class="hg_title" style="margin-top: 10px;"></div>
					<h2>桌遊銷售比</h2>
					<div id="main1" class="my_main2"
						style="width: 100%; height: 250px; float: left; margin: 10px 0;"></div>
					</div>
					<div style="margin-top:350px">
					<h2>會員性別比</h2>
					<div id="main2" class="my_main2"
						style="width: 100%; height: 250px; float: right; margin: 10px 0;"></div>
					</div>

					<div class="my_duxs_time" style="margin: 0px;"></div>
					
				<div class='container'>

				<div class='section half-left'>

					<div class='numscroller-info-top'>銷售總額統計</div>
					<div class='numscroller numscroller-big-bottom' data-slno='2'
						data-min='0' data-max='${countsell}' data-delay='6'
						data-increment='225'>0</div>

				</div>

				<div class='section half-right'>

					<div class='numscroller-info-top'>會員人數統計</div>
					<div class='numscroller numscroller-big-bottom' data-slno='1'
						data-min='0' data-max='${countnumber}' data-delay='6'
						data-increment='3'>0</div>

				</div>
			

	
			</div>
			
					<!-- 雷達圖-->
				<h2>會員喜好分布</h2>
				<div style="background-color: white;width:800px;margin: 0px auto;">
				<div id="radar" style="width: 400px;height:400px;margin: 0px auto;"></div>
				</div>
				<br>
				<h2>轉換漏斗</h2>
				<div style="background-color: white;width:800px;margin: 0px auto;">
				 <div id="funnel" style="width: 520px;height:400px;margin: 0px auto;"></div>
				 </div>
				 
				</div>

			</div>

		</div>
		<!-- 統計內容結束 -->


	</div>

</body>
</html>