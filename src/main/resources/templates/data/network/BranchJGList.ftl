<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>审核结果</title>
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
                <td>网点编号</td>
                <td><input class="layui-input" name="bracode" id="bracode" autocomplete="off" ></td>
                <td><button class="layui-btn" data-type="reload" id="sou">搜索</button></td>
            </tr>
        </table>
    </div>
</div>
    <table class="layui-table" lay-even lay-skin="nob" id="demo" lay-filter="test">
    </table>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="hkjl">修改</a>
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="hkjh">删除</a>
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
            ,url: '/admin/network/branchJGselect'     //数据接口
            //,where:{loanId:$("#loanId").val()}
            ,title: '类型维护'
            ,page:true           //是否开启分页
            ,totalRow: true
            ,limit:10
            ,cols: [[ //表头
                {type: 'numbers', title: '序列'}
                ,{field: 'bracode', title: '网点编号'}
                ,{field: 'braname', title: '网点名称',totalRow: true}
                ,{field: 'brasuoshu', title: '所属网点', totalRow: true}
                ,{field: 'braremark', title: '备注',totalRow: true}
                ,{field: 'bratime', title: '申请时间',totalRow: true}
                ,{field: 'state', title: '状态',totalRow: true,templet: function(d){
                        if(d.state==2){
                            d.state="已审核";
                        }
                        else if(d.state==3){
                            d.state="未提交";
                        }
                        else if(d.state==1){
                            d.state="待审核";
                        }

                        return d.state;}}
                ,{field: 'reason', title: '驳回理由',totalRow: true}
                ,{fixed: 'right',title: '操作',align:'center', toolbar: '#barDemo'}
            ]]
            ,id:'listData'
        });


        table.on('tool(test)', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            layEvent = obj.event;
            if (layEvent === "hkjl") {

                if(data.state==1||data.state==2){
                    layer.msg("此信息不能进行修改",{
                        icon: 5,
                        time: 1000 //2秒关闭（如果不配置，默认是3秒）
                    })
                }else {
                    layer.open({
                        title: '修改信息',
                        type: 2,
                        scrollbar: false,
                        area: ['700px', '560px'],
                        closeBtn: 2,
                        content: "/admin/network/updateSQList?bracode=" + data.bracode,
                        end: function () {
                            location.reload();
                        }
                    });
                }
            }
            if (layEvent == "hkjh") {

                layer.confirm('确认删除', function (index) {
                    $.post("/admin/network/delSQ",{'bracode':data.bracode},function(result)
                        {
                            layer.msg(result.msg, {
                                icon: 1,
                                time: 100 //2秒关闭（如果不配置，默认是3秒）
                            }, function(){
                                //刷新父页面
                                window.location.reload();
                            });
                        }
                    );
                });
            }
        })

        var $ = layui.$;
        $('#sou').on('click', function(){
            var bracode = $('#bracode');

            //执行重载
            table.reload('listData', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                ,where: {
                    bracode: bracode.val()
                }
            });
        });
    })
</script>
</html>