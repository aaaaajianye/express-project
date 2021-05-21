<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>投诉记录</title>
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
                    <input id="comexpnum" name="comexpnum" class="layui-input" type="text" placeholder="请输入运单编号" autocomplete="off" lay-verify="required" >
                </div>
                <fieldset class="layui-elem-field site-demo-button" style="margin-top: 30px;">
                    <div>
                        <button class="layui-btn layui-btn-normal" type="button" id="search" data-type="reload">搜索</button>

                    </div>
                </fieldset>

            </div>
        </div>
        <table class="layui-table" lay-even lay-skin="nob" id="demo" lay-filter="test"></table>
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

        table.render({
            elem:'#demo'
            ,width:1250    //jquery的id选择器   也就是table的id
            ,height: 495
            ,url: '/complaintsEdit/toList'     //数据接口
            ,title: '投诉记录'
            ,page:true           //是否开启分页
            ,totalRow: true
            ,limit:10
            ,cols: [[ //表头
                {type: 'numbers'}
                ,{field: 'combranch', title: '被投诉网点', totalRow: true}
                ,{field: 'comtuser', title: '被投诉员工',  sort: true}
                ,{field: 'comexpnum', title: '投诉单号',  sort: true,totalRow: true}
                ,{field: 'comfinemoney', title: '罚款金额',  sort: true}
                ,{field: 'comcontent', title: '投诉内容',  sort: true,totalRow: true}
                ,{field: 'comdate', title: '投诉日期',  sort: true}
            ]]
            ,id:'listData'
        });
        var $ = layui.$;
        $('#search').on('click', function(){
            var comexpnum = $('#comexpnum');
            //执行重载
            table.reload('listData', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                ,where: {
                    comexpnum: comexpnum.val()
                }
            });
        });
    });

</script>
</html>