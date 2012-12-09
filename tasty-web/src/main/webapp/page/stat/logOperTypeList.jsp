<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp"%>
<html>
<head>
<title>柯南——一个风控系统</title>
</head>


<body>
<jsp:include page="/page/common/header.jsp" flush="true">
	<jsp:param name="select" value='logOperTypeList' />
</jsp:include>

	<div class="container">
		<br>
		<br>
		<br>
		<h1>操作类型统计</h1>


		<table class="table table-bordered table-striped">
			<colgroup>
				<col class="span2">
				<col class="span6">
			</colgroup>
			<thead>
				<tr>
					<th>应用</th>
					<th>操作类型</th>
				</tr>
			</thead>
			<tbody>

				<c:if test="${not empty bizLogRuleList}">
					<c:forEach var="bizLogRule" items="${bizLogRuleList}">
						<tr>
							<td>${bizLogRule.logTypeKey}</td>
							<td>${fn:replace( fn:replace( fn:replace(bizLogRule.logOperTypeList,"[","") ,"]","") ,", ",",")}</td>
						</tr>
					</c:forEach>
				</c:if>



			</tbody>
		</table>















	</div>









</body>
</html>
