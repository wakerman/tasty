<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp" %>
<html>
<head>
	<jsp:include page="/page/common/css-js-sources.jsp"/>
</head>

<body>
	<div id="container">
		<jsp:include page="/page/common/header.jsp">
			<jsp:param value="data" name="select"/>
		</jsp:include>
        <div id="wrapper">
			<div id="content">
       			<div id="box">
                	<h3>规则发布后的数据变化情况</h3>
                	<c:if test="${not empty message}">
						<div id="result" class="top-error">${message}</div>
					</c:if>
						<c:choose>
							<c:when test="${not empty services}">
					            <table class="tablehover">
										<thead>
											<tr>
										        <th width="50%"><a href="#">服务名</a></th>
										        <th width="15%"><a href="#">发布前</a></th>
										        <th width="15%"><a href="#">发布后</a></th>
												<th width="5%"><a href="#">详情</a></th>
										   </tr>
										</thead>
										<tbody>
											<c:forEach var="item" items="${services}">
												<tr>
									               	<td title="${item.service}" style="text-align:left;">${item.service}</td>
									               	<td title="${item.beforeServiceNum}">${item.beforeServiceNum}</td>
									               	<td title="${item.afterServiceNum}">${item.afterServiceNum}</td>
													<td>
														<a href="${baseUrl}/weighting/view_rule_affect_result.html?service=${item.service}" class="nyroModal" title="查看数据"><img src="${baseUrl}/resources/img/icons/magnifier.png" /></a>
													</td>
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
			</div>
		
		<jsp:include page="/page/common/menu.jsp">
			<jsp:param name="select" value='data_mgr'/>
		</jsp:include>
		
	</div>
	<%@include file="/page/common/footer.jsp" %>
</div>
</body>
</html>
