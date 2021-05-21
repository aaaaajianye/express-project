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
            <td style="background-color: #c5dbec">录单个数</td>
            <td> ${braexp2.braexludannumber}个</td>
        </tr>
        <tr>
            <td style="background-color: #c5dbec">收单个数</td>
            <td>${braexp2.braexrecnumber}个</td>
        </tr>
        <tr>
            <td style="background-color: #c5dbec">发单个数</td>
            <td>${braexp2.braexsendnumber}个</td>
        </tr>
        <tr>
            <td style="background-color: #c5dbec">到单个数</td>
            <td> ${braexp2.bradaojiannumber}个</td>
        </tr>
        <tr>
            <td style="background-color: #c5dbec">派单个数</td>
            <td> ${braexp2.braextakenumber}个</td>
        </tr>
        <tr>
            <td style="background-color: #c5dbec">签单个数</td>
            <td> ${braexp2.braexqiannumber}个</td>
        </tr>
        <tr>
            <td style="background-color: #c5dbec">问题单个数</td>
            <td style="color: red"> ${braexp2.brawentijiannumber}个</td>
        </tr>
        <tr>
            <td style="background-color: #c5dbec">投诉单个数</td>
            <td style="color: red"> ${braexp2.complaintsnumber}个</td>
        </tr>
    </table>
</div>
<div id="main" style="width: 600px;height:500px;position: absolute;top: 100px;left: 480px"></div>
<script type="text/javascript">
    $(function () {
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
        // 指定图表的配置项和数据
        var option = {
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b}: {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                x: 'left',
                data:['录单个数','收单个数','发单个数','到单个数','派单个数','签单个数','问题单个数','投诉单个数']
            },
            series: [
                {
                    name:'访问来源',
                    type:'pie',
                    radius: ['50%', '70%'],
                    avoidLabelOverlap: false,
                    label: {
                        normal: {
                            show: false,
                            position: 'center'
                        },
                        emphasis: {
                            show: true,
                            textStyle: {
                                fontSize: '30',
                                fontWeight: 'bold'
                            }
                        }
                    },
                    labelLine: {
                        normal: {
                            show: false
                        }
                    },
                    data:[
                        {value: ${braexp2.braexludannumber}, name:'录单个数'},
                        {value: ${braexp2.braexrecnumber}, name:'收单个数'},
                        {value: ${braexp2.braexsendnumber}, name:'发单个数'},
                        {value: ${braexp2.bradaojiannumber}, name:'到单个数'},
                        {value: ${braexp2.braextakenumber}, name:'派单个数'},
                        {value: ${braexp2.braexqiannumber}, name:'签单个数'},
                        {value: ${braexp2.brawentijiannumber}, name:'问题单个数'},
                        {value: ${braexp2.complaintsnumber}, name:'投诉单个数'}
                    ]
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