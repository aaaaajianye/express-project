<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!--引入css文件-->
    <link rel="stylesheet" href="${basePath!}/static/layui/css/layui.css" media="all"/>
    <!--引入js-->

    <script type="text/javascript" src="${basePath!}/static/layui/layui.all.js"></script>
    <script type="text/javascript" src="${basePath!}/static/js/cache.js"></script>
    <script type="text/javascript" src="${basePath!}/static/js/jquery-2.1.3.min.js"></script>
    <!-- 引入 echarts.js -->
    <script type="text/javascript" src="${basePath!}/static/layui/jquery.min.js"></script>
    <script type="text/javascript" src="${basePath!}/static/layui/echarts.min.js"></script>
</head>
<body>
   <div>
   </div>
   <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
   <div id="main" style="width: 700px;height:400px;"></div>
   <table style="width: 570px;height: 70px;text-align: center;border: 1px solid;margin-left: 70px" cellspacing="0">
       <tr>
           <th>录单金额</th>
           <th>收单金额</th>
           <th>发单金额</th>
           <th>到单金额</th>
           <th>派单金额</th>
           <th>签单金额</th>
           <th style="color: red">问题单金额</th>
           <th style="color: red">投诉单金额</th>
       </tr>
       <tr>
           <td>${wangdanxinx.braexludan}元</td>
           <td>${wangdanxinx.braexaddress}元</td>
           <td>${wangdanxinx.braexaddresser}元</td>
           <td>${wangdanxinx.bradaojian}元</td>
           <td>${wangdanxinx.braexdelivery}元</td>
           <td>${wangdanxinx.braexsign}元</td>
           <td style="color: red">${wangdanxinx.brawentijian}元</td>
           <td style="color: red">${wangdanxinx.complaintsmoney}元</td>
       </tr>
   </table>
   <div  style="position: absolute;top: 20px;left: 650px;" >
       <span>公司运单信息</span>
   <table class="layui-table" lay-even lay-skin="nob" id="demo" lay-filter="test"></table></div>
   <script type="text/javascript">
       // 基于准备好的dom，初始化echarts实例
       var myChart = echarts.init(document.getElementById('main'));
       // 指定图表的配置项和数据
       var option = {
           title: {
               text: '公司年度账单'
           },
           tooltip: {},
           legend: {
               data:['收益']
           },
           xAxis: {
               data: ["公司总收入","网点总收入","问题赔付","投诉赔付","网点总赔付","网点净收入","公司净收入"]
           },
           yAxis: {},
           series: [{
               name: '收益',
               type: 'bar',
               data: [${zongshouyi}, ${qixiazong2},${zongpei},${complaintsmoney},${zongpeifu},${qixiajing},${gongsizhong3}]
           }]
       };

       // 使用刚指定的配置项和数据显示图表。
       myChart.setOption(option);
   </script>
   <script type="text/javascript">
       layui.use(['upload','table','form'], function(){
           var table = layui.table;
           var upload=layui.upload;
           var form=layui.form;

           table.render({
               elem:'#demo'
               ,width:650    //jquery的id选择器   也就是table的id
               ,height:350
               ,url: '/admin/express/select'     //数据接口
               //,where:{loanId:$("#loanId").val()}
               ,title: '类型维护'
               ,page:true           //是否开启分页
               ,totalRow: true
               ,limit:10
               ,cols: [[ //表头
                   {type: 'numbers', title: '序列', width:100,fixed:'left',totalRowText: '合计'}
                   ,{field: 'expnum', title: '运单编号', width:100}
                   ,{field: 'exptype', title: '快递类型', width:100}
                   ,{field: 'sendprovince', title: '寄件省份', width:100}
                   ,{field: 'recprovince', title: '收件省份', width:100}
                   ,{field: 'gogalprice', title: '运费价钱', width:100,totalRow: true}
               ]]
               ,id:'listData'
           });

       })
   </script>
</body>
</html>