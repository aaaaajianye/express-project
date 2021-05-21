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

<div style="margin-top: 150px;margin-left: 40px" id="shujuxian">
    <table style="width: 350px;height: 260px;text-align: center;border: 1px solid;margin-left: 70px;line-height: 10px" cellspacing="0">
        <tr>
            <td style="background-color: #c5dbec">录单金额</td>
            <td>${braexp.braexludan}元</td>
        </tr>
        <tr>
            <td style="background-color: #c5dbec">收单金额</td>
            <td>${braexp.braexaddress}元</td>
        </tr>
        <tr>
            <td style="background-color: #c5dbec">发单金额</td>
            <td>${braexp.braexaddresser}元</td>
        </tr>
        <tr>
            <td style="background-color: #c5dbec">到单金额</td>
            <td>${braexp.bradaojian}元</td>
        </tr>
        <tr>
            <td style="background-color: #c5dbec">派单金额</td>
            <td>${braexp.braexdelivery}元</td>
        </tr>
        <tr>
            <td style="background-color: #c5dbec">签单金额</td>
            <td>${braexp.braexsign}元</td>
        </tr>
        <tr>
            <td style="background-color: #c5dbec">问题单金额</td>
            <td style="color: red">${braexp.brawentijian}元</td>
        </tr>
        <tr>
            <td style="background-color: #c5dbec">投诉罚款单金额</td>
            <td style="color: red">${braexp.complaintsmoney}元</td>
        </tr>
    </table>
</div>
<div id="main" style="width: 600px;height:500px;position: absolute;top: 100px;left: 480px"></div>
<script type="text/javascript">
   $(function () {
       var zong= ${braexp.braexludan}+${braexp.braexaddress}+${braexp.braexaddresser}+${braexp.bradaojian}+${braexp.braexdelivery}+${braexp.braexsign}
       var jing=zong-${braexp.brawentijian}-${braexp.complaintsmoney}
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
                       {value:${braexp.braexludan}, name:'录单金额'},
                       {value:${braexp.braexaddress}, name:'收单金额'},
                       {value:${braexp.braexaddresser}, name:'发单金额'},
                       {value:${braexp.bradaojian}, name:'到单金额'},
                       {value:${braexp.braexdelivery}, name:'派单金额'},
                       {value:${braexp.braexsign}, name:'签单金额'},
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
   })

</script>
<script type="text/javascript">

</script>
</body>
</html>