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

    <script type="text/javascript">
        var defaults = {
            s1: 'provid',
            s2: 'cityid',
            s3: 'areaid',
            v1: null,
            v2: null,
            v3: null
        };
    </script>
<style>
    td{display: block;
    float: left;}
</style>
</head>
<body>
        <div style="width: 100%; height: 560px;float: left; float: right">
            <#list branches as branches>
            <form class="layui-form" action="" method="post" >
               <table>
                   <tr >
                       <td style="width: 300px;margin: 15px"><input type="text" name="bracode" id="bracode" value="${branches.bracode}" placeholder="网点编码" autocomplete="off" class="layui-input" lay-verify="required\number" onfocus=this.blur()></td>
                       <td style="width: 300px;margin: 15px"><input type="text" name="braname" id="braname" value="${branches.braname}"  placeholder="网点名称" autocomplete="off" class="layui-input" lay-verify="required"></td>
                   </tr>
                   <tr>
                       <td style="width: 300px;margin: 15px"><input type="text" name="brasuoshu" id="brasuoshu" value="${branches.brasuoshu}" placeholder="所属网点" autocomplete="off" class="layui-input" disabled></td>

                   </tr>
               </table>

                <table>
                    <tr>
                        <td style="width: 600px;margin: 15px;row-span: 2"><input type="text" name="braaddress"  id="braaddress" value="${branches.braaddress}" placeholder="详细地址" autocomplete="off" class="layui-input" lay-verify="required"></td>
                    </tr>
                    <tr><td style="width: 150px;margin: 15px; margin-bottom: 10px;position: relative;">
                            <select name="type" id="type">
                                <#list tuserTwos as tT>
                                    <option value="${tT.truename}" <#if tT.truename==braprincipal1>selected="selected"</#if>>${tT.truename}</option>
                                </#list>
                            </select></td>
                        <td style="width: 300px;margin: 15px"><input type="text" name="braphone" id="braphone" value="${branches.braphone}" placeholder="电话" autocomplete="off" class="layui-input" lay-verify="required\number\phone" ></td>
                    </tr>
                    <tr>
                        <td style="width: 600px;margin: 15px"><input type="text" name="braremark" id="braremark" value="${branches.braremark}" placeholder="备注" autocomplete="off" class="layui-input" ></td>
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

</body>
<script type="text/javascript">
    var upurl = "{:url('xiaoguotu/upload')}"; //上传图片地址

    layui.use(['upload','table','form'], function(){
        var table = layui.table;
        var upload=layui.upload;
        var form=layui.form;


        form.on('submit(tj)', function(data){
            $.ajax({
                url:'/admin/network/updatedata',
                method:'post',
                data:{bracode:$("#bracode").val(),
                    braname:$("#braname").val(),
                    brasuoshu:$("#brasuoshu").val(),
                    braaddress:$("#braaddress").val(),
                    typetext: $("#type :selected").text(),
                    braphone:$("#braphone").val(),
                    braremark:$("#braremark").val()
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