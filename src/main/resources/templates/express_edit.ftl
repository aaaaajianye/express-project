<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>签收单查询</title>
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
                <div class="layui-input-inline">
                    <input id="expnum" name="expnum" class="layui-input" type="text" placeholder="请输入运单编号" autocomplete="off" lay-verify="required" >
                </div>
               <fieldset class="layui-elem-field site-demo-button" style="margin-top: 30px;">
                    <div>
                        <button class="layui-btn layui-btn-normal" type="button" id="search" data-type="reload">搜索</button>

                    </div>
                </fieldset>

            </div>
            <table class="layui-table" lay-even lay-skin="nob" id="demo" lay-filter="test"></table>
            <script type="text/html" id="barDemo">
                <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="sel">查看</a>
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
            ,url: '/expressSel/selAll'     //数据接口
            ,title: '签收单查询'
            ,totalRow: true
           ,limit:10
            ,cols: [[ //表头
                //{field: 'expid', title: '序号', width:90}
                {type: 'numbers'}
                ,{field: 'expnum', title: '运单编号'}
                ,{field: 'custrank', title: '客户级别'}
                ,{field: 'braname', title: '寄件人网点'}
                ,{field: 'sender', title: '寄件人姓名'}
                ,{field: 'sendphone', title: '寄件人电话'}
                ,{field: 'itemtype', title: '物品类型'}
                ,{field: 'itemweight', title: '重量(kg)'}
                ,{field: 'exptime', title: '寄件时间'}
                ,{field: 'Expstate', title: '运单状态', templet:function (s) {
                        if(s.Expstate==3){
                            s.Expstate="已签收";
                        }
                        return s.Expstate;
                    }}

                ,{fixed: 'right', title: '操作', width:150, toolbar:'#barDemo'}
            ]]
            ,id:'listData'
        });
        //监听工具条
        table.on('tool(test)', function(obj){
            var data = obj.data;
            if(obj.event === 'sel'){
                layer.open({
                    type: 2, //layer的5种层类型   0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
                    title: ['详情', 'font-size:18px;'],  //弹出框标题
                    shade: [0.5, '#393D49'],     //遮罩层
                    shadeClose:true,          //点击遮罩层外区域关闭遮罩层
                    area: ['780px', '500px'],    //弹出框大小
                    anim: 1,              //弹出动画
                    content:'/expressSel/sel?expid='+data.expid,
                    end: function () {
                        location.reload();
                    }

                });
            }
        });
        var $ = layui.$;
        $('#search').on('click', function(){
            var expnum = $('#expnum');
            //执行重载
            table.reload('listData', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                ,where: {
                    expnum: expnum.val()
                }
            });
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
                content: "/expEdit/add",
                end: function () {
                    location.reload();
                }
            });

        });



    })
</script>
</html>