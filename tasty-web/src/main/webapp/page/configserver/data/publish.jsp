<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp" %>
<html>
<head>
	<jsp:include page="/page/common/css-js-sources.jsp"/>
</head>

<body>
<div id="container">

	<jsp:include page="/page/common/header.jsp" flush="true">
		<jsp:param value="data" name="select"/>
	</jsp:include>
	<div id="wrapper">
		<div id="content">
			<div id="box">
			<h3>发布数据</h3>
			<c:if test="${not empty message}">
				<div id="result" class="top-error">${message}</div>
			</c:if>
					<form action="${baseUrl}/publish.html" method="post" id="form">
						<table>
							<tr>
								<td width="20%" align="center">DataId:</td>
								<td width="80%" style="text-align:left;" ><input type="text" style="margin-bottom:0px;width:97%;" name="dataId" id="dataId"
									width="100%" value="${dataId }"></input></td>
							</tr>
							<tr>
								<td width="20%" align="center">DatumId:</td>
								<td style="text-align:left;"><input type="text" style="margin-bottom:0px;width:97%;" name="datumId" id="datumId" width="80%"
									value="${datumId }"></input></td>
							</tr>
							<tr>
								<td width="20%" align="center">Group:</td>
								<td style="text-align:left;"><input type="text" style="margin-bottom:0px;width:97%;" name="groupId" id="groupId" width="80%"
									value="${groupId }"></input></td>
							</tr>
							<tr>
								<td width="20%" align="center">数据类型</td>
								<td style="text-align:left;">
									<select name="isProperties" id="isProperties">
				      					<option value="0" selected="selected">String</option>
				      					<option value="1">Properties</option>
				      					<!-- 发布数据格式校验，增加下拉列表选项  by leiwen -->
				      					<option value="2">Xml</option>
				      				</select>
								</td>
							</tr>							
							<tr>
								<td width="20%" align="center">Data:</td>
								<td><textarea id="data" name="content" rows="15" cols="77" style="margin-bottom:0px">${content}</textarea></td>
							</tr>
							<tr>
								<td width="20%" align="center"></td>
								<td>
									<input id="searchButton" type="submit" value="Save" />
									<input id="resetButton" type="reset"  value="Reset" />
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
