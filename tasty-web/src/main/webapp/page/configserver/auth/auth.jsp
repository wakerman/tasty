<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp" %>
<html>
<head>
	<jsp:include page="/page/common/css-js-sources.jsp"/>
</head>

<body>
	<div id="container">
		<jsp:include page="/page/common/header.jsp">
			<jsp:param value="server" name="select"/>
		</jsp:include>
        <div id="wrapper">
			<div id="content">
       			<div id="box">
                	<h3>权限管理模块</h3>
                	<div id="help">
                		<div class="help-guest">
           					<a  href="${baseUrl}/module.html"><span>模块管理</span></a>
                         	<a  href="${baseUrl}/function.html"><span>功能管理</span></a>
						 	<a href="${baseUrl}/user/index.html"><span>授权</span></a>
       					 </div>
       				 </div>
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
