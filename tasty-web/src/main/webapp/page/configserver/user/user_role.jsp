<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp" %>
<html>
	<head>
		<jsp:include page="/page/common/css-js-sources.jsp"/>
		<script type="text/javascript">
			$("document").ready(function(){
				$($("input[name='role_checkbox']")).each(function(){
					$(this).click(function(){
						var requesturl;
						var username = $.trim($("#userName").text());
						var roleId = this.id;
						var baseurl = $("#baseurl").val();
						if($(this).attr("checked")==true){
							requesturl = baseurl + "user/role/add.html";
						}else{
							requesturl = baseurl + "user/role/del.html";
						}
						$.ajax({
							   type: "GET",
							   url: requesturl,
							   data: "userName="+username+"&roleId="+roleId,
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
					<jsp:param name="userName" value="${userName}"/>
					<jsp:param value="server" name="select"/>
				</jsp:include>
		        <div id="wrapper">
					<div id="content">
		       			<div id="box">
		                	<h3>给用户    <span id="userName">${currentUser.userName}</span>  授予角色</h3>
		                    <c:choose>
			                    <c:when test="${not empty roles}">
				                    <table class="search_list">
										<tbody>
											<c:forEach items="${roles}" var="role">
												<c:forEach items="${currentUser.roles}" var="userRole">
													<c:if test="${role.id eq userRole.id}">
														<c:set var="check" value="true"/>
													</c:if>
												</c:forEach>											
												<tr>
													<td width="10%"><input id="${role.id}" name="role_checkbox" type="checkbox" <c:if test="${check}">checked="checked"</c:if>/></td>
													<td width="40%">${role.name}</td>
												</tr>
											</c:forEach>
										</tbody>
								   </table>
								<jsp:include page="/page/common/pager.jsp">
									<jsp:param value="${totalCount}" name="totalCount"/>
									<jsp:param value="pub_mgr/index.html" name="url"/>
									<jsp:param value="20" name="pageSize"/>
									<jsp:param value="20" name="maxPageItems"/>
									<jsp:param value="${userId}" name="userId"/>
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