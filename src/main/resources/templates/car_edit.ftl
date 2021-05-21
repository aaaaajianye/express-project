<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>车辆维护</title>
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
                    <input id="vehdirver" name="vehdirver" class="layui-input" type="text" placeholder="请输入司机姓名" autocomplete="off" lay-verify="required" >
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
            ,url: '/carEdit/selCar'     //数据接口
            ,title: '车辆维护'
            ,page:true           //是否开启分页
            ,totalRow: true
           ,limit:10
            ,cols: [[ //表头
                //{field: 'vehid', title: '序号', width:90}
                {type: 'numbers'}
                //,{field: 'vehids', title: '车辆编号'}
                ,{field: 'vehnum', title: '车牌号', totalRow: true}
                ,{field: 'vehmodal', title: '车辆型号',  sort: true}
                ,{field: 'typename', title: '运输类型',  sort: true,totalRow: true}
                ,{field: 'vehtunnage', title: '核定载重',  sort: true}
                ,{field: 'vehilo', title: '百公里耗油',  sort: true}
                ,{field: 'vehdirver', title: '司机',  sort: true}
                ,{field: 'vehphone', title: '司机电话',  sort: true}
                ,{field: 'vehtime', title: '创建时间',  sort: true}
                ,{field: 'vehnode', title: '备注',  sort: true}
                ,{field: 'vehstate', title: '车辆状态',  sort: true, templet:function (s) {
                        if(s.vehstate==0){
                            s.vehstate="空闲";
                        }else
                        {
                            s.vehstate="运输中";
                        }
                        return s.vehstate;
                    }}
                ,{field: 'braname', title: '所属网点',  sort: true}
                ,{fixed: 'right', title: '操作', width:150, toolbar:'#barDemo'}
            ]]
            ,id:'listData'
        });
        //监听工具条
        table.on('tool(test)', function(obj){
            var data = obj.data;
            if(obj.event === 'del'){
                if(data.vehstate==1){
                    layer.msg('运输状态禁止删除！', {icon: 4});
                }else{

                layer.confirm('真的要删除吗？', function (index) {
                    $.post("/carEdit/delCar",{'vehid':data.vehid},function(result)
                            {
                                layer.msg("删除成功！", {
                                    icon: 6,
                                    time: 1000 //2秒关闭（如果不配置，默认是3秒）
                                }, function(){
                                    //刷新父页面
                                    window.location.reload();
                                });
                            }
                    );
                });
                }
            } else if(obj.event === 'edit'){
                if(data.vehstate==1){
                    layer.msg('运输状态禁止编辑！', {icon: 4});
                }else{
                layer.open({
                    type: 2, //layer的5种层类型   0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
                    title: ['修改数据', 'font-size:18px;'],  //弹出框标题
                    shade: [0.5, '#393D49'],     //遮罩层
                    shadeClose:true,          //点击遮罩层外区域关闭遮罩层
                    area: ['580px', '500px'],    //弹出框大小
                    anim: 1,              //弹出动画
                    content:'/carEdit/selCarTwo?vehid='+data.vehid,
                    end: function () {
                        location.reload();
                    }

                });
                }
            }
        });
        var $ = layui.$;
        $('#search').on('click', function(){
            var vehdirver = $('#vehdirver');
            //执行重载
            table.reload('listData', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                ,where: {
                    vehdirver: vehdirver.val()
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
                content: "/carEdit/add",
                end: function () {
                    location.reload();
                }
            });

        });



    })
</script>
</html>