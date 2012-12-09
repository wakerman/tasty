<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="include.jsp"%>
<div id="sidebar">
	<ul>
		<li><h3>
				<a href="${baseUrl}/index.html" class="house">概况</a>
			</h3>
			<ul>
				<li><a href="${baseUrl}/push_detail.html" class="color_swatch"
					<c:if test="${param.select eq 'state' }">style="font-weight:bold;"</c:if>>运行状态</a></li>
				<li><a href="${baseUrl}/push_detail.html" class="chart_bar"
					<c:if test="${param.select eq 'push_chart' }">style="font-weight:bold;"</c:if>>推送报表</a></li>
				<li><a href="${baseUrl}/push_detail.html" class="chart_curve"
					<c:if test="${param.select eq 'request_chart' }">style="font-weight:bold;"</c:if>>请求量报表</a></li>
				<li><a href="${baseUrl}/push_detail.html" class="modules"
					<c:if test="${param.select eq 'memory_chart' }">style="font-weight:bold;"</c:if>>内存报表</a></li>
				<li><a href="${baseUrl}/push_detail.html" class="shipping"
					<c:if test="${param.select eq 'system_load_chart' }">style="font-weight:bold;"</c:if>>系统负载报表</a></li>
				<li><a href="${baseUrl}/push_timeout.html" class="cart_error"
					<c:if test="${param.select eq 'push_timeout' }">style="font-weight:bold;"</c:if>>推送超时记录</a></li>
				<li><a href="${baseUrl}/push_timeout.html" class="bin_empty"
					<c:if test="${param.select eq 'push_null' }">style="font-weight:bold;"</c:if>>推空记录</a></li>
				<li><a href="${baseUrl}/push_timeout.html" class="chart_pie"
					<c:if test="${param.select eq 'client_reg_sort' }">style="font-weight:bold;"</c:if>>单机注册数量</a></li>
			</ul></li>
		<li><h3>
				<a href="${baseUrl}/data_mgr.html" class="coins">数据</a>
			</h3>
			<ul>
				<li><a href="${baseUrl}/data_mgr.html" class="package"
					<c:if test="${param.select == 'data_mgr' }">style="font-weight:bold;"</c:if>>${select}数据查询</a></li>
				<li><a href="${baseUrl}/publish.html" class="drive_go"
					<c:if test="${param.select eq 'publish_data' }">style="font-weight:bold;"</c:if>>发布数据</a></li>
				<li><a href="${baseUrl}/nonTextGroupList.html" class="package"
					<c:if test="${param.select == 'nonTextGroup' }">style="font-weight:bold;"</c:if>>NonTextGroup</a></li>
			</ul></li>

		<li><h3>
				<a href="${baseUrl}/data_mgr.html" class="coins">推送</a>
			</h3>
			<ul>
				<li><a href="${baseUrl}/pushRecordOfService.html"
					class="package"
					<c:if test="${param.select == 'pushRecordOfService' }">style="font-weight:bold;"</c:if>>${select}推送记录</a></li>
				<li><a href="${baseUrl}/sizeTrendOfPushRecord.html"
					class="package"
					<c:if test="${param.select == 'sizeTrendOfPushRecord' }">style="font-weight:bold;"</c:if>>${select}服务地址数量变化</a></li>
			</ul></li>

		<li><h3>
				<a href="${baseUrl}/data_mgr.html" class="coins">统计</a>
			</h3>
			<ul>
				<li><a href="${baseUrl}/stat/trendOfRealTimeStat.html"
					class="package"
					<c:if test="${param.select == 'trendOfRealTimeStat' }">style="font-weight:bold;"</c:if>>${select}实时趋势</a></li>
			</ul>

			<ul>
				<li><a href="${baseUrl}/stat/dailyStatPage.html"
					class="package"
					<c:if test="${param.select == 'dailyStat' }">style="font-weight:bold;"</c:if>>${select}每日统计</a></li>
			</ul>

			<ul>
				<li><a href="${baseUrl}/stat/machineStatePage.html"
					class="package"
					<c:if test="${param.select == 'machineStatePage' }">style="font-weight:bold;"</c:if>>${select}机器上下线情况</a></li>
			</ul></li>





		<!-- 
            <li><h3><a href="${baseUrl}/config/search.html" class="coins">Diamond管理</a></h3>
      			<ul>
                  <li><a href="${baseUrl}/config/search.html" class="package" <c:if test="${param.select == 'persistency_data_search' }">style="font-weight:bold;"</c:if>>数据查询</a></li>
				  <li><a href="${baseUrl}/group/list.html" class="drive_go" <c:if test="${param.select eq 'grouping' }">style="font-weight:bold;"</c:if>>分组管理</a></li>
				  <li><a href="${baseUrl}/count/getRefuseCount.html" class="drive_go" <c:if test="${param.select eq 'refuseCount' }">style="font-weight:bold;"</c:if>>拒接请求</a></li>
				  <li><a href="${baseUrl}/logstatic/searchDataId.html" class="drive_go" <c:if test="${param.select eq 'logsearch' }">style="font-weight:bold;"</c:if>>推送查询</a></li>
				  <li><a href="${baseUrl}/config/clientInfo.html" class="drive_go" <c:if test="${param.select eq 'clientInfo' }">style="font-weight:bold;"</c:if>>客户端版本信息统计</a></li>
				  <!-- <li><a href="${baseUrl}/logstatic/logTest.html" class="drive_go" <c:if test="${param.select eq 'log' }">style="font-weight:bold;"</c:if>>日志获取测试</a></li>
                </ul>
             </li>   
             -->
		<li><h3>
				<a href="${baseUrl}/help_center.html" class="user">帮助</a>
			</h3>
			<ul>
				<li><a href="${baseUrl}/help_center.html" class="search"
					<c:if test="${param.select eq 'help' }">style="font-weight:bold;"</c:if>>帮助中心</a></li>
				<li><a href="${baseUrl}/help_center.html" class="folder_table"
					<c:if test="${param.select eq 'feedback' }">style="font-weight:bold;"</c:if>>使用反馈</a></li>
			</ul></li>

		<li><h3>
				<a href="${baseUrl}/help_center.html" class="user">Administrator</a>
			</h3>
			<ul>
				<li><a href="${baseUrl}/admin/systemSettingsPage.html"
					class="search" <c:if test="${param.select eq 'systemsetting' }">style="font-weight:bold;"</c:if>>SystemSettings</a></li>
				<li><a href="${baseUrl}/weighting/weight_add.html"
					style="color: white;">添加权重</a></li>
			</ul></li>
	</ul>
</div>
