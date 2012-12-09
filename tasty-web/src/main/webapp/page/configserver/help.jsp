<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp" %>
<html>
	<head>
		<jsp:include page="/page/common/css-js-sources.jsp"/>
	</head>
	<body>
		<div id="container">
			<jsp:include page="/page/common/header.jsp" flush="true">
				<jsp:param value="index" name="select"/>
			</jsp:include>
	        <div id="wrapper">
	            <div id="content">
				<div id="infowrap">
					<h2>数据</h2>
					    <a href="#">查看指定组的数据和对比：暂无</a><br/>
						<a href="${baseUrl}/data/compare.html">集群内对比所有组数据</a><br/>
						<a href="${baseUrl}/data/getAllData.html">获取数据大小、订阅者、发布者等的信息</a><br/><br/>
					<h2>发布者权重</h2>
						<a href="${baseUrl}/weighting/weight_add.html">添加权重规则</a><br/>
						<a href="${baseUrl}/weighting/list.html">查看权重规则</a><br/>
				</div>
				</div>
	        <jsp:include page="/page/common/menu.jsp">
				<jsp:param name="select" value='index'/>
			</jsp:include>
	    </div>
		<%@include file="/page/common/footer.jsp" %>
	</div>
	</body>
</html>
