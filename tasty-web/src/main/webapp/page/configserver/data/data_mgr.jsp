<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp"%>
<html>
<head>
<jsp:include page="/page/common/css-js-sources.jsp" />
</head>
<script type="text/javascript">
function mychange(){
	var select1 = document.getElementById("data");
	var index = select1.selectedIndex;
	if(index == 0)
		window.location.href="${baseUrl}/data_mgr.html";
	else if(index ==1)
		window.location.href="${baseUrl}/pub_mgr.html";
	else if(index == 2)
		window.location.href="${baseUrl}/sub_mgr.html";
	else 
		window.location.href="${baseUrl}/pub_search.html"
	}
</script>
<body>
	<div id="container">
		<jsp:include page="/page/common/header.jsp" flush="true">
			<jsp:param value="data" name="select" />
		</jsp:include>
		<div id="wrapper">
			<div id="content">
				<div id="box">
					<form id="form" class="expose" action="${baseUrl}/data_mgr.html" method="get">
						<fieldset id="personal">
							<legend>查询条件</legend>
							<select name="select-data" id="data" onchange="mychange()">
								<option value="data-mgr" selected="selected">数据管理</option>
								<option value="pub-mgr">发布者管理</option>
								<option value="sub-mgr">订阅者管理</option>
							</select> DataId: <input name="dataId" id="lastname" type="text" tabindex="1" size="30" value="${dataId}" /> GroupId: <input
								name="groupId" id="firstname" type="text" tabindex="2" value="${groupId }" /> <input type="checkbox" name="like"
								<c:if test="${like}">checked="checked"</c:if> />模糊查找
						</fieldset>
						<div align="center">
							<input id="searchButton" type="submit" value="搜索" /> <input id="resetButton" type="reset" value="重置" />
						</div>
					</form>

					<%@include file="/page/common/data/dataQueryResult.jsp"%>

				</div>
			</div>

			<jsp:include page="/page/common/menu.jsp">
				<jsp:param name="select" value='data_mgr' />
			</jsp:include>

		</div>
		<%@include file="/page/common/footer.jsp"%>
	</div>
</body>
</html>
