<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp" %>
<html>
	<head>
		<jsp:include page="/page/common/css-js-sources.jsp">
			<jsp:param name="baseUrl" value="${baseUrl}"/>
		</jsp:include>
		<script type="text/javascript">
			$("document").ready(function(){
				$($("input[name='permission_checkbox']")).each(function(){
					$(this).click(function(){
						var requesturl;
						var username = $.trim($("#userName").text());
						var userId = $("#user").val();
						var functionId = this.id;
						var baseurl = $("#baseurl").val();
						if($(this).attr("checked")==true){
							requesturl = baseurl + "/user/permission/add.html";
						}else{
							requesturl = baseurl + "/user/permission/del.html";
						}
						$.ajax({
							   type: "GET",
							   url: requesturl,
							   data: "userId="+userId+"&functionId="+functionId,
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
					<jsp:param value="data" name="select"/>
				</jsp:include>
		        <div id="wrapper">
					<div id="content">
		       			<div id="box">
		                	<h3>给用户    <span id="userName">${currentUser.userName}</span>  授予权限</h3>
		                	<input id="user" type="hidden" value="${currentUser.id}"/>
		                    <table class="search_list">
								<thead>
										<tr>
			                            	<th width="20%"><a href="#">模&nbsp;&nbsp;块</a></th>
			                            	<th width="80%"><a href="#">功&nbsp;&nbsp;能</a></th>
			                            </tr>
								</thead>
								<tbody>
									<c:forEach items="${modules}" var="module">
										<tr>
											<td width="20%">
												<a href="${baseUrl}/module/function.html?moduleId=${module.id}">${module.name}</a>
											</td>
											<td width="80%" style="text-align:left;">&nbsp;&nbsp;
											    <c:forEach var="function" items="${module.functions}">
													<c:forEach items="${currentUser.permissions}" var="permission">
														<c:if test="${permission eq function.url}">
															<c:set var="check" value="true"/>
														</c:if>
													</c:forEach>
													<input id="${function.id}" name="permission_checkbox" type="checkbox" style="margin:2px 0 0 0" <c:if test="${check}">checked="checked"</c:if>/>&nbsp;${function.name} &nbsp;&nbsp;&nbsp;&nbsp;
												 </c:forEach>
											</td>
										</tr>
									</c:forEach>
								</tbody>
						   </table>

						   <div style="text-align:right;background:#FFFFFF;border-top:1px solid #FFFFFF;
				                    	border-left:1px solid #FFFFFF;border-right:1px solid #FFFFFF;padding:0 10px 0 0;">
				                <a href="${baseUrl}/user/dataid.html?userId=${currentUser.id}" class="nyroModal">添加DataId</a>
				           </div>
						   	<table class="search_list">
								<thead>
										<tr>
			                            	<th width="10%"><a href="#">序&nbsp;&nbsp;号</a></th>
			                            	<th width="70%"><a href="#">DataId</a></th>
			                            	<th width="20%"><a href="#">操&nbsp;&nbsp;作</a></th>
			                            </tr>
								</thead>
								<tbody>
									<c:forEach items="${currentUser.dataids}" var="dataId" varStatus="status">
										<tr>
											<td>${status.count}</td>
											<td>${dataId}</td>
											<td> <a href="${baseUrl}/user/dataid/del.html?userId=${currentUser.id}&dataId=${dataId}">删&nbsp;&nbsp;除</a></td>
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