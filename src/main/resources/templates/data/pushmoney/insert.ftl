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
            <form class="layui-form" action="" method="post" >
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">网点等级：</label>
                        <div class="layui-inline">
                            <input type="text" name="brarank" id="brarank" placeholder="输入数字即可" autocomplete="off" class="layui-input" lay-verify="required">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">录单提成：</label>
                        <div class="layui-inline">
                            <input type="text" name="enroll" id="enroll" placeholder="/元" autocomplete="off" class="layui-input" lay-verify="required">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">收件提成：</label>
                        <div class="layui-inline">
                            <input type="text" name="addressee" id="addressee" placeholder="/元" autocomplete="off" class="layui-input" lay-verify="required">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">发件提成：</label>
                        <div class="layui-inline">
                            <input type="text" name="addresser" id="addresser" placeholder="/元" autocomplete="off" class="layui-input" lay-verify="required">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">到件提成：</label>
                        <div class="layui-inline">
                            <input type="text" name="dao" id="dao" placeholder="/元" autocomplete="off" class="layui-input" lay-verify="required">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">派件提成：</label>
                        <div class="layui-inline">
                            <input type="text" name="pai" id="pai" placeholder="/元" autocomplete="off" class="layui-input" lay-verify="required">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">签收提成：</label>
                        <div class="layui-inline">
                            <input type="text" name="qian" id="qian" placeholder="/元" autocomplete="off" class="layui-input" lay-verify="required">
                        </div>
                    </div>
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="tj">确认提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
</body>
<script type="text/javascript">
    var upurl = "{:url('xiaoguotu/upload')}"; //上传图片地址

    layui.use(['upload','table','form'], function(){
        var table = layui.table;
        var upload=layui.upload;
        var form=layui.form;


        form.on('submit(tj)', function(data){
            $.ajax({
                url:'/admin/pushmoney/insertPushmoney',
                method:'post',
                data:{brarank:$("#brarank").val(),
                    enroll:$("#enroll").val(),
                    addressee:$("#addressee").val(),
                    addresser:$("#addresser").val(),
                    dao:$("#dao").val(),
                    pai:$("#pai").val(),
                    qian:$("#qian").val()


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
            window.parent.location.reload();
            var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);

        });

    });
</script>
</html>