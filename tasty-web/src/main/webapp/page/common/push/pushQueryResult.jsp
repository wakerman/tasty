<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp"%>
<c:choose>
	<c:when test="${not empty configServerPushRecords}">
&nbsp;&nbsp;注意,推送结果中已经过滤了所有ServiceVersion后缀为：<font color="red">ROUTING.RULE.diamondRealTime</font> 和 <font color="red">ROUTING.RULE</font> 的结果集
							<table class="tablehover">
			<thead>
				<tr>
					<th width="85"><a href="#">Client Ip</a></th>
					<th width="85"><a href="#">CS Ip</a></th>
					<th width="40"><a href="#">Size</a></th>
					<th width="70"><a href="#">persistFlag</a></th>
					<th width="90"><a href="#">ServiceVersion</a></th>
					<th width="90"><a href="#">ServiceGroup</a></th>
					<th width="60"><a href="#">Result</a></th>
					<th width="150"><a href="#">Time</a></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="configServerPushRecord" items="${configServerPushRecords}">
					<tr>
						<td title="${ configServerPushRecord.client }" style="text-align: left;">${ configServerPushRecord.client }</td>
						<td title="${ configServerPushRecord.csHost }">${ configServerPushRecord.csHost }</td>
						<td>${ configServerPushRecord.dataSize }</td>
						<td>${ configServerPushRecord.persistFlag }</td>
						<td>${ configServerPushRecord.serviceVersion }</td>
						<td>${ configServerPushRecord.serviceGroup }</td>
						<td>${ configServerPushRecord.result }</td>
						<td><fmt:formatDate value="${ configServerPushRecord.time }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:when>
	<c:otherwise>
		<div class="error">没有推送记录，请确认 DataId 和 Group 后进行搜索</div>
	</c:otherwise>
</c:choose>