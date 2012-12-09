<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp" %>
<html>
	<head>
		<jsp:include page="/page/common/css-js-sources.jsp"/>
	</head>
	<script type="text/javascript">
	function mychange(){
	var select1 = document.getElementById("data");
	var index = select1.selectedIndex;
	if(index == 1)
		window.location.href="${baseUrl}/data_mgr.html";
	else if(index ==2)
		window.location.href="${baseUrl}/pub_mgr.html";
	else if(index == 3)
		window.location.href="${baseUrl}/sub_mgr.html";
	else 
		window.location.href="${baseUrl}/pub_search.html"
	}
	</script>
	<body>
		<div id="container">
				<jsp:include page="/page/common/header.jsp">
					<jsp:param value="pub_search" name="select"/>
				</jsp:include>
		        <div id="wrapper">
					<div id="content">
		       			<div id="box">
		                	<form id="form" action="${baseUrl}/pub_search.html" method="get" class="expose"> 
		                    	<fieldset id="personal">
									<legend>查询条件</legend>
									<select name="select-data" id="data" onchange="mychange()">
		      							<option value="pub-search" selected="selected">推送历史查询</option>
		      							<option value="data-mgr">数据管理</option>
		      							<option value="pub-mgr">发布者管理</option>
		      							<option value="sub-mgr">订阅者管理</option>
		      						</select>&nbsp;
									DataId : <input name="dataId" id="lastname" type="text" tabindex="1" size="60" value="${dataId}"/><br/>
			                        GroupId : <input name="groupId" id="firstname" type="text" tabindex="2" size="18" value="${groupId }"/>
			                        &nbsp;&nbsp;clientIp : <input name="clientIp" id="clientIp" type="text" tabindex="2" size="18" value="${clientIp }"/>
			                        Date : <input name="time" id="time" type="text" tabindex="2" size="18" value="${time }"/>
			                        &nbsp;<input type="checkbox" name="like" <c:if test="${like}">checked="checked"</c:if> />模糊查找
		                      	</fieldset>
		                     	<div align="center">
			                     	<input id="searchButton" type="submit" value="搜索"/> 
			                    	<input id="resetButton" type="reset" value="重置" />
		                      	</div>
		                    </form>
		     				<c:choose>
								<c:when test="${not empty logData}">
		                    		<table class="tablehover">
										<thead>
											<tr>
										        <th width="50%"><a href="#">DataId</a></th>
										        <th width="15%"><a href="#">GroupId</a></th>
										        <th width="15%"><a href="#">IP</a></th>
										        <th width="5%"><a href="#">Size</a></th>
												<th width="5%"><a href="#">Detail</a></th>
										   </tr>
										</thead>
										<tbody>
											<c:forEach var="item" items="${logData}">
												<tr>
									               	<td title="${item.dataId}" style="text-align:left;">${item.dataId}</td>
									               	<td title="${item.groupId}">${item.groupId}</td>
									               	<td>${item.clientIp}</td>
									                <td>${item.dataSize}</td>
													<td>
														<a href="${baseUrl}/logAnalysis/detail.html?Id=${item.id}" class="nyroModal" title="查看数据"><img src="${baseUrl}/resources/img/icons/magnifier.png" /></a>
													</td>
									            </tr>
											</c:forEach>
										</tbody>
									</table>
									<div class="cutPage">
									<%-- 分页显示 --%>
									<c:choose>
										<c:when test="${page.pageNum != 1}">
											<a href="${baseUrl}/pub_search.html?pageNum=1&dataId=${dataId}&groupId=${groupId}&clientIp=${clientIp}&like=${like}">首页</a>
										</c:when>
									</c:choose>
									<c:choose>
										<c:when test="${(page.pageNum-1) >= 1}">
											<a href="${baseUrl}/pub_search.html?pageNum=${page.pageNum-1}&dataId=${dataId}&groupId=${groupId}&clientIp=${clientIp}&like=${like}">上一页</a>
										</c:when>
									</c:choose>
									<c:forEach begin="${((page.pageNum+9)>=page.pageCount)? (page.pageCount-9) : page.pageNum}" end="${(page.pageNum+9)<=page.pageCount ? (page.pageNum+9) : page.pageCount}" step="1" var="p">
										<c:choose>
											<c:when test="${page.pageNum==p}">
												<b>${p}</b>
											</c:when>
											<c:otherwise>
												<a href="${baseUrl}/pub_search.html?pageNum=${p}&dataId=${dataId}&groupId=${groupId}&clientIp=${clientIp}&like=${like}">${p}</a>
											</c:otherwise>											
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${(page.pageNum+1) <= page.pageCount}">
											<a href="${baseUrl}/pub_search.html?pageNum=${page.pageNum+1}&dataId=${dataId}&groupId=${groupId}&clientIp=${clientIp}&like=${like}">下一页</a>
										</c:when>
									</c:choose>
									<c:choose>
										<c:when test="${page.pageNum != page.pageCount}">
											<a href="${baseUrl}/pub_search.html?pageNum=${page.pageCount}&dataId=${dataId}&groupId=${groupId}&clientIp=${clientIp}&like=${like}">尾页</a>
										</c:when>
									</c:choose>
									<span>共    ${page.totalCount}  记录</span>
									</div>
								</c:when>
								<c:otherwise>
									<div class="error">没有符合你指定条件的数据</div>
			                  	</c:otherwise>
                 	 		</c:choose>
		                </div>
					</div>
		            
		<jsp:include page="/page/common/menu.jsp">
			<jsp:param name="select" value='pub_search'/>
		</jsp:include>
		</div>
		<%@include file="/page/common/footer.jsp" %>
		</div>
	</body>
</html>
