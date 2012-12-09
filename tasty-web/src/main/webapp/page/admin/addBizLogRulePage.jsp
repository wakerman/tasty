<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp"%>
<html>
<head>
</head>


<body>
<jsp:include page="/page/common/header.jsp" flush="true">
	<jsp:param name="select" value='admin' />
</jsp:include>

	<div class="container">

		<h1>
			日志规则添加<font color="#2894FF" size="4"><a href="bizLogRuleList.html">返回</a></font>
		</h1>
		<br>
		<form class="form-horizontal" action="addBizLogRuleHandle.html">

			<div class="control-group">
				<label class="control-label" for="inputEmail">LogTypeKey</label>
				<div class="controls">
					<input class="span10" type="text" id="logTypeKey" name="logTypeKey">
				</div>
			</div>


			<div class="control-group">
				<label class="control-label" for="inputEmail">LogTypeName</label>
				<div class="controls">
					<input class="span10" type="text" id="logTypeName" name="logTypeName">
				</div>
			</div>

			<div class="control-group">
				<label class="control-label" for="inputEmail">LogTypeDesc</label>
				<div class="controls">
					<textarea class="span10" rows="5" id="logTypeDesc" name="logTypeDesc"></textarea>
				</div>
			</div>

			<div class="control-group">
				<label class="control-label" for="inputEmail">LogSample</label>
				<div class="controls">
					<textarea class="span10" rows="5" id="logSample" name="logSample"></textarea>
				</div>
			</div>


			<div class="control-group">
				<label class="control-label" for="inputEmail">LogKeyValue</label>
				<div class="controls">
					<textarea class="span10" rows="5" id="logKeyValue" name="logKeyValue"></textarea>
				</div>
			</div>

			<div class="control-group">
				<label class="control-label" for="inputEmail">AppName</label>
				<div class="controls">
					<input class="span10" type="text" id="appName" name="appName" value="">
				</div>
			</div>

			<div class="control-group">
				<label class="control-label" for="inputEmail">AppOwner</label>
				<div class="controls">
					<input class="span10" type="text" id="appOwner" name="appOwner">
				</div>
			</div>

			<select class="span2" name="logFormatTypeKey" id="logFormatTypeKey">
				<c:if test="${not empty logFormatTypeList}">
					<c:forEach var="logFormatType" items="${logFormatTypeList}">
						<option value="${ logFormatType.key }">${ logFormatType.name }</option>
					</c:forEach>
				</c:if>
			</select>


			<div class="control-group">
				<div class="controls">
					<button type="submit" class="btn">Save</button>
				</div>
			</div>
		</form>

	</div>









</body>
</html>
