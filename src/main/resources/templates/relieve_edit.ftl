<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>员工调岗选择页面</title>
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
    <table>
        <tr>
            <td>
            选择转出网点:
            </td>
            <td>
        <select name="branameOne" id="branameOne" lay-search="" lay-verify="required" lay-filter="branameOne">
            <option value="">请选择网点</option>

        </select>

            </td>
    <td>
    选择转入网点
    </td>
            <td>
        <select name="branameTwo" id="branameTwo" lay-search="" lay-verify="required">
            <option value="">请选择网点</option>

        </select>
        </td>

    </tr>
    </table>
    <table class="layui-table" lay-even lay-skin="nob" id="demo" lay-filter="test"></table>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="shift">转移</a>
    </script>
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
            ,width:1050    //jquery的id选择器   也就是table的id
            ,height: 495
            ,url: '/userEdit/userSelect'     //数据接口
            ,title: '网点员工'
            ,page:true           //是否开启分页
            ,totalRow: true
            ,limit:10
            ,cols: [[ //表头
                {type: 'numbers'}
                ,{field: 'braname', title: '所属网点', width:250,totalRow: true}
                ,{field: 'truename', title: '真实姓名', width: 150, sort: true}
                ,{field: 'staphone', title: '手机', width:150, sort: true,totalRow: true}
                ,{field: 'staaddress', title: '住址', width:200, sort: true}
                ,{fixed: 'right', title: '操作', width:200, toolbar:'#barDemo'}
            ]]
            ,id:'listData'
        });
        $.ajax({
            url:"/relieveEdit/selAll",
            type:"post",
            dataType:"json",
            success: function (data) {
                $.each(data, function (index, item) {
                    $('#branameOne').append(new Option( item.braname,item.braid));// 下拉菜单里添加元素
                });
                layui.form.render("select");//重新渲染 固定写法
            }});

        form.on('select(branameOne)',function(data){

            console.info(data.value);
            var braid=data.value;
            $.ajax({
                url:'/express-project/userEdit/userSelect',
                method:'post',
                data:{
                    braid:braid

                },
                dataType:'JSON',
                success:function(data){

                },

            }) ;

            table.reload('listData', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                ,where: {
                    braid: braid
                }
            });

        })

        $.ajax({
            url:"/relieveEdit/findAllBra",
            type:"post",
            dataType:"json",
            success: function (data) {
                $.each(data, function (index, item) {
                    $('#branameTwo').append(new Option( item.braname,item.braid));// 下拉菜单里添加元素
                });
                layui.form.render("select");//重新渲染 固定写法
            }});

    //监听工具条
    table.on('tool(test)', function(obj){
        var data = obj.data;
        if(obj.event === 'shift'){
            var branameOne=$('#branameOne').val();
            var branameTwo=$('#branameTwo').val();
            var braname=data.braname;
            var truename=data.truename;
            var staid=data.staid;
            var name=data.truename;
            var iphone=data.staphone;
            var agobranch=$("#branameOne option:selected").text();
            var nowbranch=$("#branameTwo option:selected").text();
            var address=data.staaddress;

            if(branameOne==""){
                layer.msg('请选择转出网点！', {icon: 4});
            }else if (branameTwo==""){
                layer.msg('请选择转入网点！', {icon: 4});
            }
            else if(branameOne==branameTwo){
                layer.msg('转入转出网点名称不能一致！', {icon: 4});
            }else{
                $.ajax({
                    url:"/relieveEdit/selBrapin?braname="+braname+"&truename="+truename,
                    type:"post",
                    dataType:"json",
                    success: function (data) {
                        if(data==1){
                            layer.confirm('此人为该网点负责人，确定转移吗？', function (index) {
                                $.post("/relieveEdit/updateBranch",{'braid':branameTwo,'staid':staid,'name':name,'agobranch':agobranch,'nowbranch':nowbranch,'iphone':iphone,'address':address},function(result)
                                    {
                                        layer.msg("转移成功！", {
                                            icon: 6,
                                            time: 1000 //2秒关闭（如果不配置，默认是3秒）
                                        }, function(){
                                            //刷新父页面
                                            window.location.reload();
                                        });
                                    }
                                );
                            });

                        }else if(data==2){
                            layer.confirm('确定转移吗？', function (index) {
                                $.post("/relieveEdit/updateBranch",{'braid':branameTwo,'staid':staid,'name':name,'agobranch':agobranch,'nowbranch':nowbranch,'iphone':iphone,'address':address},function(data)
                                    {
                                        if(data==1){
                                            layer.msg("转移成功！", {
                                                icon: 6,
                                                time: 1000 //2秒关闭（如果不配置，默认是3秒）
                                            }, function(){
                                                //刷新父页面
                                                window.location.reload();
                                            });
                                        }

                                    }
                                );
                            });
                        }

                    }});

            }



        }
    }
    );
    });

</script>



</html>