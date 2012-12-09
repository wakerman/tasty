<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<jsp:include page="/page/common/header.jsp" flush="true">
			<jsp:param value="data" name="select"/>
		</jsp:include>
        <div id="wrapper">
			<div id="content">
       			<div id="box">
       			<label>Total:${totalCount}</label>&nbsp;&nbsp;&nbsp;&nbsp;
       			<label>Finshed:${processCount}</label>&nbsp;&nbsp;&nbsp;&nbsp;
       			<label>TotalSize:${totalSize}&nbsp;kb</label>
           <c:choose>
				<c:when test="${not empty result}">
                    <table class="tablehover">
						<thead>
							<tr>
						        <th width="70%"><a href="#">DataId</a></th>
						        <th width="15%"><a href="#">GroupId</a></th>
						        <th width="5%"><a href="#">DataSize</a></th>
						        <th width="5%"><a href="#">PubSize</a></th>
						        <th width="5%"><a href="#">SubSize</a></th>
						   </tr>
						</thead>
						<tbody>						
							<c:forEach var="item" items="${result}">
								<tr>
					               	<td title="${item.dataId}" style="text-align:left;">
					               	${item.dataId}
					               	</td>
					               	<td title="${item.groupId}">${item.groupId}</td>
					               	<td title="${item.dataSize}">${item.dataSize}</td>
					               	<td title="${item.pubSize}">${item.pubSize}</td>
					               	<td title="${item.subSize}">${item.subSize}</td>
					            </tr>
							</c:forEach>
						</tbody>
					</table>
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
