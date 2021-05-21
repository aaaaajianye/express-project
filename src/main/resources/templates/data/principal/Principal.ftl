<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>网点审核</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">

    <link rel="stylesheet" href="${basePath!}/static/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="${basePath!}/static/css/public.css" media="all" />
    <script src="${basePath!}/static/js/jquery.min.js" type="text/javascript"></script>
    <script src="${basePath!}/static/jqgrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>
    <script src="${basePath!}/static/layui/layui.js" type="text/javascript"></script>
    <script type="text/javascript" src="${basePath!}/static/js/data.js" ></script>
    <script type="text/javascript" src="${basePath!}/static/js/province.js" ></script>
</head>
<body>
<div style="width: 380px; height: 150px;" >
        <form class="layui-form" action="" method="post" >
            <table style="border: 1px">
                <tr >
                    <td style="width: 150px;">网点编号</td>
                    <td style="width: 150px;"><input type="text" name="bracode" id="bracode" value="${bracode}"  autocomplete="off" class="layui-input" onfocus=this.blur()></td>
                </tr>
                <tr>
                    <td style="width: 150px;">负责人</td>
                    <td style="width: 150px; margin-bottom: 10px">
                        <select name="type" id="type">
                            <#list tuserTwos as tT>
                                <option>${tT.truename}</option>
                            </#list>
                        </select></td>
                </tr>
                <tr>
                    <td style="row-span: 2">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit lay-filter="tj">确认添加</button>
                        </div>
                    </td>
                </tr>
            </table>
        </form>
</div>

</div>
</body>
<script type="text/javascript">
    layui.use(['upload','table','form'], function(){
        var table = layui.table;
        var upload=layui.upload;
        var form=layui.form;

        form.on('submit(tj)', function(data) {
            $.ajax({
                url: '/admin/principal/instuser',
                method: 'post',
                data: {
                    bracode: $("#bracode").val(),
                    typetext: $("#type :selected").text(),
                },
                dataType: 'JSON',
                success: function (res) {
                    if (res.code = '0') {

                        parent.window.location.reload();
                    } else
                        alert(res.msg);
                },
                error: function (data) {

                }
            });
            parent.window.location.reload();
        })

    })
</script>
</html>