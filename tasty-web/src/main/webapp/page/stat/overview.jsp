<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp"%>
<html>
<head>
	<title>柯南——一个风控系统</title>
</head>


<body>
<jsp:include page="/page/common/header.jsp" flush="true">
	<jsp:param name="select" value='admin' />
</jsp:include>

	<div class="container">
<br><br><br>
	<h1>全局统计信息</h1>
		<table class="table table-bordered table-striped">
			<tr>
				<td class="statOverView-Category">
					操作记录总数
				</td>
				<td>
					${globalStat.totalLogNum }
				</td>
			</tr>
		</table>

	</div>









</body>
</html>
