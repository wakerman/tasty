<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp" %>
<div id="detail">
	<c:choose>
			<c:when test="${not empty view}">
	            <table class="tablehover">
					<thead>
						<tr>
					        <th width="50%"><a href="#">发布前的获取的数据</a></th>
					   </tr>
					</thead>
					<tbody>
					  <c:forEach var="item" items="${view.beforeServices}">
						<tr>
			               	<td style="text-align:left;">${item}</td>
			            </tr>
			           </c:forEach>
					</tbody>
				</table>
	            <table class="tablehover">
					<thead>
						<tr>
					        <th width="50%"><a href="#">发布之后的获取的数据</a></th>
					   </tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${view.afterServices}">
							<tr>
				               	<td style="text-align:left;">${item}</td>
				            </tr>
			            </c:forEach>
					</tbody>
				</table>				
			</c:when>
			<c:otherwise>
				<h3 style="margin:5px 0 0 5px;color:red;">获取数据失败</h3>
			</c:otherwise>
	</c:choose>
</div>