<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>运单维护</title>
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
                <td>订单编号：</td>
                <td><input class="layui-input" name="expnum" id="expnum" autocomplete="off" ></td>
                <td><button class="layui-btn" data-type="reload" id="sou">搜索</button></td>
            </tr>
        </table>
    </div>
</div>
    <table class="layui-table" lay-even lay-skin="nob" id="demo" lay-filter="test">
    </table>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="hkjl">修改</a>
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
    layui.use(['upload','table','form','layer'], function(){
        var table = layui.table;
        var upload=layui.upload;
        var form=layui.form;
        var layer=layui.layer;
        table.render({
            elem:'#demo'
            ,width:1300    //jquery的id选择器   也就是table的id
            ,height:510
            ,url: '/admin/express/select'     //数据接口
            //,where:{loanId:$("#loanId").val()}
            ,title: '运单维护'
            ,page:true           //是否开启分页
            ,totalRow: true
            ,limit:10
            ,cols: [[ //表头
                {type: 'numbers', title: '序列'}
                ,{field: 'expnum', title: '运单编号'}
                ,{field: 'sender', title: '寄件人姓名',totalRow: true}
                ,{field: 'sendphone', title: '寄件人电话',totalRow: true}
                ,{field: 'recipient', title: '收件人姓名',totalRow: true}
                ,{field: 'recphone', title: '收件人电话',totalRow: true}
                ,{field: 'custrank', title: '客户级别',totalRow: true ,templet: function(d){
            if(d.custrank==1){
                d.custrank="普通客户";
            }
            else if(d.custrank==2){
                d.custrank="高级客户";
            }
            return d.custrank;}}
                ,{field: 'exptype', title: '快递类型',totalRow: true}
                ,{field: 'sendprovince', title: '寄件省份', totalRow: true}
                ,{field: 'recprovince', title: '收件省份',totalRow: true}
                ,{field: 'Expstate', title: '运单状态', totalRow: true,templet: function(d){
                            if(d.Expstate==0){
                                d.Expstate="代抢单";
                            }
                             else if(d.Expstate==1){
                                d.Expstate="已抢单";
                            }
                            else if(d.Expstate==2){
                                d.Expstate="运输中";
                            }
                            else if(d.Expstate==3){
                                d.Expstate="已签收";
                            }
                            else if(d.Expstate==4){
                                d.Expstate="问题单";
                            }else if (d.Expstate=11){
                                d.Expstate='已处理'
                            }
                            return d.Expstate;}}
                ,{field: 'true_name', title: '录单人', totalRow: true,templet: function(d){
                        if(d.true_name==null || d.true_name==""){
                            d.true_name="无";
                        } return d.true_name;}}
                ,{fixed: 'right',title: '操作', align:'center', toolbar: '#barDemo'}
            ]]
            ,id:'listData'
        });


        table.on('tool(test)', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            layEvent = obj.event;
            if (layEvent === "hkjl") {

                if(data.Expstate==11||data.Expstate==3||data.Expstate==4){
                    layer.msg("此单不能进行修改",{
                        icon: 5,
                        time: 1000 //2秒关闭（如果不配置，默认是3秒）
                    })
                }else{
                    layer.open({
                        title: '修改信息',
                        type: 2,
                        scrollbar: false,
                        area: ['700px', '500px'],
                        closeBtn: 2,
                        content: "/admin/express/update?expnum="+data.expnum,
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

            }
        })

        var $ = layui.$;
        $('#sou').on('click', function(){
            var expnum = $('#expnum');
            //执行重载
            table.reload('listData', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                ,where: {
                    expnum: expnum.val(),
                }
            });
        });
    })
</script>
</html>