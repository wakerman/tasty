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
					<br> <font color="blue" face="微软雅黑" size="4">&nbsp;&nbsp;&nbsp;&nbsp;推送记录查询</font>
					<form id="form" class="expose" action="${baseUrl}/pushRecordOfService.html" method="get">
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
							<input id="clientIp" name="clientIp" type="text" value="${clientIp }" size="20" /> <br> <b>起始时间</b>
							<!-- -->
							<input type="text" class="time" name="startTime" value="${startTime}" />
							<!--  -->
							&nbsp;&nbsp;&nbsp;&nbsp; <b>结束时间</b><input type="text" class="time" name="stopTime" value="${stopTime}" />
							<!--  -->
							&nbsp;&nbsp;&nbsp;&nbsp; <input id="searchButton" type="submit" value="搜索" />
						</fieldset>
					</form>
					<%@include file="/page/common/push/pushQueryResult.jsp"%>
				</div>
			</div>
			<jsp:include page="/page/common/menu.jsp">
				<jsp:param name="select" value='pushRecordOfService' />
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
