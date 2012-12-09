<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp"%>
<html>
<head>
</head>
<jsp:include page="/page/common/header.jsp" flush="true"></jsp:include>

<div class="container" style="text-align: center;">

	<br> <br> <br> <br> <br> <br> <br> <br> <br> <br>

	<div style="text-align: center;">
		<img src="${baseUrl}/resources/img/kenan-whodidit.png" />
	</div>

	<form class="form-inline" action="search/handle2.html" style="padding-top: 30px;" method="post">

		<!--  -->
		<label></label> <input type="text" id="queryString" name="queryString" class="span6"
			style="height: 30px;" placeholder="操作关键字、店铺名称/id、商品名称/id、评价id/关键字、类目······"
			value="${queryString }">

		<!--  -->
		&nbsp;&nbsp;
		<!--  -->
		<button type="submit" class="btn btn-primary btn-large">查 询</button>
		<br> <br>
		<!--  -->
		<label>时间区间</label>
		<!--  -->
		<input type="text" class="time span2" name="startTime" id="startTime" value="${startTime}" />
		<!--  -->
		~
		<!--  -->
		<input type="text" class="time span2" id="endTime" name="endTime" value="${endTime}" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</form>


</div>



<script>
	$('.time').datetimepicker({
		dateFormat : 'yy-mm-ddT',
		timeFormat : 'hh:mm:ssZ',
		separator : '',
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
