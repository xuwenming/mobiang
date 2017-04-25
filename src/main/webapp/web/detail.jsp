<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
   		<td style=" height:60px; background:url(${pageContext.request.contextPath}/web/images/n6.jpg) bottom left no-repeat;">
   			<table width="100%" border="0" cellspacing="0" cellpadding="0" style="height:40px; margin-top:10px;">
 				<tr>
   					<td style="line-height:40px; font-size:24px; color:#646464;">${data.typeZh}</td>
   					<td style="line-height:30px; font-size:14px; color:#646464;" align="right" valign="bottom">您当前的位置：${data.menuZh} > ${data.typeZh}</td>
				</tr>
			</table>
		</td>
	</tr>
 	<tr>
		<td valign="top">
			${data.content}
		</td>
	</tr>
</table>