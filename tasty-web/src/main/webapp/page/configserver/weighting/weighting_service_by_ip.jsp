<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/page/common/css-js-sources.jsp" %>
<%@include file="/page/common/include.jsp" %>
<script type="text/javascript">
    var selected = false;
	$(function() {
		$("#selectall").click(function() {
			$("input[name=services]").each(function() {
				if(selected){
					$(this).attr("checked", false);
				}else{
					$(this).attr("checked", true);
				}
			});
			selected = !selected;
		});
	});
</script>
<div id="detail">
<c:choose>
		<c:when test="${not empty services}">
		    <h3 style="margin:5px 8px 0 5px;">请从一下选择服务</h3>
	        <table class="tablehover" style="margin-top:1px;">
				<thead>
					<tr>
				        <th width="15%"><input type="checkbox" id="selectall"></th>
				        <th width="85%"><a href="#">服务名</a></th>
				   </tr>
				</thead>
				<tbody>						
					<c:forEach var="item" items="${services}" varStatus="status">
						<tr>
			               	<td width="15%"><input type="checkbox" id="config_service_${status.count}" name="services" value="${item}"></td>
			               	<td title="${item}" id="config_service_${status.count}_2" width="85%">${item}</td>
			            </tr>
					</c:forEach>
				</tbody>
			</table>
		</c:when>
		<c:otherwise>
		<h3 style="margin:5px 0 0 5px;color:red;">在此IP下没有找到服务</h3>
		</c:otherwise>
</c:choose>
</div>
