<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp"%>
<html>
<head>
<script type="text/javascript" src="${baseUrl}/resources/vlaCalendar/jslib/mootools-1.2-core.js"></script>
<script type="text/javascript" src="${baseUrl}/resources/vlaCalendar/jslib/vlaCal-v2.1.js"></script>
<link type="text/css" media="screen" href="${baseUrl}/resources/vlaCalendar/styles/vlaCal-v2.1.css"
	rel="stylesheet" />
</head>
<jsp:include page="/page/common/header.jsp" flush="true">
	<jsp:param name="select" value='admin' />
</jsp:include>
<div class="container">
<br><br><br>
	<h1>删除过期的增量数据</h1>

	<form class="form-inline" action="deleteIncreasedData.html" method="post">
		<input type="text" class="time span2" id="gmtModified" name="gmtModified" value="${gmtModified}" />
		<!--  -->
		&nbsp;&nbsp;
		<!--  -->
		<button type="submit" class="btn btn-primary">删除</button>
		${message }
	</form>

</div>



<script>
	$('.time').datetimepicker({
		dateFormat : 'yy-mm-dd',
		timeFormat : 'hh:mm:ss',
		separator : ' ',
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
