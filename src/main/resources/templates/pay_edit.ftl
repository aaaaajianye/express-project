<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>快递类型维护</title>
    <!--引入css文件-->
    <link rel="stylesheet" href="${basePath!}/static/layui/css/layui.css" media="all" />
    <!--引入js-->

    <script type="text/javascript" src="${basePath!}/static/layui/layui.js"></script>
    <script type="text/javascript" src="${basePath!}/static/js/cache.js"></script>
    <script type="text/javascript" src="${basePath!}/static/js/jquery-2.1.3.min.js"></script>
</head>
<body>
<div style="padding: 20px; background-color: #F2F2F2;">
    <form class="layui-form" action="">
        <div class="layui-inline">
            <div class="layui-form-item">
               <fieldset class="layui-elem-field site-demo-button" style="margin-top: 30px;">
                    <div>
                        <button class="layui-btn layui-btn-normal" type="button" id="add">添加</button>

                    </div>
                </fieldset>

            </div>
            <table class="layui-table" lay-even lay-skin="nob" id="demo" lay-filter="test"></table>
            <script type="text/html" id="barDemo">
                <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="del">删除</a>
            </script>

        </div>
    </form>





</div>
</body>

<script type="text/javascript">
    layui.use(['laydate', 'laypage', 'layer', 'table','form'], function(){
        var laydate = layui.laydate //日期
                ,laypage = layui.laypage //分页
                ,layer = layui.layer //弹层
                ,table = layui.table //表格
                ,form = layui.form
                ,select=layui.select;

        //执行一个 table 实例     render 渲染,显示
        table.render({
            elem:'#demo'
            ,width:1250    //jquery的id选择器   也就是table的id
            ,height: 495
            ,url: '/payEdit/selAll'     //数据接口
            ,title: '快递类型维护'
            ,totalRow: true
           ,limit:10
            ,cols: [[ //表头
                {field: 'payid', title: '序号'}
                ,{field: 'paytype', title: '支付方式'}
                ,{field: 'paynode', title: '备注'}
                ,{field: 'paytime', title: '创建时间', totalRow: true}

                ,{fixed: 'right', title: '操作', width:150, toolbar:'#barDemo'}
            ]]
            ,id:'listData'
        });
        //监听工具条
        table.on('tool(test)', function(obj){
            var data = obj.data;
            if(obj.event === 'del'){
                layer.confirm('真的要删除吗？', function (index) {
                    $.post("/payEdit/delPay",{'payid':data.payid},function(result)
                            {
                                layer.msg(result.msg, {
                                    icon: 1,
                                    time: 1000 //2秒关闭（如果不配置，默认是3秒）
                                }, function(){
                                    //刷新父页面
                                    window.location.reload();
                                });
                            }
                    );
                });
            }
        });


    });

</script>
<script type="text/javascript">

    $('#add').on('click',function(){
        layui.use('layer', function() {

            var layer = layui.layer;
            layer.open({
                type: 2,
                skin: 'layui-layer-rim', //加上边框
                area: ['840px', '480px'], //宽高
                content: "/payEdit/add",
                end: function () {
                    location.reload();
                }
            });

        });



    })
</script>
</html>