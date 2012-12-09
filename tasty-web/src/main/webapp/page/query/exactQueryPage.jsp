<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp"%>
<html>
<head>
	
<style>
.tb{table-layout:fixed}
.tb td{table-layout:fixed; word-break: break-all;}
}
</style>	
	
	
</head>
<jsp:include page="/page/common/header.jsp" flush="true">
	<jsp:param name="select" value='exactQuery' />
</jsp:include>

<div class="container">
<br><br><br>
	<h1>精确查询</h1>

	<form class="form-inline" action="handle.html" method="post">

	<table class="table table-striped table-bordered tb">
		<tr>
			<th class="span2">
				<select class="span2" name="logTypeKey" id="logTypeKey">
					<option value="ALL">应用列表</option>
					<option value="ALL">所有应用</option>
					<c:if test="${not empty bizLogRuleList}">
						<c:forEach var="bizLogRule" items="${bizLogRuleList}">
		
							<c:choose>
								<c:when test="${ bizLogRule.logTypeKey == logTypeKey }">
									<option value="${ bizLogRule.logTypeKey }" selected>${ bizLogRule.logTypeName }</option>
								</c:when>
								<c:otherwise>
									<option value="${ bizLogRule.logTypeKey }">${ bizLogRule.logTypeName }</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:if>
				</select>
			</th>
			<th class="span3">
				<input type="text" id="userNick" name="userNick" class="span2" placeholder="操作人" value="${userNick }">
			</th>
			<th class="span3">
			<input type="text" id="operType" name="operType" class="span2"
			placeholder="操作类型" value="${operType }">
			</th>
			<th class="span5">
				<label>时间</label>
					<input type="text" class="time span2" name="startTime" id="startTime" value="${startTime}" />
					~
					<input type="text" class="time span2" id="endTime" name="endTime" value="${endTime}" />
			</th>
			<th class="span1"><button type="submit" class="btn btn-primary">查 询</button></th>
		</tr>
	</table>
		
	</form>

	<c:if test="${null != dataSourceDO && not empty dataSourceDO.operationRecordList}">
		<table class="table table-striped table-bordered tb">
			<thead>
				<tr>
					<th class="span2"><a href="#">操作人</a></th>
					<th class="span2"><a href="#">应用</a></th>
					<th class="span2"><a href="#">操作类型</a></th>
					<th class="span7"><a href="#">操作内容</a></th>
					<th class="span2"><a href="#">操作时间</a></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="operationRecordStore" items="${dataSourceDO.operationRecordList}">
					<tr>
						<td style="text-align: left;">${ operationRecordStore.userNick }</td>
						<td>${ operationRecordStore.logType }</td>
						<td>${ operationRecordStore.operType }</td>
						<td>${ operationRecordStore.operContent }</td>
						<td>${ operationRecordStore.logTime }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
<font color="red">${message }</font>
<br><br><br>
<%@include file="/page/help/help4ExactQuery.jsp"%>
</div>



<script>
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
