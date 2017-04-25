<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    String PN = request.getParameter("PN");
    PN = PN == null ? "" : PN;
%>

<script>
    $(function() {
        $.messager.progress('close');

        $('#photoUpload_Form').form({
            url : '${pageContext.request.contextPath}/api/apiTestController/photo_upload',
            onSubmit : function() {
                $.messager.progress({
                    title : '提示',
                    text : '数据处理中，请稍后....'
                });
                var isValid = $(this).form('validate');
                if (!isValid) {
                    parent.$.messager.progress('close');
                }
                return isValid;
            },
            success : function(result) {
                $.messager.progress('close');
                $("#photoUpload_result").text(JSON.stringify(JSON.parse(JSON.parse(result).obj), null, 4));
            }
        });
    });
</script>
<form method="POST" id="photoUpload_Form" enctype="multipart/form-data">
    <input type="hidden" name="projectMark" value="<%=PN%>">
    <table align="center" width="90%" class="tablex">
        <tr>
            <td align="right" style="width: 80px;"><label>url：</label></td>
            <td><input name="url" type="text" class="span2" value="user/photoupload"/></td>
        </tr>

        <tr>
            <td align="right" style="width: 180px;"><label>sid(SessonId值)：</label></td>
            <td><input name="sid" type="text" class="span2" value=""/></td>
        </tr>
        <tr>
            <td align="right" style="width: 180px;"><label>uid(用户ID)：</label></td>
            <td><input name="uid" type="text" class="span2" value=""/></td>
        </tr>
        <tr>
            <td align="right" style="width: 180px;"><label>language(语言)：</label></td>
            <td><input name="language" type="text" class="span2" value="cn"/>（cn:中文，en:英文，th：泰文）</td>
        </tr>
        <tr>
            <td align="right" style="width: 180px;"><label>type(照片类型)：</label></td>
            <td><input name="type" type="text" class="span2" value="1"/>（1：头像2：身份证正面照3：身份证反面照4：驾照正面照）</td>
        </tr>
        <tr>
            <td align="right" style="width: 180px;"><label>photo(选择照片)：</label></td>
            <td><input name="photo" type="file" class="span2" value=""/></td>
        </tr>

        <tr>
            <td colspan="2" align="center" style="padding: 20px;">
                <input type="button" value="上 传" onclick="javascript:$('#photoUpload_Form').submit();" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <label style="font-weight: bolder;">返回结果：</label>
                <div id="photoUpload_result"></div>
            </td>
        </tr>
    </table>

</form>
