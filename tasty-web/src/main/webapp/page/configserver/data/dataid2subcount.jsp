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
                	<h3>DataId下的订阅者数</h3>
                    <form id="form" class="expose" action="${baseUrl}/data/dataid_subscribers.html" method="get">                    	
                    	<fieldset id="personal">
							<legend>查询条件</legend>
							IP : <input name="dataId" id="dataId" type="text" tabindex="1" size="80" value="${dataId}"/>
                      	</fieldset>
                     	<div align="center">
	                     	<input id="searchButton" type="submit" value="搜索" /> 
	                    	<input id="resetButton" type="reset" value="重置" />
                      	</div>
                    </form>
            <c:if test="${not empty dataId}">
	            <c:if test="${not empty machines}">
					<div id="result" class="tips">订阅表达式[${dataId}]的发布者的机器总数为：${machines}</div>
				</c:if>
			</c:if>
			<c:if test="${empty dataId}">
	            <c:if test="${not empty machines}">
					<div id="result" class="tips">所有订阅者的机器总数为：${machines}</div>
				</c:if>
			</c:if>             
           <c:choose>
			<c:when test="${not empty sub2count}">
                    <table class="tablehover">
						<thead>
							<tr>
								<th width="75%"><a href="#">DataId</a></th>
						        <th width="12%"><a href="#">订阅者数量</a></th>
						        <th width="13%"><a href="#">实际机器数量</a></th>
						   </tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${sub2count}">
								<tr>
								 	<td title="${item.dataId}" style="text-align:left;">${item.dataId}</td>
					               	<td title="${item.count}">${item.count}</td>
					               	<td title="${item.realIpCount}">${item.realIpCount}</td>
					            </tr>
							</c:forEach>
						</tbody>
					</table>
                  </c:when>
                  <c:otherwise>
					<div class="error">没有订阅者</div>
                  </c:otherwise>
                  </c:choose>
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
