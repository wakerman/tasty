<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp" %>
<div id="detail">
<div>
	<h3 style="margin:5px 0 0 5px;color:#FF5500;">
		DataId : ${dataId} &nbsp;|&nbsp; GroupId : ${groupId}
	</h3>
	</div>
	<c:choose>
			<c:when test="${not empty details}">
				<c:forEach var="item" items="${details}">
					<table class="datadetail">
						<tbody>
								<tr>
									<td width="100px" >&nbsp;&nbsp;Type&nbsp;&nbsp;</td>
									<td style="text-align:left;"><span style="margin:0 0 0 3px;">${item.javaType}</span></td>
								</tr>
								<tr>
									<td width="100px" >&nbsp;&nbsp;DatumId&nbsp;&nbsp;</td>
									<td style="text-align:left;"><span style="margin:0 0 0 3px;">${item.datumId}</span></td>
								</tr>
								<tr>
									<td width="100px">&nbsp;&nbsp;Content&nbsp;&nbsp;</td>
									<td  style="text-align:left;">
										<c:choose>
										    <c:when test="${fn:length(item.content) > 1000}">
										     	<textarea rows="30" cols="95" readonly="readonly">${item.content}</textarea>
										    </c:when>
										    <c:otherwise>
										    	<span style="margin:0 0 0 3px;">${item.content}</span>
										    </c:otherwise>
									     </c:choose> 
									</td>
								</tr>
						</tbody>
					</table>
				</c:forEach>
			</c:when>
			<c:otherwise>
			<h3 style="margin:5px 0 0 5px;color:red;">没有数据</h3>
			</c:otherwise>
	</c:choose>

</div>
