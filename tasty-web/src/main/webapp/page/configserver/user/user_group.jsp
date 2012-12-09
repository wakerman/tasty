<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp" %>
<html>
	<head>
		<jsp:include page="/page/common/css-js-sources.jsp">
			<jsp:param name="baseUrl" value="${baseUrl}"/>
		</jsp:include>
		<script type="text/javascript">
			$("document").ready(function(){
				$($("input[name='role_checkbox']")).each(function(){
					$(this).click(function(){
						var requesturl;
						var userId = $.trim($("#user").val());
						var groupId = this.id;
						var baseurl = $("#baseurl").val();
						if($(this).attr("checked")==true){
							requesturl = baseurl + "user/group/add.html";
						}else{
							requesturl = baseurl + "user/group/del.html";
						}
						$.ajax({
							   type: "GET",
							   url: requesturl,
							   data: "userId="+userId+"&groupId="+groupId,
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
		                	<h3>给用户    <span id="userName">${currentUser.userName}</span>  授予组</h3>
		                	<input id="user" type="hidden" value="${currentUser.id}"/>
		                    <c:choose>
			                    <c:when test="${not empty groups}">
				                    <table class="search_list">
										<tbody>
											<tr>
												<td colspan="2" style="background:green;">系统资源</td>
											</tr>
											<c:forEach items="${groups}" var="group">
												<c:forEach items="${currentUser.groups}" var="userGroup">
													<c:if test="${group.id eq userGroup.id}">
														<c:set var="check" value="true"/>
													</c:if>
												</c:forEach>
												<tr>
													<td width="10%"><input id="${group.id}" name="role_checkbox" type="checkbox" <c:if test="${check}">checked="checked"</c:if> /></td>
													<td width="40%">${group.groupName}</td>
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
			<jsp:param name="select" value='auth'/>
		</jsp:include>
		</div>
		<%@include file="/page/common/footer.jsp" %>
		</div>
	</body>
</html>