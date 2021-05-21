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
        <div style="width: 100%; height: 400px;float: left; float: right">
            <form class="layui-form" action="" method="post" >
               <table>
                   <tr >
                    <td style="width: 300px;margin: 15px"><div class="layui-form-item">
                            <div class="layui-input-inline">
                                <select name="provid" id="offersend" lay-filter="provid">
                                    <option>请选择寄件省份</option>
                                </select>
                            </div></div></td>
                       <td style="width: 300px;margin: 15px">
                           <div class="layui-form-item">
                           <div class="layui-input-inline">
                               <select name="provid" id="offergoal" lay-filter="provid">
                                   <option>请选择目的省份</option>
                               </select>
                           </div></div>
                       </td>
                   </tr>
                   <tr >
                       <td style="width: 300px;margin: 15px"><input type="text" name="offerprice" id="offerprice"  placeholder="价钱(一公斤以内)" autocomplete="off" class="layui-input" lay-verify="required|number"></td>
                       <td style="width: 300px;margin: 15px"><input type="text" name="offerprice2" id="offerprice2"  placeholder="续重价钱(一公斤以上每斤的价钱)" autocomplete="off" class="layui-input" lay-verify="required|number"></td>
                   </tr>
                   <tr ><td style="width: 300px;margin: 15px"><select name="custrank" id="custrank">
                               <option value="1">普通客户</option>
                               <option value="2">高级客户</option>
                           </select></td>
                       <td style="width: 300px;margin: 15px"><input type="text" name="offerday" id="offerday"  placeholder="预计送达天数" autocomplete="off" class="layui-input" lay-verify="required"></td>
                       <td style="width: 300px;margin: 15px"><select name="transid" id="transid">
                               <option value="1">飞机</option>
                               <option value="2">汽车</option>
                           </select></td></td>
                   </tr>
                   <tr>
                       <td style="row-span: 2">
                           <div class="layui-input-block">
                               <button class="layui-btn" lay-submit lay-filter="tj">确认添加</button>
                               <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                           </div>
                       </td>
                   </tr>
               </table>
            </form>

        </div>

    </div>

</body>
<script type="text/javascript">
    var upurl = "{:url('xiaoguotu/upload')}"; //上传图片地址

    layui.use(['upload','layer','table','form'], function(){
        var table = layui.table;
        var upload=layui.upload;
        var layer=layui.layer;
        var form=layui.form;

        form.on('submit(tj)', function(data){
                        $.ajax({
                            url:'/admin/offer/insertOffer',
                            method:'post',
                            data:{
                                offersend:$("#offersend option:selected").text(),
                                offergoal:$("#offergoal option:selected").text(),
                                offerprice:$("#offerprice").val(),
                                offerprice2:$("#offerprice2").val(),
                                custrank:$("#custrank option:selected").val(),
                                offerday:$("#offerday").val(),
                                transid:$("#transid").val()
                            },
                            dataType:'JSON',
                            success:function(data){
                                if(data>0){
                                    layer.msg("此条信息已经有了",{
                                        icon: 5,
                                        time: 1000 //2秒关闭（如果不配置，默认是3秒）
                                    });
                                }
                                else{
                        //刷新父页面
                        parent.window.location.reload();
                }
               }
            });
            return false;
        });

    });
</script>
</html>