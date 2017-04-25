<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jb.model.TwebsiteData" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript">
	$(function() {
		parent.$.messager.progress('close');		
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false">
		<table class="table table-hover table-condensed">
				<tr>
					<th width="8%"><%=TwebsiteData.ALIAS_TITLE%></th>
					<td width="42%">${websiteData.title}</td>
					<th width="8%"><%=TwebsiteData.ALIAS_SEQ%></th>
					<td width="42%">${websiteData.seq}</td>
				</tr>	
				<tr>	
					<th>导航菜单</th>	
					<td>
						${websiteData.menuZh}
					</td>							
					<th><%=TwebsiteData.ALIAS_TYPE%></th>	
					<td>
						${websiteData.typeZh}
					</td>							
				</tr>	
				<tr>	
					<th><%=TwebsiteData.ALIAS_STATUS%></th>	
					<td>
						${websiteData.statusZh}
					</td>
					<th><%=TwebsiteData.ALIAS_ADDTIME%></th>	
					<td>
						<fmt:formatDate value="${websiteData.addtime}" pattern="yyyy-MM-dd HH:mm:ss"/>							
					</td>							
				</tr>
				<tr>
					<th><%=TwebsiteData.ALIAS_ICON%></th>	
					<td colspan="3"><img alt="" src="${websiteData.icon}"> </td>
				</tr>
				<tr>	
					<th><%=TwebsiteData.ALIAS_CONTENT%></th>	
					<td colspan="3">
						${websiteData.content}							
					</td>							
				</tr>			
		</table>
	</div>
</div>