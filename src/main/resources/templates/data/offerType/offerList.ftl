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
    <table class="layui-table" lay-even lay-skin="nob" id="demo" lay-filter="test">
    </table>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="hkjl">修改</a>
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
            ,width:1300    //jquery的id选择器   也就是table的id
            ,height:550
            ,url: '/admin/offertype/select'     //数据接口
            //,where:{loanId:$("#loanId").val()}
            ,title: '类型维护'
            ,totalRow: true
            ,cols: [[ //表头
                {type: 'numbers', title: '序列', width:250}
                ,{field: 'offertype', title: '类型名称', width:250}
                ,{field: 'offerprice', title: '价格', width:250,totalRow: true}
                ,{field: 'offerremark', title: '备注', width:250,totalRow: true}
                ,{fixed: 'right',title: '操作', width: 250, align:'center', toolbar: '#barDemo'}
            ]]
        });


        table.on('tool(test)', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            layEvent = obj.event;
            if (layEvent === "hkjl") {
                layer.open({
                    title: '修改信息',
                    type: 2,
                    area: ['400px', '300px'],
                    closeBtn: 2,
                    content: "/admin/offertype/update?offtyid="+data.offtyid,
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