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
    <button type="button" class="layui-btn" id="tianjia">添加信息</button>
    <table class="layui-table" lay-even lay-skin="nob" id="demo" lay-filter="test">
    </table>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="hkjl">修改</a>
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="hkjh">删除</a>
    </script>
</div>
</body>
<script type="text/javascript">


    $('#tianjia').on('click',function () {
        layui.use('layer',function () {
            var layer=layui.layer;
            layer.open({
                type:2,
                area:['600px','470px'],
                content:"/admin/pushmoney/inserturl"
            })
        })
    })


    layui.use(['upload','table','form'], function(){
        var table = layui.table;
        var upload=layui.upload;
        var form=layui.form;

        table.render({
            elem:'#demo'
            ,url: '/admin/pushmoney/select'     //数据接口
            //,where:{loanId:$("#loanId").val()}
            ,title: '提成维护'
            ,totalRow: true
            ,cols: [[ //表头
                {type: 'numbers', title: '序列'}
                ,{field: 'brarank', title: '网点等级'}
                ,{field: 'enroll', title: '录单提成'}
                ,{field: 'addressee', title: '收件提成'}
                ,{field: 'addresser', title: '发件提成'}
                ,{field: 'dao', title: '到件提成'}
                ,{field: 'pai', title: '派件提成'}
                ,{field: 'qian', title: '签收提成'}
                ,{fixed: 'right',title: '操作', align:'center', toolbar: '#barDemo'}
            ]]
        });
    // ,templet: function(d){
    //         if(d.commission==1){
    //             d.commission="一级网点";
    //         }
    //         else if(d.commission==2){
    //             d.commission="二级网点";
    //         }
    //         else if(d.commission==3){
    //             d.commission="三级网点";
    //         }
    //         else if(d.commission==4){
    //             d.commission="四级网点";
    //         }
    //         else if(d.commission==5){
    //             d.commission="五级网点";
    //         }
    //         else if(d.commission==6){
    //             d.commission="六级网点";
    //         }
    //         return d.commission;}

        table.on('tool(test)', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            layEvent = obj.event;
            if (layEvent === "hkjl") {
                layer.open({
                    title: '修改信息',
                    type: 2,
                    area: ['600px', '470px'],
                    closeBtn: 2,
                    content: "/admin/pushmoney/update?pushid="+data.pushid,
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
            if (layEvent == "hkjh") {

                layer.confirm('真的要删除吗？', function (index) {
                    $.post("/admin/pushmoney/del",{'pushid':data.pushid},function(result)
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


        form.on('submit(tj)', function(data){
            // var provid= document.getElementById("provid").title;
            // var cityid= document.getElementById("cityid").title;
            // var areaid= document.getElementById("areaid").title;
            // alert(provid,cityid,areaid);
            $.ajax({
                url:'/admin/network/insertbranch',
                method:'post',
                data:{bracode:$("#bracode").val(),
                    braname:$("#braname").val(),

                    provid:$("#provid option:selected").text(),
                    cityid:$("#cityid option:selected").text(),
                    areaid:$("#areaid option:selected").text(),
                    braaddress:$("#braaddress").val(),
                    braprincipal:$("#braprincipal").val(),
                    braphone:$("#braphone").val(),
                    braremark:$("#braremark").val()
                },
                dataType:'JSON',
                success:function(res){
                    if(res.code='0'){

                        window.location.reload();
                    }
                    else
                        alert(res.msg);
                },
                error:function (data) {

                }
            }) ;

        });
    })
</script>
</html>