<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@include file="include.jsp" %>

<pg:pager items="${param.totalCount}" url="${param.url}"  maxPageItems="${param.maxPageItems}" isOffset="true"  export="offset,currentPageNumber=pageNumber" scope="request">
	<c:if test="${not empty param.pageSize}">
		<pg:param name="pageSize" value="${param.pageSize}"/>
	</c:if>
	<c:if test="${not empty param.pageNo}">
		<pg:param name="pageNo" value="${param.pageNo}"/>
	</c:if>
	<c:if test="${not empty param.dataId}">
		<pg:param name="dataId" value="${param.dataId}"/>
	</c:if>
	<c:if test="${not empty param.hostId}">
		<pg:param name="hostId" value="${param.hostId}"/>
	</c:if>
	<c:if test="${not empty param.ip}">
		<pg:param name="ip" value="${param.ip}"/>
	</c:if>
	<c:if test="${not empty param.type}">
		<pg:param name="type" value="${param.type}"/>
	</c:if>
	<c:if test="${not empty param.groupId}">
		<pg:param name="groupId" value="${param.groupId}"/>
	</c:if>
	<c:if test="${not empty param.group}">
		<pg:param name="group" value="${param.group}"/>
	</c:if>
	<c:if test="${not empty param.like}">
		<pg:param name="like" value="${param.like}"/>
	</c:if>	
	<pg:index>
	<div class="cutPage">
		    <pg:first> <a href="${pageUrl}">首页</a></pg:first>
		    <pg:prev>&nbsp;<a href="${pageUrl}">上一页</a></pg:prev>
		    <pg:pages><%
		      if (pageNumber.intValue() < 10) { 
		        %>&nbsp;<%
		      }
		      if (pageNumber == currentPageNumber) { 
		        %><b>${pageNumber}</b><%
		      } else { 
		        %><a href="${pageUrl}"><%= pageNumber %></a><%
		      }
		    %>
		    </pg:pages>
		    <pg:next>&nbsp;<a href="${pageUrl}">下一页</a></pg:next>
		    <pg:last> <a href="${pageUrl}">尾页</a></pg:last>
		    <span>共    ${param.totalCount}  记录</span>
		</div>
	 </pg:index>
</pg:pager>
