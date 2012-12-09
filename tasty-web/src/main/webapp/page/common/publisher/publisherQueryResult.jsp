<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp"%>
<c:choose>
	<c:when test="${not empty dataIdListOfPublisher}">
		<table class="tablehover">
			<thead>
				<tr>
					<th width="50%"><a href="#">DataId</a></th>
					<th width="15%"><a href="#">GroupId</a></th>
					<th width="18%">HostId</th>
					<th width="8%">属性</th>
					<th width="9%"><a href="#">行为</a></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${dataIdListOfPublisher}">
					<tr>
						<td title="${item.dataId}" style="text-align: left;">${item.dataId}</td>
						<td title="${item.groupId}">${item.groupId}</td>
						<td title="${item.hostId}">${item.hostId}</td>
						<td title="${item.persistency}"><c:choose>
								<c:when test="${item.persistency}">持久</c:when>
								<c:otherwise>非持久</c:otherwise>
							</c:choose></td>
						<td><a
							href="${baseUrl}/data_mgr/pub_detail.html?dataId=${item.dataId}&groupId=${item.groupId}&hostId=${item.hostId}&datumId=${item.datumId}"
							class="nyroModal" title="查看数据"><img src="${baseUrl}/resources/img/icons/magnifier.png" /></a> <a
							href="${baseUrl}/sub_mgr.html?dataId=${item.dataId}&groupId=${item.groupId}" title="查询订阅者"><img
								src="${baseUrl}/resources/img/icons/user_orange.png" /></a> <a
							href="${baseUrl}/move_group.html?dataId=${item.dataId}&oldGroup=${item.groupId}&ipPattern=${item.hostId}&type=pub"
							title="订阅者归组"><img src="${baseUrl}/resources/img/icons/application_side_expand.png" /></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<jsp:include page="/page/common/pager.jsp">
			<jsp:param name="totalCount" value="${totalCountOfPublisher}" />
			<jsp:param value="${baseUrl}/pub_mgr.html" name="url" />
			<jsp:param value="20" name="pageSize" />
			<jsp:param value="20" name="maxPageItems" />
			<jsp:param value="${dataId}" name="dataId" />
			<jsp:param value="${hostId}" name="hostId" />
			<jsp:param value="${like}" name="like" />
		</jsp:include>
	</c:when>
	<c:otherwise>
		<div class="error">没有符合你指定条件的数据</div>
	</c:otherwise>
</c:choose>