<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp"%>
<html>
<head>
<jsp:include page="/page/common/css-js-sources.jsp" />
<script src="${baseUrl}/resources/js/amcharts/amcharts.js" type="text/javascript"></script>
<script src="${baseUrl}/resources/js/amcharts/raphael.js" type="text/javascript"></script>
</head>
<script type="text/javascript">
	function mychange() {
		var select1 = document.getElementById("data");
		var index = select1.selectedIndex;
		if (index == 1)
			window.location.href = "${baseUrl}/data_mgr.html";
		else if (index == 2)
			window.location.href = "${baseUrl}/pub_mgr.html";
		else if (index == 3)
			window.location.href = "${baseUrl}/sub_mgr.html";
		else
			window.location.href = "${baseUrl}/pub_search.html"
	}
</script>
<link rel="stylesheet" href="${baseUrl}/resources/css/jquery-ui-1.8.5.custom.css" type="text/css" />
<style type="text/css">
.ui-timepicker-div .ui-widget-header {
	margin-bottom: 8px;
}

.ui-timepicker-div dl {
	text-align: left;
}

.ui-timepicker-div dl dt {
	height: 25px;
	margin-bottom: -25px;
}

.ui-timepicker-div dl dd {
	margin: 0 10px 10px 65px;
}

.ui-timepicker-div td {
	font-size: 90%;
}

.ui-tpicker-grid-label {
	background: none;
	border: none;
	margin: 0;
	padding: 0;
}
</style>


