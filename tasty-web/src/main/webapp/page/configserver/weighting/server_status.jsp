<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp" %>
<html>
<head>
	<jsp:include page="/page/common/css-js-sources.jsp"/>
</head>

<body>
	<div id="container">
		<jsp:include page="/page/common/header.jsp">
			<jsp:param value="data" name="select"/>
		</jsp:include>
        <div id="wrapper">
			<div id="content">
       			<div id="box">
                	<h3>Server规则检测状况</h3>
                	<c:if test="${not empty message}">
						<div id="result" class="top-error">${message}</div><br/>
					</c:if>
                </div>
			</div>
		<jsp:include page="/page/common/menu.jsp">
			<jsp:param name="select" value='data_mgr'/>
		</jsp:include>
		
	</div>
	<%@include file="/page/common/footer.jsp" %>
</div>
</body>
</html>
