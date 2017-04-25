<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jb.model.TwebsiteData" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="jb" uri="http://www.jb.cn/jbtag"%> 
<script type="text/javascript">
	var editor;
	var first = true;
	$(function() {
		window.setTimeout(function() {
			editor = KindEditor.create('#content', {
				width : '580px',
				height : '300px',
				items : [ 'source', '|', 'undo', 'redo', '|', 'preview', 'print', 'template', 'code', 'cut', 'copy', 'paste', 'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright', 'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript', 'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/', 'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'flash', 'media', 'insertfile', 'table', 'hr', 'emoticons', 'baidumap', 'pagebreak', 'anchor', 'link', 'unlink' ],
				uploadJson : '${pageContext.request.contextPath}/fileController/upload',
				fileManagerJson : '${pageContext.request.contextPath}/fileController/fileManage',
				allowFileManager : true
			});
		}, 1);
		parent.$.messager.progress('close');
		$('#form').form({
			url : '${pageContext.request.contextPath}/websiteDataController/edit',
			onSubmit : function() {
				parent.$.messager.progress({
					title : '提示',
					text : '数据处理中，请稍后....'
				});
				var isValid = $(this).form('validate');
				if (!isValid) {
					parent.$.messager.progress('close');
				}
				editor.sync();
				return isValid;
			},
			success : function(result) {
				parent.$.messager.progress('close');
				result = $.parseJSON(result);
				if (result.success) {
					parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
					parent.$.modalDialog.handler.dialog('close');
				} else {
					parent.$.messager.alert('错误', result.msg, 'error');
				}
			}
		});
		
		function ProcessFile() {
			var file = document.getElementById('iconFile').files[0];
			if (file) {
				var reader = new FileReader();
				reader.onload = function ( event ) {
					var txt = event.target.result;
					$('.img-preview').attr('src',txt);
				};
			}
		    reader.readAsDataURL(file);
		}
		$(document).delegate('#iconFile','change',function () {
			ProcessFile();
		});
		
		$('#menu').combobox({
			onSelect: function(record){
				first = false;
				var opts =[{ 'text':'请选择','id':''}];
				$("#type").combobox("loadData", opts);
				$("#type").combobox("setValue", "");
				var pid = $('#menu').combobox("getValue");
				if(pid != "") {
					drawType(pid);
				} 
			}
		});
		
		drawType("${websiteData.menu}");
	});
	
	function drawType(pid) {
		$.post('${pageContext.request.contextPath}/api/apiBaseDataController/basedata', {
			pid : pid,dataType:'MU'
		}, function(result) {
			if (result.success) {
				var opts =[{ 'text':'请选择','id':''}];
				for(var i=0; i<result.obj.length; i++) {
					opts.push({"text":result.obj[i].name,"id":result.obj[i].id});
     			}
				$("#type").combobox("loadData", opts);
				if(first) {
					$("#type").combobox("setValue", "${websiteData.type}");
				}
			}
		}, 'JSON');
	}
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title="" style="overflow: auto;">
		<form id="form" method="post" enctype="multipart/form-data">
				<input type="hidden" name="id" value = "${websiteData.id}"/>
			<table class="table table-hover table-condensed">
				<tr>	
					<th><%=TwebsiteData.ALIAS_TITLE%></th>	
					<td colspan="3">
						<input class="span2" name="title" type="text" style="width: 200px" value="${websiteData.title}"/>
					</td>	
				</tr>
				
				<tr>	
					<th><%=TwebsiteData.ALIAS_ICON%></th>	
					<td colspan="3">
						<img class="img-preview" src="${websiteData.icon}" width="50" height="50"/> 
						<input type="file" id="iconFile" name="iconFile">
					</td>
				</tr>	
				<tr>	
					<th width="8%"><%=TwebsiteData.ALIAS_SEQ%></th>	
					<td width="42%">
						<input name="seq" class="easyui-numberspinner"
							style="width: 140px; height: 29px;" required="required"
							data-options="editable:true,min:100" value="${websiteData.seq}">
					</td>							
					<th width="8%"><%=TwebsiteData.ALIAS_STATUS%></th>	
					<td width="42%">
						<jb:select dataType="ST" name="status" value="${websiteData.status}"></jb:select>
					</td>	
				</tr>
				<tr>	
					<th>导航菜单</th>	
					<td>
						<jb:select dataType="MU" name="menu" value="${websiteData.menu}"></jb:select>	
					</td>							
					<th><%=TwebsiteData.ALIAS_TYPE%></th>	
					<td>
						<select class="easyui-combobox" data-options="required:true,valueField:'id',textField:'text',width:140,height:29,editable:false" id="type" name="type">
							<option value="">请选择</option>
						</select>
					</td>							
				</tr>	
				<tr>	
					<th><%=TwebsiteData.ALIAS_CONTENT%></th>	
					<td colspan="3">
						<textarea  name="content" id="content" style="height:180px;visibility:hidden;">${websiteData.content}</textarea>
					</td>							
				</tr>	
			
			</table>				
		</form>
	</div>
</div>