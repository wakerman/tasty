<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/page/common/include.jsp" %>
<html>
<head>
	<jsp:include page="/page/common/css-js-sources.jsp"/>
</head>


<body>
	<div id="container">
    	<jsp:include page="/page/common/header.jsp">
			<jsp:param name="userName" value="${userName}"/>
			<jsp:param value="index" name="select"/>
		</jsp:include>
        <div id="wrapper">
            <div id="content">
       			<div id="rightnow">
                    <h3 class="reallynow">
                        <span>推送</span>
                        <br />
                    </h3>
				    <p class="youhave">
					<img src="${baseUrl}/resources/img/report_push.png" width="730"/>
                    </p>
					<table width="100%">
					<thead>
							<tr>
                            	<th width="40px" style="font-weight: normal;color:#375b91;">共 <b>15223</b> 次 | <b>500</b> 次/小时</th>
							</tr>
					</thead>
					</table>
                	<table width="100%">
						<thead>
							<tr>
                            	<th width="50px"><a href="#">时刻<img src="${baseUrl}/resources/img/icons/arrow_down_mini.gif" width="16" height="16" align="middle"/></a></th>
                            	<th><a href="#">比率</a></th>
                            </tr>
						</thead>
						<tbody>
							<tr>
                            	<td class="a-center">00:00</td>
                            	<td><div class="bar" style="width: 20.12%"></div><div class="barcontent">(20.12%)</div></td>
                            </tr>
							<tr>
                            	<td class="a-center">01:00</td>
                            	<td><div class="bar" style="width: 40.56%"></div><div class="barcontent">(40.56%)</div></td>
                            </tr>
							<tr>
                            	<td class="a-center">02:00</td>
                            	<td><div class="bar" style="width: 30.12%"></div><div class="barcontent">(30.12%)</div></td>
                            </tr>
							<tr>
                            	<td class="a-center">03:00</td>
                            	<td><div class="bar" style="width: 65.12%"></div><div class="barcontent">(65.12%)</div></td>
                            </tr>
							<tr>
                            	<td class="a-center">04:00</td>
                            	<td><div class="bar" style="width: 25.12%"></div><div class="barcontent">(25.12%)</div></td>
                            </tr>
							<tr>
                            	<td class="a-center">05:00</td>
                            	<td><div class="bar" style="width: 27.12%"></div><div class="barcontent">(27.12%)</div></td>
                            </tr>
							<tr>
                            	<td class="a-center">06:00</td>
                            	<td><div class="bar" style="width: 35.12%"></div><div class="barcontent">(35.12%)</div></td>
                            </tr>
							<tr>
                            	<td class="a-center">07:00</td>
                            	<td><div class="bar" style="width: 10.12%"></div><div class="barcontent">(10.12%)</div></td>
                            </tr>
							<tr>
                            	<td class="a-center">08:00</td>
                            	<td><div class="bar" style="width: 45.12%"></div><div class="barcontent">(45.12%)</div></td>
                            </tr>
							<tr>
                            	<td class="a-center">09:00</td>
                            	<td><div class="bar" style="width: 22.12%"></div><div class="barcontent">(22.12%)</div></td>
                            </tr>
						</tbody>
					</table>
                    <div id="pager">
                    	当前显示第 <a href="#"><img src="${baseUrl}/resources/img/icons/arrow_left.gif" width="16" height="16" align="middle"/></a> 
                    	<input size="1" value="1" type="text" name="page" id="page" /> 
                    	<a href="#"><img src="${baseUrl}/resources/img/icons/arrow_right.gif" width="16" height="16" align="middle"/></a> 页，共 20 页，400 条记录
                    </div>
				</div>
			</div>
			<jsp:include page="/page/common/menu.jsp">
			<jsp:param name="select" value='state'/>
			</jsp:include>
      </div>
	<%@include file="/page/common/footer.jsp" %>
</div>
</body>
</html>
