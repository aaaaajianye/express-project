<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>网点维护</title>
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
<style>
    td{display: block;
    float: left;}
</style>
</head>
<body>
        <center>
        <div style="width: 380px; height: 250px;" >
            <#list offers as offers>
            <form class="layui-form" action="" method="post" >
               <table style="border: 1px">
                   <tr >
                       <td style="width: 150px;">编号</td>
                    <td style="width: 150px;"><input type="text" name="offerid" id="offerid" value="${offers.offerid}"  autocomplete="off" class="layui-input" onfocus=this.blur()></td>
                       </tr>
                   <tr>
                       <td style="width: 150px;">价钱(一公斤以内)</td>
                       <td style="width: 150px; margin-bottom: 10px"><input type="text" name="offerprice" id="offerprice" value="${offers.offerprice}"   autocomplete="off" class="layui-input" lay-verify="required|number"></td>
                   </tr>
                   <tr>
                       <td style="width: 150px;">续重价钱(一公斤以上每斤的价钱)</td>
                       <td style="width: 150px; margin-bottom: 10px"><input type="text" name="offerprice2" id="offerprice2" value="${offers.offerprice2}"   autocomplete="off" class="layui-input" lay-verify="required|number"></td>
                       </tr>
                   <tr>
                       <td style="width: 150px;">预计送达天数</td>
                       <td style="width: 150px; margin-bottom: 10px"><input type="text" name="offerday" id="offerday" value="${offers.offerday}" autocomplete="off" class="layui-input" lay-verify="required|number"></td>
                   </tr>
                   <tr>
                       <td style="row-span: 2">
                           <div class="layui-input-block">
                               <button class="layui-btn" lay-submit lay-filter="tj">确认修改</button>
                               <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                           </div>
                       </td>
                   </tr>
               </table>
            </form>
            </#list>
        </div>

    </div>
        </center>
</body>
<script type="text/javascript">
    var upurl = "{:url('xiaoguotu/upload')}"; //上传图片地址

    layui.use(['upload','table','form'], function(){
        var table = layui.table;
        var upload=layui.upload;
        var form=layui.form;


        form.on('submit(tj)', function(data){
            $.ajax({
                url:'/admin/offer/updatedata',
                method:'post',
                data:{offerid:$("#offerid").val(),
                    offerprice:$("#offerprice").val(),
                    offerprice2:$("#offerprice2").val(),
                    offerday:$("#offerday").val()
                        },
                dataType:'JSON',
                success:function(res){
                    if(res.code='0'){
                        parent.closeIframe(res.msg);
                    }
                    else
                        alert(res.msg);
                },
                error:function (data) {

                }
            });
            var index=parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
            window.parent.location.reload();

        });

    });
</script>
</html>