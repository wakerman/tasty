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
	<div id="wrapper">
		<div id="content">
			<div id="box">
				<h3>为用户 ${currentUser.userName} 添加DataId的权限</h3>
				<div id="result" align="center" style="color:red;font-size:18pt;margin:12px 0 0 0;">${message}</div>
				<form action="${baseUrl}/user/dataid/add.html" method="post">
					<input type="hidden" id="userId" name="userId" value="${currentUser.id}"/>
					<table class="publish">
						<tr>
							<td width="20%" align="center">DataId:</td>
							<td width="80%" style="text-align:left;" >
								<input type="text" size="87" name="dataId" id="dataId" width="100%" value="${dataId }"/>
							</td>
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
	</div>
	</div>
</body>
</html>