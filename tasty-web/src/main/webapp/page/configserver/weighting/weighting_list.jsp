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
                	<h2>规则列表 <font style="font-size:12px;"><a href="${baseUrl}/weighting/weight_add.html">添加新的权重规则</a></font> </h2>
                	<c:if test="${not empty message}">
						<div id="result" class="top-error">${message}</div>
					</c:if>
                    <form id="form" class="expose" action="${baseUrl}/weighting/list.html" method="get">                    	
                    	<fieldset id="personal">
							<legend>查询条件</legend>
							IP : <input name="hostId" id="hostId" type="text" tabindex="1" size="52" value="${hostId}"/>
                      	</fieldset>
                     	<div align="center">
	                     	<input id="searchButton" type="submit" value="搜索" /> 
	                    	<input id="resetButton" type="reset" value="重置" />
                      	</div>
                    </form>
           <c:choose>
			<c:when test="${not empty datas}">
                    <table class="tablehover">
						<thead>
							<tr>
								<th width="30%"><a href="#">ID</a></th>
						        <th width="30%"><a href="#">IP</a></th>
						        <th width="20%"><a href="#">复制数量</a></th>
								<th width="20%"><a href="#">操作</a></th>
						   </tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${datas}">
								<tr>
								 	<td title="${item.id}">${item.id}</td>
					               	<td title="${item.hostId}">${item.hostId}</td>
					                <td>${item.count}</td>
									<td>
										<a href="${baseUrl}/weighting/service_detail_by_ip.html?id=${item.id}" class="nyroModal" title="查看服务"><img src="${baseUrl}/resources/img/icons/magnifier.png" /></a>
										<a href="${baseUrl}/weighting/delete_by_ip.html?id=${item.id}&hostId=${item.hostId}" title="删除">
											<img src="${baseUrl}/resources/img/icons/delete.png" />
										</a>
									</td>
					            </tr>
							</c:forEach>
						</tbody>
					</table>

					<jsp:include page="/page/common/pager.jsp">
						<jsp:param value="${totalCount}" name="totalCount"/>
						<jsp:param value="${baseUrl}/weighting_list.html" name="url"/>
						<jsp:param value="20" name="pageSize"/>
						<jsp:param value="20" name="maxPageItems"/>
						<jsp:param value="${hostId}" name="hostId"/>
						<jsp:param value="${like}" name="like"/>
					</jsp:include>
					
                  </c:when>
                  <c:otherwise>
					<div class="error">没有符合你指定条件的数据</div>
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
