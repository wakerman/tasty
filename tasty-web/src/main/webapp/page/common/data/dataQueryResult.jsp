<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp"%>
<c:choose>
	<c:when test="${not empty datas}">
		<table class="tablehover">
			<thead>
				<tr>
					<th width="60%"><a href="#">DataId</a></th>
					<th width="15%"><a href="#">GroupId</a></th>
					<th width="10%"><a href="#">isPersist</a></th>
					<th width="5%"><a href="#">数量</a></th>
					<th width="10%"><a href="#">行为</a></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${datas}">
					<tr>
						<td title="${item.dataId}" style="text-align: left;"><a href="${baseUrl}/search/query.html?dataId=${item.dataId}&groupId=${item.groupId}">${item.dataId}</a></td>
						<td title="${item.groupId}">${item.groupId}</td>
						<td title="${item.persist}">${item.persist}</td>
						<td>${item.dataSize}</td>
						<td><a href="${baseUrl}/data_mgr/detail.html?dataId=${item.dataId}&groupId=${item.groupId}" class="nyroModal"
							title="查看数据"><img src="${baseUrl}/resources/img/icons/magnifier.png" /></a> <a
							href="${baseUrl}/pub_mgr.html?dataId=${item.dataId}&groupId=${item.groupId}" title="查询关联发布者"><img
								src="${baseUrl}/resources/img/icons/user.png" /></a> <a
							href="${baseUrl}/sub_mgr.html?dataId=${item.dataId}&groupId=${item.groupId}" title="查询关联订阅者"><img
								src="${baseUrl}/resources/img/icons/user_orange.png" /></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<jsp:include page="/page/common/pager.jsp">
			<jsp:param value="${totalCount}" name="totalCount" />
			<jsp:param value="${baseUrl}/${pageName}" name="url" />
			<jsp:param value="${pageSize}" name="pageSize" />
			<jsp:param value="20" name="maxPageItems" />
			<jsp:param value="${dataId}" name="dataId" />
			<jsp:param value="${groupId}" name="groupId" />
			<jsp:param value="${like}" name="like" />
		</jsp:include>

	</c:when>
	<c:otherwise>
		<div class="error">没有符合你指定条件的数据</div>
	</c:otherwise>
</c:choose>