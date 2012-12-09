<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp" %>
<html>
<head>
	<jsp:include page="/page/common/css-js-sources.jsp">
		<jsp:param name="baseUrl" value="${baseUrl}"/>
	</jsp:include>
	<style type="text/css">
		tbody tr:hover{
			background: #FFFFFF;
		}
	</style>
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
			<h3>添加资源</h3>
					<div id="result" align="center" style="color:red;font-size:18pt;margin:12px 0 0 0;">${message}</div>
					<form action="${baseUrl}/function/add.html" method="post">
						<table class="publish">
							<tr>
								<td width="20%" align="center">Name:</td>
								<td width="80%" style="text-align:left;" ><input type="text" size="87" name="name" id="name"
									width="100%" value="${name}"></input></td>
							</tr>
							<tr>
								<td width="20%" align="center">所属模块:</td>
								<td width="80%" style="text-align:left;" >
									<select id="moduleId" name="moduleId">
										<c:forEach items="${modules}" var="module">
											<option value="${module.id}" <c:if test="${moduleId == module.id}">selected="selected"</c:if>>${module.name}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td width="20%" align="center">URL:</td>
								<td width="80%" style="text-align:left;" ><input type="text" size="87" name="url" id="url"
									width="100%" value="${url}"></input></td>
							</tr>
							<tr>
								<td width="20%" align="center">是否可用：</td>
								<td style="text-align:left;"><input type="text" size="87" name="active" id="active" width="80%"
									value="${active }"></input></td>
							</tr>
							<tr>
								<td width="20%" align="center">是否权限验证:</td>
								<td style="text-align:left;"><input type="text" size="87" name="needPermission" id="needPermission" width="80%"
									value="${needPermission }"></input></td>
							</tr>
							<tr>
								<td width="20%" align="center"></td>
								<td>
									<input style="margin:0 50px 0 50px;width:100px;" type="submit" value="Save" />
									<input style="margin:0 50px 0 50px;width:100px;" type="reset"  value="Reset" />
								</td>
							</tr>
						</table>
					</form>
			</div>
		</div>
		
		<jsp:include page="/page/common/menu.jsp">
			<jsp:param name="select" value='publish_data'/>
		</jsp:include>

	</div>
	<%@include file="/page/common/footer.jsp" %>
	</div>
</body>
</html>