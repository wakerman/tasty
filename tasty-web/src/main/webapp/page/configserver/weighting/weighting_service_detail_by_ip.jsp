<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp" %>
<div id="detail">
	<div>
		<h3 style="margin:5px 0 0 5px;color:#FF5500;">
			IP : ${hostId} &nbsp;&nbsp;
		</h3>
	</div>
	<c:choose>
			<c:when test="${not empty services}">
					<table >
					    <thead>
					    	<tr>
					    		<th style="text-align: left;padding-left:10px;">服务名</th>
					    	</tr>
					    </thead>
						<tbody>
						<c:forEach var="item" items="${services}">
								<tr>
									<td width="100px" style="text-align: left;padding-left:10px;" >${item}</td>
								</tr>
						</c:forEach>
						</tbody>
					</table>
			</c:when>
			<c:otherwise>
				<h3 style="margin:5px 0 0 5px;color:red;">没有服务</h3>
			</c:otherwise>
	</c:choose>
</div>