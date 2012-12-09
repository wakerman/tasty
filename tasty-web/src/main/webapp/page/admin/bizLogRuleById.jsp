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
<br><br><br>
		<h1>
			日志规则配置<font color="#2894FF" size="4"><a href="bizLogRuleList.html">返回</a></font>
		</h1>
		<br>
		<form class="form-horizontal" action="updateBizLogRulePageHandle.html"  method="POST">

			<div class="control-group">
				<label class="control-label" for="inputEmail">ID</label> <label class="control-label"
					for="inputEmail">${bizLogRule.id }</label> <input type="hidden" name="id" id="id"
					value="${bizLogRule.id }">
			</div>

			<div class="control-group">
				<label class="control-label" for="inputEmail">LogTypeKey</label>
				<div class="controls">
					<input class="span10" type="text" id="logTypeKey" name="logTypeKey"
						value="${bizLogRule.logTypeKey }">
				</div>
			</div>


			<div class="control-group">
				<label class="control-label" for="inputEmail">LogTypeName</label>
				<div class="controls">
					<input class="span10" type="text" id="logTypeName" name="logTypeName"
						value="${bizLogRule.logTypeName }">
				</div>
			</div>

			<div class="control-group">
				<label class="control-label" for="inputEmail">LogTypeDesc</label>
				<div class="controls">
					<textarea class="span10" rows="5" id="logTypeDesc" name="logTypeDesc">${bizLogRule.logTypeDesc }</textarea>
				</div>
			</div>

			<div class="control-group">
				<label class="control-label" for="inputEmail">操作类型</label>
				<div class="controls">
					<textarea class="span10" rows="5" id="logOperTypeList" name="logOperTypeList">${fn:replace( fn:replace( fn:replace(bizLogRule.logOperTypeList,"[","") ,"]","") ,", ",",")}</textarea>
				</div>
			</div>

			<input type="hidden" id="logSample" name="logSample" value="${bizLogRule.logSample }" />
			<div class="control-group">
				<label class="control-label" for="inputEmail">LogKeyValue</label>
				<div class="controls">
					<textarea class="span10" rows="5" id="logKeyValue" name="logKeyValue">${bizLogRule.logKeyValue }</textarea>
				</div>
			</div>

			<div class="control-group">
				<label class="control-label" for="inputEmail">AppName</label>
				<div class="controls">
					<input class="span10" type="text" id="appName" name="appName" value="${bizLogRule.appName }">
				</div>
			</div>

			<div class="control-group">
				<label class="control-label" for="inputEmail">AppOwner</label>
				<div class="controls">
					<input class="span10" type="text" id="appOwner" name="appOwner" value="${bizLogRule.appOwner }">
				</div>
			</div>


			<div class="control-group">
				<label class="control-label" for="inputEmail">GMT-Create</label> <label class="control-label"
					for="inputEmail">${bizLogRule.gmtCreate}</label>
			</div>

			<div class="control-group">
				<label class="control-label" for="inputEmail">Log Format</label> <select class="span2"
					name="logFormatTypeKey" id="logFormatTypeKey">
					<c:if test="${not empty logFormatTypeList}">
						<c:forEach var="logFormatType" items="${logFormatTypeList}">

							<c:choose>
								<c:when test="${ logFormatType.key == bizLogRule.logFormatTypeKey }">
									<option value="${ logFormatType.key }" selected>${ logFormatType.name }</option>
								</c:when>
								<c:otherwise>
									<option value="${ logFormatType.key }">${ logFormatType.name }</option>
								</c:otherwise>
							</c:choose>

						</c:forEach>
					</c:if>
				</select>
			</div>






			<div class="control-group">
				<div class="controls">
					<button type="submit" class="btn">Update</button>
				</div>
			</div>


		</form>

		<form class="form-horizontal" action="deleteBizLogRuleById.html">
			<div class="control-group">
				<div class="controls">
					<button type="submit" class="btn btn-danger">Delete</button>
				</div>
			</div>
			<div class="control-group">
				<input type="hidden" name="id" id="id" value="${bizLogRule.id }">
			</div>
		</form>

	</div>









</body>
</html>
