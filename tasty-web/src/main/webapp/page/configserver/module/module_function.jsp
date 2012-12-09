<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp" %>
<html>
	<head>
		<jsp:include page="/page/common/css-js-sources.jsp"/>
	<script type="text/javascript">
			$("document").ready(function(){
				$($("input[name='active_checkbox']")).each(function(){
					$(this).click(function(){
						var id = this.id.trim();
						var moduleId = id.split("-")[0];
						var functionId = id.split("-")[1];
						var baseurl = $("#baseurl").val();
						var value = $(this).attr("checked");
						var requesturl = baseurl + '/function/update.html';
						$.ajax({
							   type: "GET",
							   url: requesturl,
							   data: 'moduleId='+moduleId+'&functionId='+functionId+'&active='+value,
							   success: function(msg){
							   }
							});
					});
				});

				$($("input[name='permission_checkbox']")).each(function(){
					$(this).click(function(){
						var id = this.id.trim();
						var moduleId = id.split("-")[0];
						var functionId = id.split("-")[1];
						var baseurl = $("#baseurl").val();
						var value = $(this).attr("checked");
						var requesturl = baseurl + '/function/update.html';
						$.ajax({
							   type: "GET",
							   url: requesturl,
							   data: 'moduleId='+moduleId+'&functionId='+functionId+'&needPermission='+value,
							   success: function(msg){
							   }
							});
					});
				});
			});
		</script>
	</head>

	<body>
		<div id="container">
				<jsp:include page="/page/common/header.jsp">
					<jsp:param value="server" name="select"/>
				</jsp:include>
		        <div id="wrapper">
					<div id="content">
		       			<div id="box">
		                	<h3>模块下的功能管理</h3>
		                    <c:choose>
			                    <c:when test="${not empty module}">
				                    <table>
				                    	<thead>
				                    		<tr >
				                    			<td style="text-align:left;background:#9aba58;border-top:1px solid #FFFFFF;
				                    										border-left:1px solid #FFFFFF;border-right:1px solid #FFFFFF;padding:0 0px 0 0;">${module.name}</td>
				                    			<td colspan="5" style="text-align:right;background:#9aba58;border-top:1px solid #FFFFFF;
				                    										border-left:1px solid #FFFFFF;border-right:1px solid #FFFFFF;padding:0 10px 0 0;">
				                    				<a href="${baseUrl}/function/add.html?moduleId=${module.id}">添加功能</a>
				                    			</td>
				                    		</tr>
				                    		<tr>
				                    			<th width="7%">Id</th>
				                    			<th width="30%">Name</th>
				                    			<th width="5%">可用</th>
				                    			<th width="8%">权限验证</th>
				                    			<th width="45%">URL</th>
				                    			<th width="5%">操作</th>
				                    		</tr>
				                    	</thead>
										<tbody>
											<c:forEach items="${module.functions}" var="function">
												<tr>
													<td>${function.id}</td>
													<td>${function.name}</td>
													<td>
														<input id="${module.id}-${function.id}" type="checkbox" name="active_checkbox"
															<c:if test="${function.active}">checked="checked"</c:if>
														/>
													</td>
													<td>
														<input id="${module.id}-${function.id}" type="checkbox" name="permission_checkbox"
															<c:if test="${function.needPermission}">checked="checked"</c:if>
														/>
													</td>
													<td>${function.url}</td>
													<td>
														<a href="${baseUrl}/function/del.html?moduleId=${module.id}&functionId=${function.id}">删  除</a>
													</td>
												</tr>
											</c:forEach>
										</tbody>
								   </table>
								<jsp:include page="/page/common/pager.jsp">
									<jsp:param value="${totalCount}" name="totalCount"/>
									<jsp:param value="${baseUrl}/module/function.html" name="url"/>
									<jsp:param value="20" name="pageSize"/>
									<jsp:param value="20" name="maxPageItems"/>
									<jsp:param value="${module.id}" name="moduleId"/>
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