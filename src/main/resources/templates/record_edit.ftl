<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>员工调岗</title>
    <!--引入css文件-->
    <link rel="stylesheet" href="${basePath!}/static/layui/css/layui.css" media="all" />
    <!--引入js-->

    <script type="text/javascript" src="${basePath!}/static/layui/layui.js"></script>
    <script type="text/javascript" src="${basePath!}/static/js/cache.js"></script>
    <script type="text/javascript" src="${basePath!}/static/js/jquery-2.1.3.min.js"></script>
</head>
<body>
<form class="layui-form" action="" lay-filter="example">
<div class="layui-inline">
    <form class="layui-form" action="">

        <table class="layui-table" lay-even lay-skin="nob" id="demo" lay-filter="test"></table>
    </form>
</div>

</form>





</body>
<script>
    layui.use(['form', 'layedit', 'laydate','table'], function(){
        var form = layui.form
                ,layer = layui.layer
                ,layedit = layui.layedit
                ,table = layui.table //表格
                ,laydate = layui.laydate
                ,select=layui.select;

        table.render({
            elem:'#demo'
            ,width:1250    //jquery的id选择器   也就是table的id
            ,height: 495
            ,url: '/recordEdit/selAll'     //数据接口
            ,title: '员工调岗'
            ,page:true           //是否开启分页
            ,totalRow: true
            ,limit:10
            ,cols: [[ //表头
                {type: 'numbers'}
                ,{field: 'nowbranch', title: '现属网点',totalRow: true}
                ,{field: 'agobranch', title: '前任网点',totalRow: true}
                ,{field: 'name', title: '真实姓名',  sort: true}
                ,{field: 'iphone', title: '手机', sort: true,totalRow: true}
                ,{field: 'address', title: '住址',  sort: true}
                ,{field: 'shijian', title: '时间',  sort: true}
            ]]
            ,id:'listData'
        });







    });
</script>



</html>