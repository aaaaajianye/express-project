<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>员工维护</title>
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
                <input id="truename" name="truename" class="layui-input" type="text" placeholder="请输入员工名称" autocomplete="off" lay-verify="required" >
            </div>


            <fieldset class="layui-elem-field site-demo-button" style="margin-top: 30px;">
                <div>
                    <button class="layui-btn layui-btn-normal" type="button" id="search" data-type="reload">搜索</button>
                    <button class="layui-btn layui-btn-normal" type="button" id="add">添加</button>

                </div>
            </fieldset>

        </div>
        <table class="layui-table" lay-even lay-skin="nob" id="demo" lay-filter="test"></table>
        <script type="text/html" id="barDemo">
  				<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">编辑</a>

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
            ,url: '/userEdit/userSelect'     //数据接口
            ,title: '员工维护'
            ,page:true           //是否开启分页
            ,totalRow: true
            ,limit:10      //每页显示的条数
            ,cols: [[ //表头
                //{field: 'id', title: '编号', width:90}
                {type: 'numbers'}
                ,{field: 'braname', title: '所属网点', totalRow: true}
                ,{field: 'truename', title: '真实姓名',  sort: true}
                ,{field: 'staphone', title: '手机',  sort: true,totalRow: true}
                ,{field: 'staaddress', title: '住址',  sort: true}
                ,{fixed: 'right', title: '操作',  toolbar:'#barDemo'}
            ]]
            ,id:'listData'
        });
        //监听工具条
        table.on('tool(test)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                layer.msg('ID：'+ data.id + ' 的查看操作');
            } else if(obj.event === 'del'){
                layer.confirm('真的要删除吗？', function (index) {
                    $.post("/userEdit/del",{'id':data.id},function(result)
                            {
                                layer.msg("删除成功！", {
                                    icon: 1,
                                    time: 1000 //2秒关闭（如果不配置，默认是3秒）
                                }, function(){
                                    //刷新父页面
                                    window.location.reload();
                                });
                            }
                    );
                });
            } else if(obj.event === 'edit'){
                layer.open({
                    type: 2, //layer的5种层类型   0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
                    title: ['修改数据', 'font-size:18px;'],  //弹出框标题
                    shade: [0.5, '#393D49'],     //遮罩层
                    shadeClose:true,          //点击遮罩层外区域关闭遮罩层
                    area: ['580px', '500px'],    //弹出框大小
                    anim: 1,              //弹出动画
                    content:'/userEdit/seluser?id='+data.id,
                    end: function () {
                        location.reload();
                    }

                });
            }
        });

        var $ = layui.$;
        $('#search').on('click', function(){
            var truename = $('#truename');
            //执行重载
            table.reload('listData', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                ,where: {
                    truename: truename.val()
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
                content: "/userEdit/tolist",
                end: function () {
                    location.reload();
                }
            });

        });



    })
</script>
</html>