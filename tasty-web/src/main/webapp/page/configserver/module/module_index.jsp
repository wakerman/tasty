<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp" %>
<html>
	<head>
		<jsp:include page="/page/common/css-js-sources.jsp">
			<jsp:param name="baseUrl" value="${baseUrl}"/>
		</jsp:include>
	</head>

	<body>
		<div id="container">
				<jsp:include page="/page/common/header.jsp">
					<jsp:param name="userName" value="${userName}"/>
					<jsp:param value="data" name="select"/>
				</jsp:include>
		        <div id="wrapper">
					<div id="content">
		       			<div id="box">
		                	<h3>操作管理</h3>
		                    <c:choose>
			                    <c:when test="${not empty modules}">
				                    <table class="search_list">
				                    	<thead>
				                    		<tr >
				                    			<td colspan="3" style="text-align:right;background:#FFFFFF;border-top:1px solid #FFFFFF;
				                    										border-left:1px solid #FFFFFF;border-right:1px solid #FFFFFF;padding:0 10px 0 0;">
				                    				<a href="${baseurl}module/add.html">添加资源</a>
				                    			</td>
				                    		</tr>
				                    		<tr>
				                    			<th width="20%">Id</th>
				                    			<th width="40%">Name</th>
				                    			<th width="40%">操作</th>
				                    		</tr>
				                    	</thead>
										<tbody>
											<c:forEach items="${modules}" var="module">
												<tr>
													<td>${module.id}</td>
													<td>${module.name}</td>
													<td>
														<a href="${baseUrl}/module/function.html?moduleId=${module.id}">功能列表</a>
													</td>
												</tr>
											</c:forEach>
										</tbody>
								   </table>
								<jsp:include page="/page/common/pager.jsp">
									<jsp:param value="${totalCount}" name="totalCount"/>
									<jsp:param value="pub_mgr/index.html" name="url"/>
									<jsp:param value="20" name="pageSize"/>
									<jsp:param value="20" name="maxPageItems"/>
									<jsp:param value="${dataId}" name="dataId"/>
									<jsp:param value="${hostId}" name="hostId"/>
								</jsp:include>
			                    </c:when>
			                    <c:otherwise>
			                  		<c:choose>
										<c:when test="${not empty dataId}">
			                 	 			<div align="center" style="color:red;font-size:18pt">没有符合你指定条件的数据</div>
			                 	 		</c:when>
			                 	 	</c:choose>
			                    </c:otherwise>
		                    </c:choose>
		                </div>
					</div>
		            
		<jsp:include page="/page/common/menu.jsp">
			<jsp:param name="select" value='pub_mgr'/>
		</jsp:include>
		</div>
		<%@include file="/page/common/footer.jsp" %>
		</div>
	</body>
</html>