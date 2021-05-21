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
                area:['700px','500px'],
                content:"/admin/offer/inserturl"
            })
        })
    })
    layui.use(['upload','table','form'], function(){
        var table = layui.table;
        var upload=layui.upload;
        var form=layui.form;

        table.render({
            elem:'#demo'
            ,width:1300    //jquery的id选择器   也就是table的id
            ,height:510
            ,url: '/admin/offer/select'     //数据接口
            //,where:{loanId:$("#loanId").val()}
            ,title: '类型维护'
            ,page:true           //是否开启分页
            ,totalRow: true
            ,limit:10
            ,cols: [[ //表头
                {type: 'numbers', title: '序列', width:70}
                ,{field: 'offersend', title: '寄件区域', width:150}
                ,{field: 'offergoal', title: '目的区域', width:150,totalRow: true}
                ,{field: 'offerprice', title: '价钱(一公斤以内)', width:100,totalRow: true}
                ,{field: 'offerprice2', title: '续重价钱(一公斤以上每斤的价钱)', width:100,totalRow: true}
                ,{field: 'offertime', title: '创建时间', width:150,totalRow: true}
                ,{field: 'custrank', title: '客户级别', width:150,totalRow: true ,templet: function(d){
            if(d.custrank==1){
                d.custrank="普通客户";
            }
            else if(d.custrank==2){
                d.custrank="高级客户";
            }
            return d.custrank;}}
                ,{field: 'offerday', title: '预计送达天数', width:150,totalRow: true}
                ,{fixed: 'right',title: '操作', width: 250, align:'center', toolbar: '#barDemo'}
            ]]
            ,id:'listData'
        });


        table.on('tool(test)', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            layEvent = obj.event;
            if (layEvent === "hkjl") {
                layer.open({
                    title: '修改信息',
                    type: 2,
                    scrollbar: false,
                    area: ['400px', '300px'],
                    closeBtn: 2,
                    content: "/admin/offer/update?offerid="+data.offerid,
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
                    $.post("/admin/offer/del",{'offerid':data.offerid},function(result)
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
        var $ = layui.$;
        $('#sou').on('click', function(){
            var offersend = $('#offersend');
            var offergoal = $('#offergoal');
            //执行重载
            table.reload('listData', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                ,where: {
                    offergoal: offersend.val(),
                    offergoal: offergoal.val(),
                }
            });
        });
    })
</script>
</html>