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
			日志规则配置<font color="#2894FF" size="4"><a href="addBizLogRulePage.html">添加</a></font>
		</h1>
		<c:choose>
			<c:when test="${not empty bizLogRuleList}">
				<table class="table table-striped table-bordered">
					<thead>
						<tr>
							<th width="30"><a href="#">应用</a></th>
							<th width="40"><a href="#">日志类型</a></th>
							<th width="40"><a href="#">日志描述</a></th>
							<th width="50"><a href="#">负责人</a></th>
							<th width="90"><a href="#">接入时间</a></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="bizLogRule" items="${bizLogRuleList}">
							<tr>
								<td>${ bizLogRule.appName }</td>
								<td title="${ bizLogRule.logTypeKey }"><a href="bizLogRuleById.html?id=${bizLogRule.id}">${ bizLogRule.logTypeKey }</a></td>
								<td>${ bizLogRule.logTypeName }</td>
								<td>${ bizLogRule.appOwner }</td>
								<td>${ bizLogRule.gmtCreate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:when>
			<c:otherwise>
				<div class="error">目前还没有配置任何日志规则</div>
			</c:otherwise>
		</c:choose>

	</div>












</body>
</html>
