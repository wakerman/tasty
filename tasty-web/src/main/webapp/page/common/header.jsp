<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="include.jsp"%>
<%@page
	import="com.taobao.opssecurity.common.usermanager.impl.CookieUserManager"%>
<%
	String currentUser = null;
	try {
		currentUser = ( new CookieUserManager() ).getUserFromRequest( request );

	} catch ( Exception ex ) {
		ex.printStackTrace();
	}
%>





<link rel="stylesheet" href="${baseUrl}/resources/css/bootstrap.css">
<link rel="stylesheet"
	href="${baseUrl}/resources/css/bootstrap-responsive.css">
<link rel="stylesheet"
	href="${baseUrl}/resources/css/jquery-ui.custom.css">
<link rel="stylesheet" href="${baseUrl}/resources/css/default.css">


<script type="text/javascript" src="${baseUrl}/resources/js/jquery.js"></script>
<script type="text/javascript"
	src="${baseUrl}/resources/js/bootstrap.js"></script>
	<script type="text/javascript"
	src="${baseUrl}/resources/js/bootstrap-override.js"></script>
<script type="text/javascript"
	src="${baseUrl}/resources/js/jquery-ui.custom.js"></script>
<script type="text/javascript"
	src="${baseUrl}/resources/js/jquery-ui-timepicker-addon.js"></script>


	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container" style="font-family: Microsoft YaHei;">
			<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
        		<span class="icon-bar"></span>
        		<span class="icon-bar"></span>
        		<span class="icon-bar"></span>
      		</a>
				<a class="brand" href="<c:url value="/index.html"/>">柯 南</a>
				<div class="nav-collapse">

					<ul class="nav">
						<li <c:if test="${param.select eq 'exactQuery' }">class="active"</c:if> ><a
							href="<c:url value="/query/exactQueryPage.html"/>">精确查询</a></li>
						<li <c:if test="${param.select eq 'fuzzyQuery' }">class="active"</c:if> ><a
							href="<c:url value="/query/fuzzyQueryPage.html"/>">模糊查询</a></li>
						<li <c:if test="${param.select eq 'logOperTypeList' }">class="active"</c:if> ><a
							href="<c:url value="/stat/logOperTypeList.html"/>">操作类型</a></li>

					</ul>

					<ul class="nav pull-right">

						<li><a
							href="http://confluence.taobao.ali.com:8080/display/KENAN" target="_blank">关于柯南</a></li>
						<li><a
							href="http://confluence.taobao.ali.com:8080/pages/viewpage.action?pageId=198585027" target="_blank">使用帮助</a></li>
						<li class="dropdown <c:if test="${param.select eq 'admin' }">active</c:if>">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">管理入口<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a
									href="http://ops.jm.taobao.org:9999/ops-security/permissions.do?appName=kenan-web" target="_blank">用户权限管理</a></li>
								<li class="divider"></li>
								<li><a
									href="<c:url value="/stat/logOperTypeList.html"/>">操作类型管理</a></li>
								<li class="divider"></li>
								<li><a href="<c:url value="/admin/bizLogRuleList.html"/>">应用日志配置</a></li>
								<li class="divider"></li>
								<li><a
									href="<c:url value="/admin/increasedDataManager.html"/>">数据管理</a></li>
								<li class="divider"></li>
								<li><a
									href="<c:url value="/stat/overview.html"/>">统计信息</a></li>
							</ul></li>
						<%
							if ( currentUser != null && !"".equalsIgnoreCase( currentUser ) ) {
						%>
							<li class="active">
								<a href="#"><%=currentUser%></a>
							</li>
						<%
							}
						%>

					</ul>

				</div>
			</div>
		</div>
	</div>

