<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp"%>
<html>
<head>
<jsp:include page="/page/common/css-js-sources.jsp" />
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
<script src="${baseUrl}/resources/js/highcharts/highcharts.js"></script>
<script src="${baseUrl}/resources/js/highcharts/exporting.js"></script>
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

	<div id="container">
		<jsp:include page="/page/common/header.jsp" flush="true">
			<jsp:param name="select" value="pushRecordOfService" />
		</jsp:include>
		<div id="wrapper">
			<div id="content">
				<div id="box">
					<br> <font color="blue" face="微软雅黑" size="4">&nbsp;&nbsp;&nbsp;&nbsp;服务地址数量变化趋势图</font>
					<form id="form" class="expose" action="${baseUrl}/sizeTrendOfPushRecord.html" method="get">
						<fieldset id="personal">
							<b>DataId</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<!--  -->
							<input id="serviceName" name="serviceName" type="text" value="${serviceName }" size="55" />
							<!--  -->
							<b>&nbsp;&nbsp;&nbsp;&nbsp;Group</b> 
							<!--  -->
							<input id="serviceGroup" name="serviceGroup" type="text" value="${serviceGroup }" size="10" />
							<!--  -->
							<b>&nbsp;&nbsp;&nbsp;&nbsp;ClientIp</b>
							<!--  -->
							<input id="clientIp" name="clientIp" type="text" value="${clientIp }" size="20" />
							 <br> <b>起始时间</b>
							<!-- -->
							<input type="text" class="time" name="startTime" value="${startTime}" />
							<!--  -->
							&nbsp;&nbsp;&nbsp;&nbsp; <b>结束时间</b><input type="text" class="time" name="stopTime" value="${stopTime}" />
							<!--  -->
							&nbsp;&nbsp;&nbsp;&nbsp; <input id="searchButton" type="submit" value="搜索" />
						</fieldset>
					</form>
					<c:choose>
						<c:when test="${ ''!= renderSizeTrendOfPushRecordJson && null != renderSizeTrendOfPushRecordJson}">
						&nbsp;&nbsp;注意,推送结果中已经过滤了所有ServiceVersion后缀为：<font color="red">ROUTING.RULE.diamondRealTime</font> 和 <font
								color="red">ROUTING.RULE</font> 的结果集
							<div id="container2" style="min-width: 400px; height: 400px;"></div>

							<jsp:include page="/page/common/pager.jsp">
								<jsp:param value="${totalCount}" name="totalCount" />
								<jsp:param value="${baseUrl}/data_mgr.html" name="url" />
								<jsp:param value="20" name="pageSize" />
								<jsp:param value="20" name="maxPageItems" />
								<jsp:param value="${dataId}" name="dataId" />
								<jsp:param value="${groupId}" name="groupId" />
								<jsp:param value="${like}" name="like" />
							</jsp:include>

						</c:when>
						<c:otherwise>
							<div class="error">请指定 DataId,Group 后进行搜索</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<jsp:include page="/page/common/menu.jsp">
				<jsp:param name="select" value='sizeTrendOfPushRecord' />
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


	<script type="text/javascript">
		debugger;
		var chart;
		$(document)
				.ready(
						function() {

							Highcharts.setOptions({
								global : {
									useUTC : false
								}
							});

							var options = {
								chart : {
									renderTo : 'container2'
								},

								title : {
									text : '服务地址数量变化趋势图',
								},

								xAxis : {
									title : {
										text : ''
									},
									type : 'datetime',
								},

								yAxis : {
									title : {
										text : ''
									},
								},

								tooltip : {
									formatter : function() {
										var date = new Date(this.x);
										var hours = date.getHours();
										if (hours < 10) {
											hours = "0" + hours
										}
										var min = date.getMinutes();
										if (min < 10) {
											min = "0" + min
										}
										return hours + ":" + min + '<br/>'
												+ '<b>' + this.series.name
												+ ": " + this.y;
									}
								},

								plotOptions : {
									series : {
										lineWidth : 2,
										states : {
											hover : {
												lineWidth : 3
											}
										},
										marker : {
											enabled : true,
											states : {
												hover : {
													enabled : true,
													lineWidth : 1
												}
											}
										},
									}
								},

								series : [ {
									name : '服务地址数',
								} ]
							};
							debugger;
							var resp = '${renderSizeTrendOfPushRecordJson}';
							var datas = JSON.parse(resp);

							var counts = [];
							jQuery.each(datas, function(date, count) {
								if (count == -1) {
									counts.push([ parseInt(date), null ]);
								} else {
									counts.push([ parseInt(date), count ]);
								}
							});
							options.series[0].data = counts;

							chart = new Highcharts.Chart(options);
						})
	</script>


</body>
</html>
