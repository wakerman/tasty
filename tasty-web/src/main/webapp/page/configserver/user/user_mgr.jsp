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
					<jsp:param value="server" name="select"/>
				</jsp:include>
		        <div id="wrapper">
					<div id="content">
		       			<div id="box">
		                	<h3>用户权限管理</h3>
		                    <c:choose>
			                    <c:when test="${not empty users}">
				                    <table class="search_list">
										<thead>
												<tr>
					                            	<th width="10%"><a href="#">userId</a></th>
					                            	<th width="40%"><a href="#">userName</a></th>
					                            	<th width="50%"><a href="#">操&nbsp;&nbsp;作</a></th>
					                            </tr>
										</thead>
										<tbody>
										<c:forEach items="${users}" var="user">
											<tr>
												<td>${user.id}</td>
												<td>${user.userName}</td>
												<td>
													<a href="${baseUrl}/user/role.html?userId=${user.id}">授予角色</a>&nbsp;&nbsp;&nbsp;&nbsp;
													<a href="${baseUrl}/user/group.html?userId=${user.id}">授予组</a>&nbsp;&nbsp;&nbsp;&nbsp;
													<a href="${baseUrl}/user/permission.html?userId=${user.id}">授予权限</a>
												</td>
											</tr>
										</c:forEach>
										</tbody>
								   </table>								
								<jsp:include page="/page/common/pager.jsp">
									<jsp:param value="${totalCount}" name="totalCount"/>
									<jsp:param value="{baseUrl}/user/index.html" name="url"/>
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
			<jsp:param name="select" value='auth'/>
		</jsp:include>
		</div>
		<%@include file="/page/common/footer.jsp" %>
		</div>
	</body>
</html>