<%--
  Created by IntelliJ IDEA.
  User: guxin
  Date: 2016/1/8
  Time: 21:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jb.listener.Application" %>
<%@ page import="jb.pageModel.BaseData" %>
<%
    String PN = request.getParameter("PN");
    String opt = request.getParameter("DEBUG");
    PN = PN == null ? "" : PN;
    BaseData bd = Application.get(PN);
    if(bd == null) {
        bd = new BaseData();
        PN = "";
    } else {
        if(bd.getName() == null) PN = "";
    }

    if(opt == null || !"TRUE".equals(opt)) opt = "";

    //String apiUrl = Application.getString(PN);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>api在线调试</title>
    <script src="jquery.js" type="text/javascript" charset="utf-8"></script>
    <script src="jquery.form.min.js" type="text/javascript" charset="utf-8"></script>
    <!-- 引入EasyUI -->
    <link id="easyuiTheme" rel="stylesheet"
          href="${pageContext.request.contextPath}/jslib/jquery-easyui-1.3.3/themes/default/easyui.css"
    type="text/css">
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/jslib/jquery-easyui-1.3.3/jquery.easyui.min.js"
            charset="utf-8"></script>
    <!-- 扩展EasyUI -->
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/jslib/extEasyUI.js?v=201305241044"
            charset="utf-8"></script>
    <script>
        $(function() {
            init();
            $("#uploadApi").click(function(){
                if(!$("#projectMark").val()) {
                    alert("请输入正确的项目编号PN参数!");
                    return;
                }
                $("#file").click();
            });
            $(document).delegate('#file','change',function () {
                $("#uploadform").ajaxSubmit({
                    url : '${pageContext.request.contextPath}/basedataController/basedataEdit',
                    success : function(result) {
                        $("#file").val("");
                        result = $.parseJSON(result);
                        if (result.success) {
                            alert("上传成功");
                            $("#downloadApi").attr("href", '${pageContext.request.contextPath}/fileController/download?filePath=' + result.obj.icon);
                        } else {
                            alert("上传失败");
                        }
                    }
                });
            });
        });

        function init(id) {
            if(!$("#projectMark").val()) {
                alert("请输入正确的项目编号PN参数!");
                return;
            }
            $("#id, #url").val("");
            $("#is").removeAttr("checked");
            $("#apiname").find("tr.api").remove();
            $.getJSON("${pageContext.request.contextPath}/api/apiTestController/apilist?projectMark=" + $("#projectMark").val() + "&search=" + $("#search").val(), function(data){
                if(data!=null && data!=""){
                    $.each(data.obj,function(n,value) {
                        var content = '<tr height="30" style="cursor:pointer;" class="api"><td onclick="getResult(\''+value.id+'\');" id="'+value.id+'" style="background:'
                        if(value.isSuccess!=0){
                            content += 'red';
                        }else{
                            content += '#fff';
                        }
                        content += ';">'+value.name+'</td>';
                        if('<%=opt %>') {
                            content += '<td width="15%" align="center" title="删除" onclick="del(\''+value.id+'\',this)">X</td>';
                        }
                        content += '</tr>';
                        $("#apiname").append(content);

                        if(id) $("#" + id).click();
                    });
                }
            });
        }
    </script>
