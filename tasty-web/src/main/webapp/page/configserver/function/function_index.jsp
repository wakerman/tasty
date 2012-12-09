<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp" %>
<html>
	<head>
		<jsp:include page="/page/common/css-js-sources.jsp"/>
	</head>

	<body>
		<div id="container">
				<jsp:include page="/page/common/header.jsp">
					<jsp:param value="server" name="select"/>
				</jsp:include>
		        <div id="wrapper">
					<div id="content">
		       			<div id="box">
		                	<h3>资源管理</h3>
		                    <c:choose>
			                    <c:when test="${not empty functions}">
				                    <table class="search_list">
				                    	<thead>
				                    		<tr>
				                    			<th width="10%">Id</th>
				                    			<th width="30%">Name</th>
				                    			<th width="10%">可用</th>
				                    			<th width="10%">权限验证</th>
				                    			<th width="30%">URL</th>
				                    			<th width="10%">操作</th>
				                    		</tr>
				                    	</thead>
										<tbody>
											<c:forEach items="${functions}" var="function">
												<tr>
													<td>${function.id}</td>
													<td>${function.name}</td>
													<td>
														<input type="checkbox" 
															<c:if test="${function.active}">checked="checked"</c:if>
														/>
													</td>
													<td>
														<input type="checkbox" 
															<c:if test="${function.needPermission}">checked="checked"</c:if>
														/>
													</td>
													<td>${function.url}</td>
													<td>
														<a href="${baseUrl}/function/del.html?functionId=${function.id}">删 除</a>
													</td>
												</tr>
											</c:forEach>
										</tbody>
								   </table>
								<jsp:include page="/page/common/pager.jsp">
									<jsp:param value="${totalCount}" name="totalCount"/>
									<jsp:param value="${baseUrl}/function.html" name="url"/>
									<jsp:param value="20" name="pageSize"/>
									<jsp:param value="20" name="maxPageItems"/>
								</jsp:include>
			                    </c:when>
			                    <c:otherwise>
			                 	 	<div align="center" style="color:red;font-size:18pt">没有符合你指定条件的数据</div>
			                    </c:otherwise>
		                    </c:choose>
		                </div>
					</div>
		            
		<jsp:include page="/page/common/menu.jsp">
			<jsp:param name="select" value='auth'/>
		</jsp:include>
		</div>
		<%@include file="/page/common/footer.jsp" %>
		</div>
	</body>
</html>