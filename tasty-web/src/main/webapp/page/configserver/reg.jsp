<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp" %>
<html>
<head>
	<jsp:include page="/page/common/css-js-sources.jsp"/>
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
			<h3>注册</h3>
				<c:if test="${not empty message}">
					<div id="result" class="top-error">${message}</div>
				</c:if>
					<div id="result" class="tips">请使用花名拼音进行注册</div>
					<form action="${baseUrl}/reg.html" method="post">
						<table class="publish">
							<tr height="40px">
								<td width="20%" align="center">用户名:</td>
								<td width="80%" style="text-align:left;" ><input style="height: 20px;" type="text" size="87" name="userName" id="userName"
									width="100%" value="${userName }"></input></td>
							</tr>
							<tr height="40px">
								<td width="20%" align="center">密码:</td>
								<td style="text-align:left;"><input style="height: 20px;" type="password" size="87" name="password" id="password" width="100%"
									value="${password }"></input></td>
							</tr>
							<tr height="40px">
								<td width="20%" align="center"></td>
								<td>
									<input style="margin:0 50px 0 50px;width:100px;height: 30px;" type="submit" value="注册" />
									<input style="margin:0 50px 0 50px;width:100px;height: 30px;" type="reset"  value="重置" />
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