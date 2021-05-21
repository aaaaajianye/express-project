<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
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
<div style="width: 100%">
    <div class="layui-inline">
        <table>
            <tr>
                <td>订单编号：</td>
                <td><input class="layui-input" name="expnum" id="expnum" autocomplete="off" ></td>
                <td>姓名：</td>
                <td><input class="layui-input" name="sender" id="sender" autocomplete="off" ></td>
                <td>手机号：</td>
                <td><input class="layui-input" name="sendphone" id="sendphone" autocomplete="off" ></td>
                <td><button class="layui-btn" data-type="reload" id="sou">搜索</button></td>
            </tr>
        </table>
    </div>
    <table class="layui-table" lay-even lay-skin="nob" id="demo" lay-filter="test">
    </table>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="hkjl">查看物流信息</a>
    </script>
</div>
</body>
<script type="text/javascript">
    layui.use(['upload','table','form'], function(){
        var table = layui.table;
        var upload=layui.upload;
        var form=layui.form;

        table.render({
            elem:'#demo'
            ,url: '/admin/expressdetails/select'     //数据接口
            //,where:{loanId:$("#loanId").val()}
            ,title: '类型维护'
            ,page:true           //是否开启分页
            ,totalRow: true
            ,limit:10
            ,cols: [[ //表头
                {type: 'numbers', title: '序列'}
                ,{field: 'expnum', title: '运单编号'}
                ,{field: 'sender', title: '姓名',totalRow: true}
                ,{field: 'sendphone', title: '电话',totalRow: true}
                ,{fixed: 'right',title: '操作', align:'center', toolbar: '#barDemo'}
            ]]
            ,id:'listData'
        });


        table.on('tool(test)', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            layEvent = obj.event;
            if (layEvent === "hkjl") {
                layer.open({
                    title: '物流信息',
                    type: 2,
                    scrollbar: false,
                    area: ['700px', '570px'],
                    closeBtn: 2,
                    content: "/admin/expressdetails/update?expnum="+data.expnum,
                    end: function () {
                        location.reload();
                    }
                    // cancel: function (index, layero) {
                    //
                    //     window.location.reload();
                    //
                    //     return false;
                    // }
                });
            }
        })
        var $ = layui.$;
        $('#sou').on('click', function(){
            var expnum = $('#expnum');
            var sender = $('#sender');
            var sendphone = $('#sendphone');
            //执行重载
            table.reload('listData', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                ,where: {
                    expnum: expnum.val(),
                    sender: sender.val(),
                    sendphone: sendphone.val(),
                }
            });
        });
    })
</script>
</html>