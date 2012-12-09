<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp" %>
<html>
<head>
	<jsp:include page="/page/common/css-js-sources.jsp"/>
</head>

<body>
	<div id="container">
		<jsp:include page="/page/common/header.jsp">
			<jsp:param value="index" name="select"/>
		</jsp:include>
        <div id="wrapper">
            <div id="content">
       			<div id="box">
                	<h3>推送超时记录</h3>
                	<table class="tablehover">
						<thead>
							<tr>
                            	<th width="50%"><a href="#">DataId</a></th>
                            	<th width="30%"><a href="#">GroupId</a></th>
                                <th width="20%"><a href="#">Time</a></th>
                            </tr>
						</thead>
						<tbody>
							<tr>
                            	<td class="a-center">NS_SubscriptionInfo_TRADE</td>
                            	<td><a href="#">Jennifer Hodes</a></td>
                                <td>2010-3-25 20:19:20</td>
                            </tr>
							<tr>
                            	<td class="a-center">NS_SubscriptionInfo_TRADE</td>
                            	<td><a href="#">Mark Kyrnin</a></td>
                                <td>2010-3-25 20:19:20</td>
                            </tr>
							<tr>
                            	<td class="a-center">NS_SubscriptionInfo_TRADE</td>
                            	<td><a href="#">Virgílio Cezar</a></td>
                                <td>2010-3-25 20:19:20</td>
                            </tr>
							<tr>
                            	<td class="a-center">NS_SubscriptionInfo_TRADE</td>
                            	<td><a href="#">Todd Simonides</a></td>
                                <td>2010-3-25 20:19:20</td>
                            </tr>
                            <tr>
                            	<td class="a-center">NS_SubscriptionInfo_TRADE</td>
                            	<td><a href="#">Carol Elihu</a></td>
                                <td>2010-3-25 20:19:20</td>
                            </tr>
                            <tr>
                            	<td class="a-center">NS_SubscriptionInfo_TRADE</td>
                            	<td><a href="#">Jennifer Hodes</a></td>
                                <td>2010-3-25 20:19:20</td>
                            </tr>
							<tr>
                            	<td class="a-center">NS_SubscriptionInfo_TRADE</td>
                            	<td><a href="#">Mark Kyrnin</a></td>
                                <td>2010-3-25 20:19:20</td>
                            </tr>
							<tr>
                            	<td class="a-center">NS_SubscriptionInfo_TRADE</td>
                            	<td><a href="#">Virgílio Cezar</a></td>
                                <td>2010-3-25 20:19:20</td>
                            </tr>
							<tr>
                            	<td class="a-center">NS_SubscriptionInfo_TRADE</td>
                            	<td><a href="#">Todd Simonides</a></td>
                                <td>2010-3-25 20:19:20</td>
                            </tr>
                            <tr>
                            	<td class="a-center">NS_SubscriptionInfo_TRADE</td>
                            	<td><a href="#">Carol Elihu</a></td>
                                <td>2010-3-25 20:19:20</td>
                            </tr>
						</tbody>
					</table>
                </div>
			</div>
        <jsp:include page="/page/common/menu.jsp">
			<jsp:param name="select" value="push_timeout" />
		</jsp:include>
      </div>
	<%@include file="/page/common/footer.jsp" %>
</div>
</body>
</html>
