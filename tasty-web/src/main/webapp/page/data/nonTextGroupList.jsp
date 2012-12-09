<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet"
	href="${baseUrl}/resources/css/jquery-ui-1.8.5.custom.css"
	type="text/css" />
<link rel="stylesheet" type="text/css"
	href="${baseUrl}/resources/css/popDiv.css" />
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
			<jsp:param name="select" value="data" />
		</jsp:include>
		<div id="wrapper">
			<div id="content">
				<div id="box">
					<br> <font color="blue" face="微软雅黑" size="4">&nbsp;&nbsp;&nbsp;&nbsp;非纯文本数据列表<font color="red" face="微软雅黑" size="2">(Total${fn:length(datas) })</font></font>
					<%@include file="/page/common/data/dataQueryResult.jsp"%>
				</div>
			</div>
			<jsp:include page="/page/common/menu.jsp">
				<jsp:param name="select" value='nonTextGroup' />
			</jsp:include>

		</div>
		<%@include file="/page/common/footer.jsp"%>
	</div>
</body>
</html>