</head>
<body>
<form action="" method="post" id="test_form">
    <input type="hidden" name="projectMark" id="projectMark" value="<%=PN%>">
    <table border="1" style="width: 100%; height: 100%;">
        <tbody><tr>
            <td width="20%" valign="top">
                <div style="height: 100%;overflow-y: auto;">
                    <table border="1" style="width: 100%;" id="apiname">
                        <tr><th colspan="2">接口列表</th></tr>
                        <tr height="40">
                            <th colspan="2">
                                <input type="text" id="search" style="width: 190px; height: 25px;">
                                <div>
                                    <input type="button" value="查询" style="height: 30px; cursor: pointer;" onclick="init();">
                                    <%if(!"".equals(opt)) {%>
                                        <input type="button" value="新增" style="height: 30px; cursor: pointer;" onclick="javascript:location.reload();">
                                    <%}%>
                                </div>
                            </th>
                        </tr>
                    </table>
                </div>
            </td>
            <td width="80%">
                <table border="1" style="width: 100%;">
                    <tbody>
                    <tr>
                        <td colspan="2">
                            <label style="font-weight: bolder;">api测试地址：</label>
                            <font style="color: blue;" class="remoteUri"><%=bd.getName() == null ? "" : bd.getName() %></font>
                            <input type="text" class="localUri" style="width: 320px; display: none;" value="http://localhost:8080/"/>
                            <div style="float: right">
                                <a href="javascript:void(0);" id="openLocalTest">开启本地调试</a>
                            </div>
                            <!--<%if(!"".equals(opt)) {%>
                                <div style="float: right">
                                    <a href="javascript:void(0);" id="uploadApi">上传API接口文档</a>
                                    <a href="${pageContext.request.contextPath}/fileController/download?filePath=<%=bd.getIcon() %>" id="downloadApi">下载API</a>
                                </div>
                            <%}%>-->
                        </td>
                    </tr>
                    <tr>
                        <td width="30%">
                            <label style="font-weight: bolder;">url：</label>
                            <input type="hidden" name="id" id="id">
                            <input type="text" name="url" style="width: 320px; height: 20px;" id="url">
                        </td>
                        <td width="70%">
                            <label style="font-weight: bolder;">接口描述<font style="color: blue;">(名称）</font>：</label>
                            <input type="text" name="name" style="width: 700px;height: 20px;" id="name">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label style="font-weight: bolder;">参数<font style="color: blue;">(参数之间以&隔开)</font>：</label>
                            <textarea name="param" style="width: 320px; height: 80px;" id="param"></textarea>
                        </td>
                        <td>
                            <label style="font-weight: bolder;">参数描述<font style="color: blue;">(这是手工填写上去的，保存之后，下次会自动读取出来)</font>：</label>
                            <textarea name="paramDes" style="width: 700px; height: 80px;" id="paramDes"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label style="font-weight: bolder;">返回结果：</label>
                            <textarea id="result" name="result" style="width: 320px; height: 240px;" readonly="readonly"></textarea>
                        </td>
                        <td>
                            <label style="font-weight: bolder;">返回结果描述<font style="color: blue;">(这里也是手工填写上去，保存之后，下次会自动读取出来)</font>：</label>
                            <textarea name="resultDes" style="width: 700px; height: 240px;" id="resultDes"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="is" id="is">
                            <input type="hidden" name="isSuccess" id="isSuccess">
                            <label for="is" style="font-weight: bolder; color: blue;">是否调试失败(调试失败则勾选)</label>
                        </td>
                        <td>
                            <label style="font-weight: bolder;">备注<font style="color: blue;">(这里补充测试结果)</font>：</label>
                            <textarea name="remark" style="width: 700px; height: 50px;" id="remark"></textarea>
                        </td>
                    </tr>
                    <tr height="40">
                        <td colspan="2">
                            <label style="font-weight: bolder;">方法</label>
                            <input type="radio" name="method" value="POST" checked id="m_p" />
                            <label for="m_p">POST</label>&nbsp;
                            <input type="radio" name="method" value="GET" id="m_g"/>
                            <label for="m_g">GET</label>
                        </td>
                    </tr>
                    </tbody></table>
                <input type="button" value="在线测试" id="btn" style="height: 30px; cursor: pointer;">&nbsp;&nbsp;
                <%if(!"".equals(opt)) {%>
                    <input type="button" value="保存" id="save" style="height: 30px; cursor: pointer;">
                <%}%>
                <div style="float: right; display: none;">
                    <a href="javascript:void(0);" id="photoUpload">照片上传点这里</a>
                </div>
            </td>
        </tr>
        </tbody></table>

    <script type="text/javascript">
        $(function() {
            $('#openLocalTest').click(function(){
                if($(this).hasClass('local')) {
                    $(this).removeClass('local');
                    $(this).html('开启本地调试');
                    $(".localUri").hide();
                    $(".remoteUri").show();
                } else {
                    $(this).addClass('local');
                    $(this).html('关闭本地调试');
                    $(".remoteUri").hide();
                    $(".localUri").show();

                }
            });

            $("#btn").click(function() {
                if(!$("#projectMark").val()) {
                    alert("请输入正确的项目编号PN参数!");
                    return;
                }
                var url = $.trim($("#url")  .val()),
                    param = $.trim($("#param").val())

                if(param != ""){
                    url += $.trim("?" + param);
                }
                if(url == '') {
                    $("#url").focus();
                    return;
                }
                url = url.substring(0,1) == '/' ? url.substring(1) : url;

                var method = $(":radio[name=method]:checked").val();
                if($('#openLocalTest').hasClass('local')) {
                    var localUri = $.trim($('.localUri').val());
                    url = localUri + url;

                } else {
                    var remoteUri = $.trim($('.remoteUri').html());
                    url = remoteUri + url;
                    /*$.getJSON("${pageContext.request.contextPath}/api/apiTestController/test_api", {url:url, method:method, projectMark:$("#projectMark").val()}, function(data){
                        try {
                            $("#result").val(JSON.stringify(JSON.parse(data.obj), null, 4));
                        } catch(e) {
                            $("#result").val("传入接口地址或参数有误！");
                        }
                        //$("#completeUrl_test").attr("href", url).html(url);
                        //$("#completeUrl").val(url);
                    });*/
                }

                $.ajax({
                    type: method,
                    url: url,
                    data: {},
                    dataType:"json",
                    success:function (data) {
                        console.log(data);
                        try {
                            $("#result").val(JSON.stringify(data, null, 4));
                        } catch(e) {
                            $("#result").val("传入接口地址或参数有误！");
                        }
                    },
                    error:function(XMLHttpRequest, textStatus, errorThrown){
                        $("#result").val("传入接口地址或参数有误！");
                        console.log(XMLHttpRequest.status + " " + XMLHttpRequest.readyState + " " + textStatus + " " + errorThrown);
                    }
                });

            });

            $("#save").click(function() {
                if(!$("#projectMark").val()) {
                    alert("请输入正确的项目编号PN参数!");
                    return;
                }
                var url = $.trim($("#url").val());

                if($("#is").is(':checked')){
                    $("#isSuccess").val(1);
                }else{
                    $("#isSuccess").val(0);
                }
                if(url == '') {
                    $("#url").focus();
                    return;
                }
                $("#test_form").ajaxSubmit({
                    url : "${pageContext.request.contextPath}/api/apiTestController/edit",
                    success : function(data) {
                        alert("保存成功！");
                        init(JSON.parse(data).obj.id);
                    }
                });
            });

            $("#photoUpload").click(function(){
                $.modalDialog({
                    title : '照片上传',
                    width : 780,
                    height : 500,
                    href : '${pageContext.request.contextPath}/apitest/upload.jsp?PN=' + $("#projectMark").val()
                });

            });
        });

        function getResult(id) {
            $("#" + id).parent().css({"font-weight": "bolder"}).siblings().css("font-weight", "");
            $.getJSON("${pageContext.request.contextPath}/api/apiTestController/apitest?id="+id,function(data){
                $("#id").val(data.id);
                $("#name").val(data.name);
                $("#url").val(data.url);
                $("#info").val(data.name);
                $("#param").val(data.param);
                $("#paramDes").val(data.paramDes);
                $("#result").val(data.result);
                $("#resultDes").val(data.resultDes);
                $("#completeUrl_test").attr("href", data.completeUrl).html(data.completeUrl);
                $("#completeUrl").val(data.completeUrl);
                $("#remark").val(data.remark);
                if(data.isSuccess != 0) {
                    document.getElementById("is").checked = true;
                } else {
                    $("#is").removeAttr("checked");
                }
                $(":radio[name=method][value='"+data.method+"']").attr("checked", true);
                if($.trim(data.url) == 'user/photoupload') {
                    $("#photoUpload").parent().show();
                } else {
                    $("#photoUpload").parent().hide();
                }
            });
        }

        function del(id,obj) {
            if(!confirm("是否删除此接口？")) {
                return;
            }
            $.getJSON("${pageContext.request.contextPath}/api/apiTestController/delete?id="+id,function(data){
                alert("删除成功！");
                $(obj).parent().remove();
            });
        }
    </script>
</form>
<div style="display:none;">
    <form method="POST" id="uploadform" enctype="multipart/form-data">
        <input type="hidden" name="id" value="<%=bd.getId() %>">
        <input type="hidden" name="basetypeCode" value="<%=bd.getBasetypeCode() %>">
        <input type="file" name="iconFile" id="file"></td>
    </form>
</div>
</div>
</body>
</html>
