<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp" %>
<html>

	<head>
		<jsp:include page="/page/common/css-js-sources.jsp"/>
	</head>

	<body>
		<div id="container">
			<jsp:include page="/page/common/header.jsp" flush="true">
				<jsp:param value="index" name="select"/>
			</jsp:include>
	        <div id="wrapper">
	            <div id="content">
				<div id="infowrap">
					<div id="infobox">
						<h3 class="reallynow"><span>Server当前数据</span>
							<span><a href="${baseUrl}/trendOfRealTimeStat.html" class="add">查看趋势</a></span>
						</h3>
						<div id='ServerCurrentStatus' align='center' style="width:100%;margin:0px 0 0px 0;"></div>
					</div>
					
					<script type='text/javascript'>
						var strURL = "report/server_current_status_report.html";
						var chart_SalesByYear = new FusionCharts('fusioncharts/MSColumn3D.swf', "ChartId", "360", "250", "0", "0");
						strURL = escape(strURL);
						chart_SalesByYear.setDataURL(strURL);
						chart_SalesByYear.render("ServerCurrentStatus");
					</script>
									
					<div id="infobox" class="margin-left">
						<h3 class="reallynow"><span>Server健康度</span>
							<a href="${baseUrl}/push_detail.html" class="add">查看大图</a>
						</h3>
						<div id='ServerHealth' align='center' style="width:100%;margin:5px 0 5px 0;"></div>
					</div>
					<script type='text/javascript'>
						var strURL = "report/server_health_report.html";
						var chart_SalesByYear = new FusionCharts('fusioncharts/DragNode.swf', "ChartId", "350", "250", "0", "0");
						strURL = escape(strURL);
						chart_SalesByYear.setDataURL(strURL);
						chart_SalesByYear.render("ServerHealth");
					</script>				
	        		<div id="infobox" style="width:100%;">
	                    <h3 class="reallynow">
	                        <span>推送</span>
							<a href="${baseUrl}/push_detail.html" class="add">查看详情</a>
	                        <br />
	                    </h3>
	                    <div id='PushStatusDiv' align='center' style="width:100%;margin:5px 0 5px 0;"></div>
					</div>
					<div id="infobox" style="width:100%;">
						<h3 class="reallynow"><span>注册&amp;发布</span>
							<a href="${baseUrl}/push_detail.html" class="add">查看大图</a>
						</h3>
						<div id='MemStatusDiv' align='center' style="width:100%;margin:5px 0 5px 0;"></div>
					</div>
					<div id="infobox">
						<h3 class="reallynow"><span>运行状态</span>
						<a href="${baseUrl}/push_detail.html">更多</a>
						</h3>
	         			<div id='PushFalseTopListDiv' align='center' style="margin:5px 0 5px 0;"></div>
					  </div>			  
					  <div id="infobox" class="margin-left">
						<h3 class="reallynow"><span>客户端注册数量排行</span>
							<a href="${baseUrl}/push_timeout.html">更多</a>
						</h3>
						<div id='RegisterTopListDiv' align='center' style="margin:5px 0 5px 0;"></div>
					  </div>
					</div>
				</div>
	        <jsp:include page="/page/common/menu.jsp">
				<jsp:param name="select" value='index'/>
			</jsp:include>
	    </div>
		<%@include file="/page/common/footer.jsp" %>
	</div>
	</body>
</html>
