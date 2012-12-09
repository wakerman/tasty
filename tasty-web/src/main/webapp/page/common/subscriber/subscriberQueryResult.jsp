<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp"%>

<c:choose>
			    <c:when test="${not empty dataIdListOfSubscriber}">
                	<table class="tablehover">
						<thead>
							<tr>
                            	<th width="55%"><a href="#">DataId</a></th>
                            	<th width="15%"><a href="#">GroupId</a></th>
                                <th width="20%">HostId</th>
								<th width="10%"><a href="#">行为</a></th>
                            </tr>
						</thead>
						<tbody>
							  <c:forEach var="item" items="${dataIdListOfSubscriber}">
									<tr>
		                           		<td title="${item.dataId}" style="text-align:left;">
		                           			${item.dataId}
					                    </td>
			                           	<td title="${item.groupId}" >${item.groupId}</td>
			                            <td title="${item.hostId}" style="text-align:left;">${item.hostId}</td>
			                            <td>
											<a href="${baseUrl}/data_mgr.html?dataId=${item.dataId }&groupId=${item.groupId}" title="查看数据"><img src="${baseUrl}/resources/img/icons/magnifier.png" /></a>
											<a href="${baseUrl}/pub_mgr.html?dataId=${item.dataId}&groupId=${item.groupId}" title="查询发布者"><img src="${baseUrl}/resources/img/icons/user.png" /></a>
											<a href="${baseUrl}/move_group.html?dataId=${item.dataId}&oldGroup=${item.groupId}&ipPattern=${item.hostId}&type=sub" title="发布者归组"><img src="${baseUrl}/resources/img/icons/application_side_expand.png" /></a>
										</td>
			                         </tr>
								</c:forEach>
							</tbody>
					 </table>
					
					 <jsp:include page="/page/common/pager.jsp">
							<jsp:param value="${totalCountOfSubscriber}" name="totalCount"/>
							<jsp:param value="${baseUrl}/sub_mgr.html" name="url"/>
							<jsp:param value="20" name="pageSize"/>
							<jsp:param value="${dataId}" name="dataId"/>
							<jsp:param value="${hostId}" name="hostId"/>
							<jsp:param name="maxPageItems" value="${maxPageItemsOfSubscriber}"/>
							<jsp:param value="${like}" name="like"/>
					  </jsp:include>
                  	</c:when>
		            <c:otherwise>
						<div class="error">没有符合你指定条件的数据</div>
		             </c:otherwise>
		           </c:choose>
