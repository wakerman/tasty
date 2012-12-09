<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp" %>
<div id="detail">
<div>
	<h3 style="margin:5px 0 0 5px;color:#FF5500;">
		DataId : ${model.dataId} &nbsp;|&nbsp; GroupId : ${model.groupId}
	</h3>
	</div>
	<table class="datadetail">
		<tbody>
			<tr>
				<td width="100px" >&nbsp;&nbsp;dataSize&nbsp;&nbsp;</td>
				<td style="text-align:left;"><span style="margin:0 0 0 3px;">${model.dataSize}</span></td>
			</tr>
			<tr>
				<td width="100px" >&nbsp;&nbsp;serverIp&nbsp;&nbsp;</td>
				<td style="text-align:left;"><span style="margin:0 0 0 3px;">${model.serverIp}</span></td>
			</tr>
			<tr>
				<td width="100px" >&nbsp;&nbsp;clientIp&nbsp;&nbsp;</td>
				<td style="text-align:left;"><span style="margin:0 0 0 3px;">${model.clientIp}</span></td>
			</tr>
			<tr>
				<td width="100px" >&nbsp;&nbsp;logTime&nbsp;&nbsp;</td>
				<td style="text-align:left;"><span style="margin:0 0 0 3px;">${model.logTime}</span></td>
			</tr>
		</tbody>
	</table>
</div>
