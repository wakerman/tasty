<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp"%>
<html>
<head>
<style>
.tb{table-layout:fixed}
.tb td{table-layout:fixed; word-break: break-all;}
}
</style>		
	
</head>
<jsp:include page="/page/common/header.jsp" flush="true">
	<jsp:param name="select" value='fuzzyQuery' />
</jsp:include>

<div class="container">
<br><br><br>
	<h1>模糊查询</h1>
	<form class="form-inline" action="fuzzyQueryHandle.html" name="searchForm" id="searchForm" method="post">
		<table class="table table-striped table-bordered tb">
				<tr>
					<th width="50%" style="text-align: left;">
						<input type="text" id="queryString" name="queryString" class="span6"
							value="${queryString }" placeholder="操作关键字、店铺名称/id、商品名称/id、评价id/关键字、类目······">
					</th>
					<th width="40%" style="text-align: left;">
									<label>时间区间</label>
									<input type="text" class="time span2" name="startTime" id="startTime" value="${startTime}" />
									~
									<input type="text" class="time span2" id="endTime"  name="endTime" value="${endTime}" />
					</th>
					<th width="10%">
						<input type="hidden" value="${pageNum}" name="pageNum" id="pageNum"/>
						<button type="submit" class="btn btn-primary">查 询</button>
					</th>
				</tr>
		</table>
	</form>

		<div class="pagination">
			<ul>
				<li><a href="#" onclick="changePage('${pageNum-1}');">上一页</a></li>
				<li><a href="#" onclick="changePage('${pageNum+1}');">下一页</a></li>
				<li class="disabled"><a>共 <font color="blue"><b>${totalPages}</b></font> 页, <font color="blue"><b>${totalResults}</b></font> 条记录，当前第 <font color="blue"><b>${pageNum}</b></font> 页，每页<font color="blue"><b> 30 </b></font>条记录 </a></li>
			</ul>
		</div>
	<c:if test="${null != dataSourceDO && not empty dataSourceDO.operationRecordList}">
			<table class="table table-striped table-bordered tb">
				<thead>
					<tr>
						<th width="10%"><a href="#">操作人</a></th>
						<th width="10%"><a href="#">应用</a></th>
						<th width="10%"><a href="#">操作类型</a></th>
						<th width="60%"><a href="#">操作内容</a></th>
						<th width="15%"><a href="#">操作时间</a></th>
						<th width="5%"><a href="#">备注</a></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="operationRecordStore" items="${dataSourceDO.operationRecordList}">
						<tr>
							<td style="text-align: left;">${ operationRecordStore.userNick }</td>
							<td>${ operationRecordStore.logType }</td>
							<td>${ operationRecordStore.operType }</td>
							<td>${ operationRecordStore.operContent }</td>
							<td>${ operationRecordStore.logTime }</td>
							<td>${ operationRecordStore.bizMap }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	</c:if>

<br><br><br>
<%@include file="/page/help/help4FuzzyQuery.jsp"%>
</div>



<script>
	$('.time').datetimepicker({
		dateFormat : 'yy-mm-ddT',
		timeFormat : 'hh:mm:ssZ',
		separator : '',
		showSecond : true
	});
	$('.date').datetimepicker({
		dateFormat : 'yy-mm-dd',
		timeFormat : '',
		separator : '',
		showHour : false,
		showMinute : false,
		showSecond : false
	});

	function changePage( pageNum ) {
		document.getElementById("pageNum").value = pageNum;
		document.searchForm.submit();
	}
	
</script>


</body>
</html>
