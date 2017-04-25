<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jb.listener.Application"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%
	String defaultDg = "web/images/about1.jpg";
	String defaultAd = "web/images/n5.jpg";
	String bg = Application.get("IM030") == null ? defaultDg : (Application.get("IM030").getIcon() == null ? defaultDg :Application.get("IM030").getIcon());
	String ad = Application.get("IM040") == null ? defaultAd : (Application.get("IM040").getIcon() == null ? defaultAd :Application.get("IM040").getIcon());
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
<table width="100%" border="0" style="background:url(${pageContext.request.contextPath}/<%=bg %>) top center no-repeat; height:495px;<!--695px -->" cellspacing="0" cellpadding="0">
  	<tr>
    	<td valign="top">
    		<div id="menuDiv"></div>
		</td>
 	</tr>
</table>
<table width="1366" border="0" cellspacing="0" cellpadding="0" style="background:#E6EAED;" align="center">
  	<tr>
    	<td valign="top">
    		<table width="1000" align="center" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; background:#FFF;">
  				<tr>
    				<td width="240" valign="top">
    					<table width="100%" border="0" cellspacing="0" cellpadding="0" >
  							<tr>
    							<td valign="top">
    								<table width="100%" border="0" cellspacing="0" cellpadding="0" style="background:url(${pageContext.request.contextPath}/web/images/n2.png) top center no-repeat; height:75px;">
 										<tr>
						    				<td style="line-height:30px; font-size:16px; color:#FFF; text-indent:22px;">${menu.menuDesc.name_en}</td>
						  				</tr>
						  				<tr>
						  					<td style="line-height:45px; font-size:25px; color:#FFF; text-indent:22px;">${menu.menuDesc.name_zh}</td>
						  				</tr>
									</table>
								</td>
  							</tr>
  							<tr>
    							<td style="line-height:10px; height:10px;"></td>
  							</tr>
  							<c:forEach items="${data}" var="d" varStatus="vs">
  								<c:if test="${vs.index == 0}">
   									<c:set var="type" value="${d.id}"/>
   								</c:if>
	 							<tr>
	    							<td class="s3"><a href="javascript:void(0);" onclick="detail('${d.id}', this);" class="<c:if test="${vs.index == 0}">active</c:if>">${d.name}</a></td>
	  							</tr>
	  						</c:forEach>
						  	<tr>
						    	<td style="line-height:20px; height:20px;"></td>
						  	</tr>
						   	<tr>
						    	<td> 
						    		<a href="${pageContext.request.contextPath}/websiteController/showMenu?type=1&menuId=MU100">
							    		<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  				<tr>
							    				<td><img src="${pageContext.request.contextPath}/<%=ad %>" width="240" height="160" /></td>
							  				</tr>
							  				<tr>
							    				<td>
							    					<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:-25px; position:relative; z-index:10;">
							  							<tr>
							    							<td style="line-height:25px; height:25px; background:#242527;" align="center"><a href="" style="color:#FFFFFF;" >经典案例展示</a></td>
							  							</tr>
													</table>
												</td>
				  							</tr>
										</table>
									</a>
								</td>
  							</tr>
						</table>
					</td>
    				<td valign="top">
    					<div class="zw" id="detail" style="display: block;"> 
						</div>
    				</td>
  				</tr>
			</table>
		</td>
  	</tr>
</table>

<jsp:include page="bottom.jsp"></jsp:include>
<script type="text/javascript">
	$(function(){
		$("#detail").load("${pageContext.request.contextPath}/websiteController/detail?type=${type}");
	});
	function detail(type, obj) {
		$(".s3 a.active").removeClass("active");
		$(obj).addClass("active");
		$("#detail").load("${pageContext.request.contextPath}/websiteController/detail?type=" + type);
	}
</script>
</body>
</html>
