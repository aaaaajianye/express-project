<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>签收单查询</title>
    <!--引入css文件-->
    <link rel="stylesheet" href="${basePath!}/static/layui/css/layui.css" media="all"/>
    <!--引入js-->

    <script type="text/javascript" src="${basePath!}/static/layui/layui.js"></script>
    <script type="text/javascript" src="${basePath!}/static/js/cache.js"></script>
    <script type="text/javascript" src="${basePath!}/static/js/jquery-2.1.3.min.js"></script>
</head>
<body>
<div style="width: 100%">
    <div class="layui-inline">
        <table>
            <tr>
                <td>订单编号：</td>
                <td><input class="layui-input" name="expnum" id="expnum" autocomplete="off"></td>
                <td>姓名：</td>
                <td><input class="layui-input" name="recipient" id="recipient" autocomplete="off"></td>
                <td>手机号：</td>
                <td><input class="layui-input" name="recphone" id="recphone" autocomplete="off"></td>
                <td>
                    <button class="layui-btn" data-type="reload" id="sou">搜索</button>
                </td>
                <td><input class="layui-input" name="braname" id="braname" autocomplete="off" placeholder="请输入网点名称">
                </td>
                <td>
                    <button class="layui-btn" data-type="reload" id="search">检索负责人</button>
                </td>
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
    layui.use(['upload', 'table', 'form'], function () {
        var table = layui.table;
        var upload = layui.upload;
        var form = layui.form;
        table.render({
            elem: '#demo'
            , url: '/expressdetailsEdit/selExpressdetails'     //数据接口
            //,where:{loanId:$("#loanId").val()}
            , title: '类型维护'
            , page: true           //是否开启分页
            , totalRow: true
            , limit: 10
            , cols: [[ //表头
                //{field: 'expid', title: '序号', width: 90}
                {type: 'numbers'}
                , {field: 'expnum', title: '运单编号', width: 90}
                , {field: 'custrank', title: '客户级别', width: 100}

                , {field: 'sender', title: '寄件人姓名', width: 100}
                , {field: 'sendphone', title: '寄件人电话', width: 130}
                , {field: 'recipient', title: '收件人姓名', width: 100}
                , {field: 'recphone', title: '收件人电话', width: 130}
                , {field: 'exptime', title: '寄件时间', width: 210}
                , {
                    field: 'Expstate', title: '运单状态', width: 100, templet: function (s) {
                        if (s.Expstate == 3) {
                            s.Expstate = "已签收";
                        } else if (s.Expstate == 0) {
                            s.Expstate = "待抢单";
                        } else if (s.Expstate == 1) {
                            s.Expstate = "已抢单";
                        } else if (s.Expstate == 2) {
                            s.Expstate = "运输中";
                        } else if (s.Expstate == 4) {
                            s.Expstate = "问题单";
                        } else if (s.Expstate == 5) {
                            s.Expstate = "已到件";
                        } else if (s.Expstate == 10) {
                            s.Expstate = "订单取消";
                        } else if (s.Expstate == 11) {
                            s.Expstate = "问题单已处理";
                        }
                        return s.Expstate;
                    }
                }
                , {fixed: 'right', title: '操作', align: 'center', width: 200, toolbar: '#barDemo'}
            ]]
            , id: 'listData'
        });
        table.on('tool(test)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            layEvent = obj.event;
            if (layEvent === "hkjl") {
                layer.open({
                    title: '物流信息',
                    type: 2,
                    scrollbar: false,
                    area: ['700px', '570px'],
                    closeBtn: 2,
                    content: "/expressdetailsEdit/update?expnum=" + data.expnum,
                    end: function () {
                        location.reload();
                    }

                });
            }
        });
        var $ = layui.$;
        $('#sou').on('click', function () {
            var expnum = $('#expnum');
            var recipient = $('#recipient');
            var recphone = $('#recphone');
            //执行重载
            table.reload('listData', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                ,where: {
                    expnum: expnum.val(),
                    recipient: recipient.val(),
                    recphone: recphone.val(),
                }
            });
        });

    })
</script>
<script type="text/javascript">

    $('#search').on('click', function () {
        var braname = $('#braname').val();
        if (braname==""){
            layer.msg('请输入网点名称！', {icon: 4});
        } else {
        layui.use('layer', function () {

            var layer = layui.layer;


            layer.open({
                type: 2,
                skin: 'layui-layer-rim', //加上边框
                area: ['840px', '480px'], //宽高
                content: "/expressdetailsEdit/selBranch?braname=" + braname,
                end: function () {
                    location.reload();
                }
            });

        });
        }

    })
</script>
</html>