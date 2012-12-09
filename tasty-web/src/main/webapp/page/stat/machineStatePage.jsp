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
			<jsp:param name="select" value="stat" />
		</jsp:include>
		<div id="wrapper">
			<div id="content">
				<div id="box">
					<br> <font color="blue" face="微软雅黑" size="4">&nbsp;&nbsp;&nbsp;&nbsp;机器 上/下线 情况</font>
				
					<form id="form" class="expose" action="${baseUrl}/stat/machineStatePage.html" method="get">
						<fieldset id="personal">
							<b>日期</b>&nbsp;&nbsp;&nbsp; <input type="text" class="date" name="statDate" value="${statDate}" />
							<!--  -->
							&nbsp;&nbsp;&nbsp;&nbsp; <input id="searchButton" type="submit" value="查看" />
						</fieldset>
					</form>

					<c:choose>
						<c:when test="${not empty connectionDiffStats}">
							<table class="tablehover">
								<thead>
									<tr>
										<th width="20"><a href="#">时间</a></th>
										<th width="20"><a href="#">断掉的连接</a></th>
										<th width="20"><a href="#">新增的连接</a></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="connectionDiffStat" items="${connectionDiffStats}">
										<tr>
											<td>${ connectionDiffStat.statDateTime }</td>
											<td><p align="left">${fn:replace(fn:replace(fn:replace(fn:replace(connectionDiffStat.missConnsAnalysis,",","<br>"),"{",""),",","<br>"),"}","")}</p></td>
											<td><p align="left">${fn:replace(fn:replace(fn:replace(fn:replace(connectionDiffStat.extConnsAnalysis,",","<br>"),"{",""),",","<br>"),"}","")}</p></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<jsp:include page="/page/common/pager.jsp">
								<jsp:param value="${totalCount}" name="totalCount" />
								<jsp:param value="${baseUrl}/data_mgr.html" name="url" />
								<jsp:param value="20" name="pageSize" />
								<jsp:param value="20" name="maxPageItems" />
								<jsp:param value="${dataId}" name="dataId" />
								<jsp:param value="${groupId}" name="groupId" />
								<jsp:param value="${like}" name="like" />
							</jsp:include>

						</c:when>
						<c:otherwise>
							<div class="error">暂时没有内容</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>

			<jsp:include page="/page/common/menu.jsp">
				<jsp:param name="select" value='machineStatePage' />
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
