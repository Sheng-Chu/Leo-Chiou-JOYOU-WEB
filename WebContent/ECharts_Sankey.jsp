<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <jsp:useBean id="qwer" class="joyou.StringTokService" scope="page"/>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>sankey</title>
    <!-- 引入 echarts.js -->
   <script src="js/echarts.min.js"></script>
</head>
<body>
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="width: 600px;height:400px;"></div>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
        // 指定图表的配置项和数据
      option = {  title: {
          text: '使用者足跡',
          
      },
    series: {
        type: 'sankey',
        layout: 'none',
        focusNodeAdjacency: 'allEdges',
        data: [{
            name: '1'
        },{
            name: '2'
        }, {
            name: '3'
        }, {
            name: '4'
        }, {
            name: '5'
        }, {
            name: '6'
        }, {
            name: '7'
        },{
            name: '8'
        },{
            name: '9'
        }],
        links: [{
            source: '1',
            target: '2',
            value: ${qwer.treee[0]}
        },{
            source: '2',
            target: '3',
            value: ${qwer.treee[1]}
        }, {
            source: '2',
            target: '4',
            value: ${qwer.treee[2]}
        }, {
            source: '2',
            target: '5',
            value: ${qwer.treee[3]}
        }, {
            source: '2',
            target: '6',
            value: ${qwer.treee[4]}
        }, {
            source: '2',
            target: '7',
            value: ${qwer.treee[5]}
        }, {
            source: '4',
            target: '6',
            value: ${qwer.treee[6]}
        }, {
            source: '5',
            target: '6',
            value: ${qwer.treee[7]}
        }, {
            source: '6',
            target: '8',
            value: ${qwer.treee[8]}
        }, {
            source: '8',
            target: '9',
            value: ${qwer.treee[9]}
        }]
    }
};

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
</body>
</html>