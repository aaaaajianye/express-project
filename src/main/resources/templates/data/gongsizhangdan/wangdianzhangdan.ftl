<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!--引入css文件-->
    <link rel="stylesheet" href="${basePath!}/static/layui/css/layui.css" media="all"/>
    <!--引入js-->

    <script type="text/javascript" src="${basePath!}/static/layui/layui.js"></script>
    <script type="text/javascript" src="${basePath!}/static/js/cache.js"></script>
    <script type="text/javascript" src="${basePath!}/static/js/jquery-2.1.3.min.js"></script>
    <!-- 引入 echarts.js -->
    <script type="text/javascript" src="${basePath!}/static/layui/jquery.min.js"></script>
    <script type="text/javascript" src="${basePath!}/static/layui/echarts.min.js"></script>
</head>
<body>
<div style="height: 50px;margin-left: 550px;margin-top: 50px;font-size: 25px">选择网点进行查询</div>
<div class="layui-input-inline">
    <select name="type" id="type" style="height: 50px;margin-left: 350px;margin-top: 30px">
        <#list wangdianxi as wangdianxi>
            <option value="${wangdianxi.braname}">${wangdianxi.braname}</option>
        </#list>
    </select>

    <button type="button" class="layui-btn layui-btn layui-btn-lg" style="margin-left: 30px"  onclick="chakan()">点击查看账单信息</button>
</div>
<div style="display: none;margin-top: 150px;margin-left: 40px" id="shujuxian">
    <table style="width: 350px;height: 260px;text-align: center;border: 1px solid;margin-left: 70px;line-height: 10px" cellspacing="0">
        <tr>
            <td style="background-color: #c5dbec">录单金额</td>
            <td><input id="braexludan"  style="border: 0px;width: 80px;text-align: right">元</td>
        </tr>
        <tr>
            <td style="background-color: #c5dbec">收单金额</td>
            <td><input id="braexaddress" style="border: 0px;width: 80px;text-align: right">元</td>
        </tr>
        <tr>
            <td style="background-color: #c5dbec">发单金额</td>
            <td><input id="braexaddresser" style="border: 0px;width: 80px;text-align: right">元</td>
        </tr>
        <tr>
            <td style="background-color: #c5dbec">到单金额</td>
            <td><input id="bradaojian" style="border: 0px;width: 80px;text-align: right">元</td>
        </tr>
        <tr>
            <td style="background-color: #c5dbec">派单金额</td>
            <td><input id="braexdelivery" style="border: 0px;width: 80px;text-align: right">元</td>
        </tr>
        <tr>
            <td style="background-color: #c5dbec">签单金额</td>
            <td><input id="braexsign" style="border: 0px;width: 80px;text-align: right">元</td>
        </tr>
        <tr>
            <td style="background-color: #c5dbec">问题单金额</td>
            <td><input id="brawentijian" style="border: 0px;width: 80px;text-align: right;color: red">元</td>
        </tr>
        <tr>
            <td style="background-color: #c5dbec">投诉单金额</td>
            <td><input id="complaintsmoney" style="border: 0px;width: 80px;text-align: right;color: red">元</td>
        </tr>
    </table>
</div>
<div id="main" style="width: 600px;height:500px;position: absolute;top: 180px;left: 480px"></div>
<script type="text/javascript">
    layui.use(['laydate', 'laypage', 'layer', 'table','form'], function() {
        var laydate = layui.laydate //日期
            , laypage = layui.laypage //分页
            , layer = layui.layer //弹层
            , table = layui.table //表格
            , form = layui.form
            , select = layui.select;

    }
    )

    function chakan() {

         var named=$("#type").val();
        $.ajax({
            url:'/gongsi/wangzhang',
            method:'post',
            data:{
                braexname:named
            },
            dataType:'JSON',
            success:function(data){
                $("#braexludan").val(data.braexludan)
                $("#braexaddress").val(data.braexaddress)
                $("#braexaddresser").val(data.braexaddresser)
                $("#bradaojian").val(data.bradaojian)
                $("#braexdelivery").val(data.braexdelivery)
                $("#braexsign").val(data.braexsign)
                $("#brawentijian").val(data.brawentijian)
                $("#complaintsmoney").val(data.complaintsmoney)
                $("#shujuxian").css('display','block');
                var zong= data.braexludan+data.braexaddress+data.braexaddresser+data.bradaojian+data.braexdelivery+data.braexsign
                var jing=zong-data.brawentijian-data.complaintsmoney
                // 基于准备好的dom，初始化echarts实例
                var myChart = echarts.init(document.getElementById('main'));
                // 指定图表的配置项和数据
                var option = {
                    title : {
                        text: '此网点总收益： '+zong+'元',
                        subtext: '此网点净收益： '+jing+'元',
                        x:'center'
                    },
                    tooltip : {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    legend: {
                        orient: 'vertical',
                        left: 'left',
                        data: ['录单金额','收单金额','发单金额','到单金额','派单金额','签单金额']
                    },
                    series : [
                        {
                            name: '访问来源',
                            type: 'pie',
                            radius : '55%',
                            center: ['50%', '60%'],
                            data:[
                                {value:$(" #braexludan ").val(), name:'录单金额'},
                                {value: $("#braexaddress").val(), name:'收单金额'},
                                {value: $("#braexaddresser").val(), name:'发单金额'},
                                {value: $("#bradaojian").val(), name:'到单金额'},
                                {value: $("#braexdelivery").val(), name:'派单金额'},
                                {value: $("#braexsign").val(), name:'签单金额'},
                            ],
                            itemStyle: {
                                emphasis: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 0,
                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                }
                            }
                        }
                    ]
                };

                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);
            },

        }) ;
    }
</script>
<script type="text/javascript">

</script>
</body>
</html>