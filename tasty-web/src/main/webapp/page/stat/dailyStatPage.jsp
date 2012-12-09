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
<link rel="stylesheet" type="text/css" href="${baseUrl}/resources/css/popDiv.css" />
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


	<input id="contentOfServer1" name="contentOfReport" type="hidden" value="${ contentOfServer1 }" />
	<input id="contentOfServer2" name="contentOfReport" type="hidden" value="${ contentOfServer2 }" />
	<input id="contentOfServer3" name="contentOfReport" type="hidden" value="${ contentOfServer3 }" />


	<div id="container">
		<jsp:include page="/page/common/header.jsp" flush="true">
			<jsp:param name="select" value="stat" />
		</jsp:include>
		<div id="wrapper">
			<div id="content">
				<div id="box">
					<br> <font color="blue" face="微软雅黑" size="4">&nbsp;&nbsp;&nbsp;&nbsp;ConfigServer日报</font>
					<form id="form" class="expose" action="${baseUrl}/stat/dailyStatPage.html" method="get">
						<fieldset id="personal">
							<b>日期</b>&nbsp;&nbsp;&nbsp; <input type="text" class="date" name="statDate" value="${statDate}" />
							<!--  -->
							&nbsp;&nbsp;&nbsp;&nbsp; <input id="searchButton" type="submit" value="查看" />
						</fieldset>
					</form>

					<c:forEach var="dailyStatsOfStatDate" items="${dailyStatsOfStatDate}" varStatus="loop">
						<div align="center">
							<font color="red" size="3" face="微软雅黑">${dailyStatsOfStatDate.serverIp}</font>
						</div>



						<table>
							<tr style="font-size: 16px;">
								<td bgcolor="#92D050"><b>数据项</b></td>
								<td bgcolor="#92D050"><b>当日均值</b></td>
								<td bgcolor="#92D050"><b>昨日均值</b></td>
								<td bgcolor="#92D050"><b>对比</b></td>
								<td bgcolor="#92D050"><b>当日峰值</b></td>
								<td bgcolor="#92D050"><b>昨日峰值</b></td>
								<td bgcolor="#92D050"><b>对比</b></td>
							</tr>
							<tr>
								<td>订阅者数量</td>
								<td>${dailyStatsOfStatDate.subscribersAvg}</td>
								<td>${dailyStatsOfYesterday[loop.count-1].subscribersAvg}</td>
								<td><fmt:formatNumber type="percent"
										value="${(dailyStatsOfStatDate.subscribersAvg-dailyStatsOfYesterday[loop.count-1].subscribersAvg)/dailyStatsOfYesterday[loop.count-1].subscribersAvg}"
										maxFractionDigits="3" /></td>
								<td>${dailyStatsOfStatDate.subscribersMax}</td>
								<td>${dailyStatsOfYesterday[loop.count-1].subscribersMax}</td>
								<td><fmt:formatNumber type="percent"
										value="${(dailyStatsOfStatDate.subscribersMax-dailyStatsOfYesterday[loop.count-1].subscribersMax)/dailyStatsOfYesterday[loop.count-1].subscribersMax}"
										maxFractionDigits="3" /></td>
							</tr>
							<tr>
								<td>发布者数量</td>
								<td>${dailyStatsOfStatDate.publishersAvg}</td>
								<td>${dailyStatsOfYesterday[loop.count-1].publishersAvg}</td>
								<td><fmt:formatNumber type="percent"
										value="${(dailyStatsOfStatDate.publishersAvg-dailyStatsOfYesterday[loop.count-1].publishersAvg)/dailyStatsOfYesterday[loop.count-1].publishersAvg}"
										maxFractionDigits="3" /></td>
								<td>${dailyStatsOfStatDate.publishersMax}</td>
								<td>${dailyStatsOfYesterday[loop.count-1].publishersMax}</td>
								<td><fmt:formatNumber type="percent"
										value="${(dailyStatsOfStatDate.publishersMax-dailyStatsOfYesterday[loop.count-1].publishersMax)/dailyStatsOfYesterday[loop.count-1].publishersMax}"
										maxFractionDigits="3" /></td>
							</tr>
							<tr>
								<td>连接数数量</td>
								<td>${dailyStatsOfStatDate.connectionsAvg}</td>
								<td>${dailyStatsOfYesterday[loop.count-1].connectionsAvg}</td>
								<td><fmt:formatNumber type="percent"
										value="${(dailyStatsOfStatDate.connectionsAvg-dailyStatsOfYesterday[loop.count-1].connectionsAvg)/dailyStatsOfYesterday[loop.count-1].connectionsAvg}"
										maxFractionDigits="3" /></td>
								<td>${dailyStatsOfStatDate.connectionsMax}</td>
								<td>${dailyStatsOfYesterday[loop.count-1].connectionsMax}</td>
								<td><fmt:formatNumber type="percent"
										value="${(dailyStatsOfStatDate.connectionsMax-dailyStatsOfYesterday[loop.count-1].connectionsMax)/dailyStatsOfYesterday[loop.count-1].connectionsMax}"
										maxFractionDigits="3" /></td>
							</tr>

							<tr style="font-size: 16px;">
								<td rowspan="2"><b>数据推送</b></td>
								<td colspan="6"><b>推送情况</b></td>
							</tr>
							<tr>
								<td><b>当日成功次数</b></td>
								<td><b>昨日成功次数</b></td>
								<td><b>对比</b></td>
								<td><b>当日失败次数 <img style="cursor: pointer;" src="../resources/img/seeDetail.png"
										onclick="openDialog('<pre>${dailyStatsOfStatDate.pushErrorStat}</pre>')" /></b></td>
								<td><b>昨日失败次数 <img style="cursor: pointer;" src="../resources/img/seeDetail.png"
										onclick="openDialog('<pre>${fn:replace(dailyStatsOfYesterday[loop.count-1].pushErrorStat,',', '<br>')}</pre>')" /></b></td>
								<td><b>对比</b></td>
							</tr>
							<tr>
								<td>非持久</td>
								<td>${dailyStatsOfStatDate.nonPersistSuccessPushTimes}</td>
								<td>${dailyStatsOfYesterday[loop.count-1].nonPersistSuccessPushTimes}</td>
								<td><fmt:formatNumber type="percent"
										value="${(dailyStatsOfStatDate.nonPersistSuccessPushTimes-dailyStatsOfYesterday[loop.count-1].nonPersistSuccessPushTimes)/dailyStatsOfYesterday[loop.count-1].nonPersistSuccessPushTimes}"
										maxFractionDigits="3" /></td>
								<td>${dailyStatsOfStatDate.nonPersistErrorPushTimes}</td>
								<td>${dailyStatsOfYesterday[loop.count-1].nonPersistErrorPushTimes}</td>
								<td><fmt:formatNumber type="percent"
										value="${(dailyStatsOfStatDate.nonPersistErrorPushTimes-dailyStatsOfYesterday[loop.count-1].nonPersistErrorPushTimes)/dailyStatsOfYesterday[loop.count-1].nonPersistErrorPushTimes}"
										maxFractionDigits="3" /></td>
							</tr>
							<tr>
								<td>持久</td>
								<td>${dailyStatsOfStatDate.persistSuccessPushTimes}</td>
								<td>${dailyStatsOfYesterday[loop.count-1].persistSuccessPushTimes}</td>
								<td><fmt:formatNumber type="percent"
										value="${(dailyStatsOfStatDate.persistSuccessPushTimes-dailyStatsOfYesterday[loop.count-1].persistSuccessPushTimes)/dailyStatsOfYesterday[loop.count-1].persistSuccessPushTimes}"
										maxFractionDigits="3" /></td>
								<td>${dailyStatsOfStatDate.persistErrorPushTimes}</td>
								<td>${dailyStatsOfYesterday[loop.count-1].persistErrorPushTimes}</td>
								<td><fmt:formatNumber type="percent"
										value="${(dailyStatsOfStatDate.persistErrorPushTimes-dailyStatsOfYesterday[loop.count-1].persistErrorPushTimes)/dailyStatsOfYesterday[loop.count-1].persistErrorPushTimes}"
										maxFractionDigits="3" /></td>
							</tr>


						</table>




						<br>
					</c:forEach>

				</div>
			</div>

			<jsp:include page="/page/common/menu.jsp">
				<jsp:param name="select" value='dailyStat' />
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



	<SCRIPT type=text/javascript>
		function NeatDialog(sHTML, sTitle, bCancel) {
			window.neatDialog = null;
			this.elt = null;
			if (document.createElement && document.getElementById) {
				var dg = document.createElement("div");
				dg.className = "neat-dialog";
				if (sTitle)
					sHTML = '<div class="neat-dialog-title">'
							+ sTitle
							+ ((bCancel) ? '<img src="x.gif" alt="Cancel" class="nd-cancel" />'
									: '') + '</div>\n' + sHTML;
				dg.innerHTML = sHTML;
				var dbg = document.createElement("div");
				dbg.id = "nd-bdg";
				dbg.className = "neat-dialog-bg";
				var dgc = document.createElement("div");
				dgc.className = "neat-dialog-cont";
				dgc.appendChild(dbg);
				dgc.appendChild(dg);
				if (document.body.offsetLeft > 0)
					dgc.style.marginLeft = document.body.offsetLeft + "px";
				document.body.appendChild(dgc);
				if (bCancel)
					document.getElementById("nd-cancel").onclick = function() {
						window.neatDialog.close();
					};
				this.elt = dgc;
				window.neatDialog = this;
			}
		}
		NeatDialog.prototype.close = function() {
			if (this.elt) {
				this.elt.style.display = "none";
				this.elt.parentNode.removeChild(this.elt);
			}
			window.neatDialog = null;
		}

		function openDialog(content) {
			var sHTML = '<p><button onclick="window.neatDialog.close()">关闭</button></p>'
					+ content
					+ '<p><button onclick="window.neatDialog.close()">关闭</button></p>';
			new NeatDialog(sHTML, "<b>出错客户端TOP10</b>", false);

		}
	</SCRIPT>
















</body>
</html>
