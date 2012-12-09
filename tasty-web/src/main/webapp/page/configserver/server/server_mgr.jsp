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
			<h3>Server管理</h3>
				<form action="publish/save.html" method="post">
					<table class="publish">
						<tr>
							<td width="20%" align="center">DataId:</td>
							<td width="80%" style="text-align:left;" ><input type="text" size="87" name="dataId" id="dataId"
								width="100%" value="${dataId }"></input></td>
						</tr>
						<tr>
							<td width="20%" align="center">DatumId:</td>
							<td style="text-align:left;"><input type="text" size="87" name="datumId" id="datumId" width="80%"
								value="${datumId }"></input></td>
						</tr>
						<tr>
							<td width="20%" align="center">Group:</td>
							<td style="text-align:left;"><input type="text" size="87" name="groupId" id="groupId" width="80%"
								value="${groupId }"></input></td>
						</tr>
						<tr>
							<td width="20%" align="center">Data:</td>
							<td><textarea id="data" name="content" rows="15" cols="77">${content}</textarea></td>
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