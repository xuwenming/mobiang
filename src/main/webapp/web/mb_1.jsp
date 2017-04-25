<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jb.listener.Application"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%
	String defaultDg = "web/images/n1.jpg";
	String bg = Application.get("IM020") == null ? defaultDg : (Application.get("IM020").getIcon() == null ? defaultDg :Application.get("IM020").getIcon());
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${menu.name}</title>
<link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/style/images/logo.png">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/css/css.css" />
<link href="${pageContext.request.contextPath}/web/css/lanrentuku.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/jslib/jquery-1.8.3.js"
	type="text/javascript" charset="utf-8"></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/web/js/slide.js"></script>

<script type="text/javascript">
	$(function(){
		parent.setTitle('${menu.name}');
		$("#menuDiv").load("${pageContext.request.contextPath}/websiteController/menu?menuId=${menuId}");
	});
</script>
</head>
<body>
	<table width="100%" border="0" style="background:url(${pageContext.request.contextPath}/<%=bg %>) top center no-repeat; height:695px;" cellspacing="0" cellpadding="0">
  		<tr>
    		<td valign="top">
    			<div id="menuDiv"></div>
			</td>
  		</tr>
	</table>
	<table width="1366" border="0" cellspacing="0" cellpadding="0" style="background:#E6EAED;" align="center">
	  	<tr>
	    	<td valign="top">
	    		<table width="1000" align="center" border="0" cellspacing="0" cellpadding="0" style="margin-top:15px;">
				  	<tr>
			    		<td style="line-height:35px; font-size:30px; font-weight:bold; color:#C80922; text-transform:uppercase; font-family: Arial;" align="center">Classic case show</td>
			  		</tr>
  					<tr>
	    				<td style="line-height:30px; font-size:24px; font-weight:bold; color:#686667; text-transform:uppercase;" align="center">经典案例展示</td>
	  				</tr>
  					<tr>
    					<td style="line-height:20px; font-size:12px; color:#686667; text-transform:uppercase;" align="center">优秀的项目是这样出来的</td>
  					</tr>
    				<tr>
    					<td>
    						<div class="lm">
    							<c:forEach items="${data}" var="d" varStatus="vs">
    								<c:if test="${vs.index == 0}">
    									<c:set var="type" value="${d.id}"/>
    								</c:if>
	    							<div class="s1 <c:if test="${vs.index == 0}">active</c:if>" >
	    								<a href="javascript:void(0);" onclick="showCase('${d.id}', this);">${d.name}</a>
	    							</div>
	    						</c:forEach>
    							
    						</div>
    					</td>
  					</tr>
 					<tr>
    					<td valign="top">
    						<div id="caseDiv"></div>
    					</td>
 	 				</tr>
				</table>
			</td>
  		</tr>
	</table>
	<jsp:include page="bottom.jsp"></jsp:include>
	
	<script type="text/javascript">
		$(function(){
			$("#caseDiv").load("${pageContext.request.contextPath}/websiteController/case_list?type=${type}");
		});
		
		function showCase(type, obj) {
			$(".lm .s1").removeClass("active");
			$(obj).parent().addClass("active");
			$("#caseDiv").load("${pageContext.request.contextPath}/websiteController/case_list?type=" + type);
		}
	</script>
</body>
</html>