<body>


	<input id="contentOfServer1" name="contentOfReport" type="hidden" value="${ contentOfServer1 }" />
	<input id="contentOfServer2" name="contentOfReport" type="hidden" value="${ contentOfServer2 }" />
	<input id="contentOfServer3" name="contentOfReport" type="hidden" value="${ contentOfServer3 }" />


	<!-- server1 -->
	<script type="text/javascript">
            var chartDataStrOfServer1 = document.getElementById("contentOfServer1").value;
            if( null != chartDataStrOfServer1 & ''!=chartDataStrOfServer1 ){
            	
            	var chartDataOfServer1 = eval('(' + chartDataStrOfServer1 + ')');
                AmCharts.ready(function () {
                    // generate some random data first

                    // SERIAL CHART    
                    chartOfServer1 = new AmCharts.AmSerialChart();
                    chartOfServer1.pathToImages = "../amcharts/images/";
                    chartOfServer1.zoomOutButton = {
                        backgroundColor: '#000000',
                        backgroundAlpha: 0.15
                    };
                    chartOfServer1.dataProvider = chartDataOfServer1;
                    chartOfServer1.categoryField = "time";

                    // listen for "dataUpdated" event (fired when chart is inited) and call zoomChart method when it happens
                    //chart.addListener("dataUpdated", zoomChart);		//disable show all

                    // AXES
                    // category                
                    var categoryAxisOfServer1 = chartOfServer1.categoryAxis;
                    //categoryAxisOfServer1.parseDates = true; // as our data is date-based, we set parseDates to true
                    //categoryAxisOfServer1.minPeriod = "DD-DD-DD"; // our data is daily, so we set minPeriod to DD
                    categoryAxisOfServer1.dashLength = 2;
                    categoryAxisOfServer1.gridAlpha = 0.15;
                    categoryAxisOfServer1.axisColor = "#DADADA";

                    // first value axis (on the left)
                    var valueAxis1OfServer1 = new AmCharts.ValueAxis();
                    valueAxis1OfServer1.axisColor = "#FF6600";
                    valueAxis1OfServer1.axisThickness = 2;
                    valueAxis1OfServer1.gridAlpha = 0;
                    chartOfServer1.addValueAxis(valueAxis1OfServer1);

                    // second value axis (on the right) 
                    var valueAxis2OfServer1 = new AmCharts.ValueAxis();
                    valueAxis2OfServer1.position = "right"; // this line makes the axis to appear on the right
                    valueAxis2OfServer1.axisColor = "#FCD202";
                    valueAxis2OfServer1.gridAlpha = 0;
                    valueAxis2OfServer1.axisThickness = 2;
                    chartOfServer1.addValueAxis(valueAxis2OfServer1);

                    // third value axis (on the left, detached)
                    valueAxis3OfServer1 = new AmCharts.ValueAxis();
                    valueAxis3OfServer1.offset = 50; // this line makes the axis to appear detached from plot area
                    valueAxis3OfServer1.gridAlpha = 0;
                    valueAxis3OfServer1.axisColor = "#B0DE09";
                    valueAxis3OfServer1.axisThickness = 2;
                    chartOfServer1.addValueAxis(valueAxis3OfServer1);

                    // GRAPHS
                    // first graph
                    var graph1OfServer1 = new AmCharts.AmGraph();
                    graph1OfServer1.valueAxis = valueAxis1OfServer1; // we have to indicate which value axis should be used
                    graph1OfServer1.title = "发布者数量";
                    graph1OfServer1.valueField = "publishers";
                    graph1OfServer1.bullet = "round";
                    graph1OfServer1.hideBulletsCount = 30;
                    chartOfServer1.addGraph(graph1OfServer1);

                    // second graph                
                    var graph2OfServer1 = new AmCharts.AmGraph();
                    graph2OfServer1.valueAxis = valueAxis2OfServer1; // we have to indicate which value axis should be used
                    graph2OfServer1.title = "订阅者数量";
                    graph2OfServer1.valueField = "subscribers";
                    graph2OfServer1.bullet = "square";
                    graph2OfServer1.hideBulletsCount = 30;
                    chartOfServer1.addGraph(graph2OfServer1);

                    // third graph
                    var graph3OfServer1 = new AmCharts.AmGraph();
                    graph3OfServer1.valueAxis = valueAxis3OfServer1; // we have to indicate which value axis should be used
                    graph3OfServer1.valueField = "connections";
                    graph3OfServer1.title = "客户端连接数";
                    graph3OfServer1.bullet = "triangleUp";
                    graph3OfServer1.hideBulletsCount = 30;
                    chartOfServer1.addGraph(graph3OfServer1);

                    // CURSOR
                    var chartCursorOfServer1 = new AmCharts.ChartCursor();
                    chartCursorOfServer1.cursorPosition = "mouse";
                    chartOfServer1.addChartCursor(chartCursorOfServer1);

                    // SCROLLBAR
                    var chartScrollbarOfServer1 = new AmCharts.ChartScrollbar();
                    chartOfServer1.addChartScrollbar(chartScrollbarOfServer1);

                    // LEGEND
                    var legendOfServer1 = new AmCharts.AmLegend();
                    legendOfServer1.marginLeft = 110;
                    chartOfServer1.addLegend(legendOfServer1);

                    // WRITE
                    chartOfServer1.write("chartdivOfServer1");
                });
            }
            // this method is called when chart is first inited as we listen for "dataUpdated" event
            function zoomChart() {
                // different zoom methods can be used - zoomToIndexes, zoomToDates, zoomToCategoryValues
                chartOfServer1.zoomToIndexes(10, 20);
            }
        </script>



	<!-- OfServer2 -->
	<script type="text/javascript">
            var chartDataStrOfServer2 = document.getElementById("contentOfServer2").value;
            if( null != chartDataStrOfServer2 & ''!=chartDataStrOfServer2 ){
            	
            	var chartDataOfServer2 = eval('(' + chartDataStrOfServer2 + ')');
                AmCharts.ready(function () {
                    // generate some random data first

                    // SERIAL CHART    
                    chartOfServer2 = new AmCharts.AmSerialChart();
                    chartOfServer2.pathToImages = "../amcharts/images/";
                    chartOfServer2.zoomOutButton = {
                        backgroundColor: '#000000',
                        backgroundAlpha: 0.15
                    };
                    chartOfServer2.dataProvider = chartDataOfServer2;
                    chartOfServer2.categoryField = "time";

                    // listen for "dataUpdated" event (fired when chart is inited) and call zoomChart method when it happens
                    //chart.addListener("dataUpdated", zoomChart);		//disable show all

                    // AXES
                    // category                
                    var categoryAxisOfServer2 = chartOfServer2.categoryAxis;
                    //categoryAxisOfServer2.parseDates = true; // as our data is date-based, we set parseDates to true
                    //categoryAxisOfServer2.minPeriod = "yyyy-MM-dd HH:mm:ss"; // our data is daily, so we set minPeriod to DD
                    categoryAxisOfServer2.dashLength = 2;
                    categoryAxisOfServer2.gridAlpha = 0.15;
                    categoryAxisOfServer2.axisColor = "#DADADA";

                    // first value axis (on the left)
                    var valueAxis1OfServer2 = new AmCharts.ValueAxis();
                    valueAxis1OfServer2.axisColor = "#FF6600";
                    valueAxis1OfServer2.axisThickness = 2;
                    valueAxis1OfServer2.gridAlpha = 0;
                    chartOfServer2.addValueAxis(valueAxis1OfServer2);

                    // second value axis (on the right) 
                    var valueAxis2OfServer2 = new AmCharts.ValueAxis();
                    valueAxis2OfServer2.position = "right"; // this line makes the axis to appear on the right
                    valueAxis2OfServer2.axisColor = "#FCD202";
                    valueAxis2OfServer2.gridAlpha = 0;
                    valueAxis2OfServer2.axisThickness = 2;
                    chartOfServer2.addValueAxis(valueAxis2OfServer2);

                    // third value axis (on the left, detached)
                    valueAxis3OfServer2 = new AmCharts.ValueAxis();
                    valueAxis3OfServer2.offset = 50; // this line makes the axis to appear detached from plot area
                    valueAxis3OfServer2.gridAlpha = 0;
                    valueAxis3OfServer2.axisColor = "#B0DE09";
                    valueAxis3OfServer2.axisThickness = 2;
                    chartOfServer2.addValueAxis(valueAxis3OfServer2);

                    // GRAPHS
                    // first graph
                    var graph1OfServer2 = new AmCharts.AmGraph();
                    graph1OfServer2.valueAxis = valueAxis1OfServer2; // we have to indicate which value axis should be used
                    graph1OfServer2.title = "发布者数量";
                    graph1OfServer2.valueField = "publishers";
                    graph1OfServer2.bullet = "round";
                    graph1OfServer2.hideBulletsCount = 30;
                    chartOfServer2.addGraph(graph1OfServer2);

                    // second graph                
                    var graph2OfServer2 = new AmCharts.AmGraph();
                    graph2OfServer2.valueAxis = valueAxis2OfServer2; // we have to indicate which value axis should be used
                    graph2OfServer2.title = "订阅者数量";
                    graph2OfServer2.valueField = "subscribers";
                    graph2OfServer2.bullet = "square";
                    graph2OfServer2.hideBulletsCount = 30;
                    chartOfServer2.addGraph(graph2OfServer2);

                    // third graph
                    var graph3OfServer2 = new AmCharts.AmGraph();
                    graph3OfServer2.valueAxis = valueAxis3OfServer2; // we have to indicate which value axis should be used
                    graph3OfServer2.valueField = "connections";
                    graph3OfServer2.title = "客户端连接数";
                    graph3OfServer2.bullet = "triangleUp";
                    graph3OfServer2.hideBulletsCount = 30;
                    chartOfServer2.addGraph(graph3OfServer2);

                    // CURSOR
                    var chartCursorOfServer2 = new AmCharts.ChartCursor();
                    chartCursorOfServer2.cursorPosition = "mouse";
                    chartOfServer2.addChartCursor(chartCursorOfServer2);

                    // SCROLLBAR
                    var chartScrollbarOfServer2 = new AmCharts.ChartScrollbar();
                    chartOfServer2.addChartScrollbar(chartScrollbarOfServer2);

                    // LEGEND
                    var legendOfServer2 = new AmCharts.AmLegend();
                    legendOfServer2.marginLeft = 110;
                    chartOfServer2.addLegend(legendOfServer2);

                    // WRITE
                    chartOfServer2.write("chartdivOfServer2");
                });
            }
            // this method is called when chart is first inited as we listen for "dataUpdated" event
            function zoomChart() {
                // different zoom methods can be used - zoomToIndexes, zoomToDates, zoomToCategoryValues
                chartOfServer2.zoomToIndexes(10, 20);
            }
        </script>



	<!-- OfServer2 -->
	<script type="text/javascript">
            var chartDataStrOfServer3 = document.getElementById("contentOfServer3").value;
            if( null != chartDataStrOfServer3 & ''!=chartDataStrOfServer3 ){
            	
            	var chartDataOfServer3 = eval('(' + chartDataStrOfServer3 + ')');
                AmCharts.ready(function () {
                    // generate some random data first

                    // SERIAL CHART    
                    chartOfServer3 = new AmCharts.AmSerialChart();
                    chartOfServer3.pathToImages = "../amcharts/images/";
                    chartOfServer3.zoomOutButton = {
                        backgroundColor: '#000000',
                        backgroundAlpha: 0.15
                    };
                    chartOfServer3.dataProvider = chartDataOfServer3;
                    chartOfServer3.categoryField = "time";

                    // listen for "dataUpdated" event (fired when chart is inited) and call zoomChart method when it happens
                    //chart.addListener("dataUpdated", zoomChart);		//disable show all

                    // AXES
                    // category                
                    var categoryAxisOfServer3 = chartOfServer3.categoryAxis;
                    //categoryAxisOfServer3.parseDates = true; // as our data is date-based, we set parseDates to true
                    //categoryAxisOfServer3.minPeriod = "yyyy-MM-dd HH:mm:ss"; // our data is daily, so we set minPeriod to DD
                    categoryAxisOfServer3.dashLength = 2;
                    categoryAxisOfServer3.gridAlpha = 0.15;
                    categoryAxisOfServer3.axisColor = "#DADADA";

                    // first value axis (on the left)
                    var valueAxis1OfServer3 = new AmCharts.ValueAxis();
                    valueAxis1OfServer3.axisColor = "#FF6600";
                    valueAxis1OfServer3.axisThickness = 2;
                    valueAxis1OfServer3.gridAlpha = 0;
                    chartOfServer3.addValueAxis(valueAxis1OfServer3);

                    // second value axis (on the right) 
                    var valueAxis2OfServer3 = new AmCharts.ValueAxis();
                    valueAxis2OfServer3.position = "right"; // this line makes the axis to appear on the right
                    valueAxis2OfServer3.axisColor = "#FCD202";
                    valueAxis2OfServer3.gridAlpha = 0;
                    valueAxis2OfServer3.axisThickness = 2;
                    chartOfServer3.addValueAxis(valueAxis2OfServer3);

                    // third value axis (on the left, detached)
                    valueAxis3OfServer3 = new AmCharts.ValueAxis();
                    valueAxis3OfServer3.offset = 50; // this line makes the axis to appear detached from plot area
                    valueAxis3OfServer3.gridAlpha = 0;
                    valueAxis3OfServer3.axisColor = "#B0DE09";
                    valueAxis3OfServer3.axisThickness = 2;
                    chartOfServer3.addValueAxis(valueAxis3OfServer3);

                    // GRAPHS
                    // first graph
                    var graph1OfServer3 = new AmCharts.AmGraph();
                    graph1OfServer3.valueAxis = valueAxis1OfServer3; // we have to indicate which value axis should be used
                    graph1OfServer3.title = "发布者数量";
                    graph1OfServer3.valueField = "publishers";
                    graph1OfServer3.bullet = "round";
                    graph1OfServer3.hideBulletsCount = 30;
                    chartOfServer3.addGraph(graph1OfServer3);

                    // second graph                
                    var graph2OfServer3 = new AmCharts.AmGraph();
                    graph2OfServer3.valueAxis = valueAxis2OfServer3; // we have to indicate which value axis should be used
                    graph2OfServer3.title = "订阅者数量";
                    graph2OfServer3.valueField = "subscribers";
                    graph2OfServer3.bullet = "square";
                    graph2OfServer3.hideBulletsCount = 30;
                    chartOfServer3.addGraph(graph2OfServer3);

                    // third graph
                    var graph3OfServer3 = new AmCharts.AmGraph();
                    graph3OfServer3.valueAxis = valueAxis3OfServer3; // we have to indicate which value axis should be used
                    graph3OfServer3.valueField = "connections";
                    graph3OfServer3.title = "客户端连接数";
                    graph3OfServer3.bullet = "triangleUp";
                    graph3OfServer3.hideBulletsCount = 30;
                    chartOfServer3.addGraph(graph3OfServer3);

                    // CURSOR
                    var chartCursorOfServer3 = new AmCharts.ChartCursor();
                    chartCursorOfServer3.cursorPosition = "mouse";
                    chartOfServer3.addChartCursor(chartCursorOfServer3);

                    // SCROLLBAR
                    var chartScrollbarOfServer3 = new AmCharts.ChartScrollbar();
                    chartOfServer3.addChartScrollbar(chartScrollbarOfServer3);

                    // LEGEND
                    var legendOfServer3 = new AmCharts.AmLegend();
                    legendOfServer3.marginLeft = 110;
                    chartOfServer3.addLegend(legendOfServer3);

                    // WRITE
                    chartOfServer3.write("chartdivOfServer3");
                });
            }
            // this method is called when chart is first inited as we listen for "dataUpdated" event
            function zoomChart() {
                // different zoom methods can be used - zoomToIndexes, zoomToDates, zoomToCategoryValues
                chartOfServer3.zoomToIndexes(10, 20);
            }
        </script>






	<div id="container">
		<jsp:include page="/page/common/header.jsp" flush="true">
			<jsp:param name="select" value="stat" />
		</jsp:include>
		<div id="wrapper">
			<div id="content">
				<div id="box">
					<br> <font color="blue" face="微软雅黑" size="4">&nbsp;&nbsp;&nbsp;&nbsp;实时趋势图</font>
					<form id="form" class="expose" action="${baseUrl}/stat/
					trendOfRealTimeStat.html" method="get">
						<fieldset id="personal">
							<b>日期</b>&nbsp;&nbsp;&nbsp;
							<input type="text" class="date" name="statDate" value="${statDate}" />
							<!--  -->
							&nbsp;&nbsp;&nbsp;&nbsp; <input id="searchButton" type="submit" value="查看" />
						</fieldset>
					</form>

					<div align="center"><font color="red" size="3" face="微软雅黑">${serverIpOfServer1}</font></div>
					<div id="chartdivOfServer1" style="width: 750px; height: 500px;"></div>
					<br>
					<div align="center"><font color="red" size="3" face="微软雅黑">${serverIpOfServer2}</font></div>
					<div id="chartdivOfServer2" style="width: 750px; height: 500px;"></div>
					<br>
					<div align="center"><font color="red" size="3" face="微软雅黑">${serverIpOfServer3}</font></div>
					<div id="chartdivOfServer3" style="width: 750px; height: 500px;"></div>

				</div>
			</div>

			<jsp:include page="/page/common/menu.jsp">
				<jsp:param name="select" value='trendOfRealTimeStat' />
			</jsp:include>

		</div>
		<%@include file="/page/common/footer.jsp"%>
	</div>




	<!-- 时间选择器 -->
	<script type="text/javascript">
		$('.time').datetimepicker({
			dateFormat : 'yy-mm-dd',
			timeFormat : 'hh:mm:ss',
			separator : '_',
			showSecond : true
		});
		$('.date').datetimepicker({
			dateFormat : 'yy-mm-dd',
			timeFormat : '',
			separator : '',
			showHour : false,
			showMinute : false,
			showSecond : false
		});
	</script>






</body>
</html>
